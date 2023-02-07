#!/usr/bin/bash

function _ask_continue {
    read ans
    if ! [[ $ans == "y" || $ans == "Y" ]];then
		exit
    fi
}

function __upgrade {
    [[ `command -v brew` ]] && brew upgrade
    [[ `command -v snap` ]] && sudo snap refresh
    [[ `command -v flatpak` ]] && sudo flatpak upgrade
}

# update all docker images
function __update_docker_pull() {
    echo "This may create errors: Do you still want to continue (y/n):"
	_ask_continue

	for image in  $(docker images --format '{{.Repository}} {{.Tag}} {{.Digest}}' | grep -v "none" | awk '{print $1":"$2}');do
		 docker pull $image;
	done
}

# update all git dirs
function update_all_git() {
    for i in `find . -type d -name ".git" | grep  -oE ".+[^\.git]"`;do
        cd ${i}
        echo "$i"
        git pull origin
        cd -
    done
}

# update all pip packages
function __update_all_pip() {
    pip="pip"
    if ! [[ `which $pip` ]];then
        $pip=pip3
    fi
    $pip install -U pip
    echo "This may create errors: Do you still want to continue (y/n):"
	_ask_continue

	$pip list --user -o | sed -e '/\(Package.*\)\|\(----\)/d' | awk '{print $1}' > /tmp/pipr.txt && pip install -U -r /tmp/pipr.txt
}

# open multiple chrome tabs
function open-multi-tabs() (

    function _browser_open() {

        if [[ `echo $1 | grep -E "^https?://"` ]];then
            echo $1
            x-www-browser $1 $2 &> /dev/null
        elif ! [[ `echo $1 | grep -E ".+"` ]]; then
        	sleep 0
        else
        	echo "$*"
        	x-www-browser "https://www.google.com/search?q=$*" &> /dev/null
        fi
    }

    local tab_path=/tmp/open-multi-tabs

    if [ -t 0 ] ;then
        vim $tab_path && touch $tab_path
        if [[ `du $tab_path | grep -oE "^0"` ]];then exit 0;fi

        x-www-browser &> /dev/null &
        while read -r query;do
            _browser_open $query
        done < $tab_path

    else
    	x-www-browser &> /dev/null &
        while read -r query;do
            _browser_open $query
        done
    fi
    echo
)

# caffine | Turn on/off Black-Screen timer
function caffine () {

    l_path=~/.config
    l_file=$l_path/caffine

    eval "touch $l_file || ( mkdir $l_path ; touch $l_file )"

    case $1 in

        "on" | "On" | "ON")

            curr_delay=$(gsettings get org.gnome.desktop.session idle-delay) # uint32 ${seconds}
            echo "curr_delay $curr_delay" > $l_file
            cat $l_file
            eval "gsettings set org.gnome.desktop.session idle-delay 0"
            echo "Black-Screen delay set to never"

        ;;

        "off" | "Off" | "OFF")
            old_delay=$(cat $l_file | grep "curr_delay" | awk '{print $3}' )
            eval "gsettings set org.gnome.desktop.session idle-delay $old_delay"
            echo "Black-Screen delay set to $old_delay sec"
        ;;

        "show" | "Show" | "SHOW")
            gsettings get org.gnome.desktop.session idle-delay
        ;;


        *)
            # --help
            echo -e "caffine | Turn on/off Black-Screen timer  \n"
            echo "on   - Turn off Black-Screen timer"
            echo "off  - Set timer of Black-Screen timer to previous timer"
            echo "show - shows current Black-Screen timer"
            echo "help - help"
        ;;
    esac
}

# python venv
function venv-pip {
    envname=${1:-".venv"}
	python -m venv $envname
	source $PWD/$envname/bin/activate
}

function temp-clone {
    tmp_dir=/tmp/`echo "$1" | cut -d '/' -f5 | cut -d '.' -f1`
    git clone --depth=1 $1 $tmp_dir && ([[ `which code` ]] && code $tmp_dir)
}

function temp-notebook {
    tmp_dir=/tmp/notebook_`pwgen | cat`
    [[ `which  jupyter-notebook` ]]  && (mkdir $tmp_dir; jupyter-notebook $tmp_dir)
}


function __update_awscli() {
    cd /tmp
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    if ! [[ `which aws` ]];then
        sudo ./aws/install
    else
        aws --version
        sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
    fi
}

# function kubens {
#     ns=`kubectl get ns -ojson | jq -r '.items[].metadata.name' | fzf -e --ansi --prompt="Select namespace: "`
#     kubectl config set-context --current --namespace $ns
#     echo "Switched to namespace: \"$ns\"."
# }
