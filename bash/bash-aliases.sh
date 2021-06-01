#!/usr/bin/bash

# clear
alias clr='clear'

# pull_my_config
alias pull_my_config='cd ~/.my-config;git pull origin master;cd -'

# apt update
alias update='sudo apt update'

# apt upgrade
alias upgrade='sudo apt update;sudo apt full-upgrade --fix-policy --fix-broken -y'

# terminal theme
alias ttheme='echo -e "go to http://mayccoll.github.io/Gogh/ \n press any key to continue"; read ;bash -c  "$(wget -qO- https://git.io/vQgMr)"'

# IDA start
# https://hex-rays.com/ida-free/#download
alias ida='sudo /opt/idafree-*/./ida64'

# terminal color
alias term-color='x-www-browser "https://mayccoll.github.io/Gogh/" & bash -c "$(curl -sLo- https://git.io/vQgMr)"'

# xdm
# requires: https://xtremedownloadmanager.com/
alias xdm="java -jar ~/xdman.jar"

# doker rmi dangling
alias dangling-rmi-docker='docker rmi `docker images --filter dangling=true -q`'

# takeBreak alias
# requires: tmux
# requires: https://github.com/Rishang/scripts/tree/master/takeBreak
alias getup='echo GetUp Every 30-min ;tmux new-session -d -s getUP ~/.takeBreak/getUp.sh'

# the fuck
# requires : pip3 install thefuck
eval "$(thefuck --alias)"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
