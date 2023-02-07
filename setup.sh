
#! /usr/bin/bash
set -x

# ------ utils -----------
cwd=$PWD

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

    mkdir -p ~/.config/terminator
    _get_repo https://github.com/gpakosz/.tmux.git ~/.oh-my-tmux && return 0
    [[ -e  ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.bak
    ln -s -f ~/.oh-my-tmux/.tmux.conf ~/.tmux.conf
}

# https://github.com/amix/vimrc
function _vim_conf {
    
    # VIM UI and plugins
    _get_repo https://github.com/amix/vimrc.git ~/.vim_runtime
    cd ~/.vim_runtime;sh ~/.vim_runtime/install_awesome_vimrc.sh; cd -
    
    # https://github.com/VundleVim/Vundle.vim
    _get_repo https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Vim AutoComplete YouCompleteMe 
    # not needed if using vscode daily
    # _get_repo https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe && return 0
    # cd ~/.vim/bundle/YouCompleteMe/; ./install.py --all; cd -
    
    cat "$cwd/templates/vim/.vimrc" > ~/.vim_runtime/my_configs.vim
}

# https://github.com/ryanoasis/nerd-fonts
function _nerd_fonts {
    
    [[ -e "$HOME/.local/share/fonts/NerdFonts" ]] && return 0
    _get_repo https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd_fonts
    bash /tmp/nerd_fonts/install.sh;
}

# https://github.com/ohmyzsh/ohmyzsh
function _oh_zsh {

    [[ $(command -v zsh) ]] || return 1
    
    zsh_theme_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
    if ! [[ -e .zshrc.pre-oh-my-zsh ]];then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
    fi
    
    if ! [[ -e "${zsh_theme_path}/powerlevel10k" ]];then
        # zsh theme https://github.com/romkatv/powerlevel10k
        _get_repo https://github.com/romkatv/powerlevel10k.git "${zsh_theme_path}/powerlevel10k"
    fi
}

# terminator
function _terminator_conf {
    [[ $(which terminator) ]] || return 1
    cp $cwd/templates/terminator/config ~/.config/terminator/config
}

# ------ exec -----------

# _tmux_conf
# _vim_conf
# _oh_zsh
# _nerd_fonts
# _terminator_conf
