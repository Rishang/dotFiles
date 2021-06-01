#!/usr/bin/bash

# update all docker images
function update_docker_pull() {
    echo "This may create errors: Do you still want to continue (Y/N)"
	read ans
    if ! [[ $ans == "y" || $ans == "Y" ]];then
        exit
    fi
	for image in  $(docker images --format '{{.Repository}} {{.Tag}} {{.Digest}}' | grep -v "none" | awk '{print $1":"$2}');do
		 docker pull $image;
	done
}

# update all pip packages
function update_all_pip_packages() {
    pip="pip"
    if ! [[ `which $pip` ]];then
        $pip=pip3
    fi
    $pip install -U pip
    echo "This may create errors: Do you still want to continue (y/n):"
	read ans
    if ! [[ $ans == "y" || $ans == "Y" ]];then
        exit
    fi
	$pip list -o | sed -e '/\(Package.*\)\|\(----\)/d' | awk '{print $1}' > /tmp/pipr.txt && pip install -U -r /tmp/pipr.txt
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
