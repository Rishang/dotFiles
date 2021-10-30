#! /usr/bin/bash
set -x

function _tmux_conf {
    git clone https://github.com/gpakosz/.tmux.git ~/.oh-my-tmux || (cd ~/.oh-my-tmux; git pull; cd -)

    [[ -e  ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.bak

    ln -s -f ~/.oh-my-tmux/.tmux.conf ~/.tmux.conf
}

_tmux_conf