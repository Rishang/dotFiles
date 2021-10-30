
#! /usr/bin/bash
set -x

# ------ utils -----------

# pull git repo
function _get_repo {
    # $1 repo url, $2 repo dir name

    if [[ -e $2 ]];then
        cd $2; git pull; cd -; return 0
    else
        git clone --depth=1 $1 $2; return 1
    fi
}


# ------ main -----------

# https://github.com/gpakosz/.tmux
function _tmux_conf {

    _get_repo https://github.com/gpakosz/.tmux.git ~/.oh-my-tmux && return 0
    [[ -e  ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.bak
    ln -s -f ~/.oh-my-tmux/.tmux.conf ~/.tmux.conf
}

# https://github.com/amix/vimrc
function _vim_conf {
    
    _get_repo https://github.com/amix/vimrc.git ~/.vim_runtime && return 0
    cd ~/.vim_runtime;sh ~/.vim_runtime/install_awesome_vimrc.sh; cd -
}

# https://github.com/ryanoasis/nerd-fonts
function _nerd_fonts {
    
    [[ -e "$HOME/.local/share/fonts/NerdFonts" ]] && return 0
    _get_repo https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd_fonts
    cd /tmp/nerd_fonts; bash install.sh; cd -
}

# https://github.com/ohmyzsh/ohmyzsh
function _oh_zsh {

    [[ $(command -v zsh) ]] || return 1
    
    zsh_theme_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
    
    # zsh theme https://github.com/romkatv/powerlevel10k
    _get_repo https://github.com/romkatv/powerlevel10k.git "${zsh_theme_path}/powerlevel10k"
}


# ------ exec -----------

# _tmux_conf
# _vim_conf
# _oh_zsh
# _nerd_fonts
