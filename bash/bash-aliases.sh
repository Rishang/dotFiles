#!/usr/bin/bash

# ls
alias l='ls'
alias la='ls -a'
alias ll='ls -lah'

# clear
alias clr='clear'

# apt update
alias update='sudo apt update'

# apt upgrade
alias upgrade='sudo apt update;sudo apt full-upgrade --fix-policy --fix-broken -y;([[ $(which snap) ]] && sudo snap refresh)'

# autoremove
alias autoremove='sudo apt autoremove'

# IDA start
# https://hex-rays.com/ida-free/#download
alias ida='sudo /opt/idafree-*/./ida64'

# colorful cat
alias bcat="bat"

# terminal color for gnome-terminal
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

# batcat view
alias batview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# sys monitor
alias btop="bpytop"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
