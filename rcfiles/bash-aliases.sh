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
alias term-color='xdg-open "https://gogh-co.github.io/Gogh/" & bash -c "$(curl -sLo- https://git.io/vQgMr)"'

# alias grep to grep --color=auto
alias grep="grep --color=auto"

# xdm
# requires: https://xtremedownloadmanager.com/
alias xdm="java -jar ~/xdman.jar"

# doker rmi dangling
alias dangling-rmi-docker='docker rmi `docker images --filter dangling=true -q`'

# batcat view
alias batview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# sys monitor
alias btop="bpytop"

# kubeclt
alias kc="kubectl"

# https://github.com/filebrowser/filebrowser
alias filebrowser="filebrowser --database ~/.config/filebrowser.db"

alias myip="curl https://ipconfig.io"

alias open-git-url='git remote -v | grep -ioE "https[^ ]+" | sort -u | xargs xdg-open'


alias fhistory="cat ~/.zsh_history | cut -d ';' -f2- | sort -u | fzf -e "

alias k="kubectl"

# due to wayland crap
alias screen2txt="sleep 1;bash $HOME/.local/opt/screenshot2text/start.sh"


alias _tunnel_cloudflare="echo 'curl -sS https://gitlab.com/-/snippets/2552034/raw/main/cloudflare_ssh.sh | bash'"

alias screenshot2text='ss_name="/tmp/screenshot_$RANDOM.png" && sleep 2 && flameshot gui -r > $ss_name && tesseract "$ss_name" stdout > "$ss_name.txt" && gnome-text-editor "$ss_name.txt" &'

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
