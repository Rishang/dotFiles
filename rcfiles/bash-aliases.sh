#!/usr/bin/bash

# ls
alias l='ls'
alias la='ls -a'
alias ll='ls -lah'

# clear
alias clr='clear'

# IDA start
# https://hex-rays.com/ida-free/#download
alias ida='sudo /opt/idafree-*/./ida64'

# colorful cat
alias bcat="bat"

# terminal color for gnome-terminal
alias term-color='x-www-browser "https://gogh-co.github.io/Gogh/" & bash -c "$(curl -sLo- https://git.io/vQgMr)"'

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

# kubeclt
alias kc="kubectl"

# https://github.com/Rishang/install-release
alias ir=install-release

# https://github.com/filebrowser/filebrowser
alias filebrowser="filebrowser --database ~/.config/filebrowser.db"

alias myip="curl https://ipconfig.io"

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
