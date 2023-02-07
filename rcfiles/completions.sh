#!/bin/bash

THIS_SHELL=$(ps -p $$ | awk '{print $4}' | tail -n 1 | grep -oE "[a-z]+")

if type autoload &>/dev/null; then
  autoload -U +X bashcompinit && bashcompinit
  autoload -Uz compinit && compinit
fi

if [[ $THIS_SHELL == "zsh" && -d $HOME/.zfunc ]];then
  source $HOME/.zfunc/*
elif [[ $THIS_SHELL == "bash" && -d $HOME/.bash_completion ]];then
  source $HOME/.bash_completions/*.sh
fi

if [[ $commands[brew] ]];then
  if [[ $THIS_SHELL == "bash" ]];then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
    then
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
      do
        [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
      done
    fi
  fi
fi

[[ $commands[zoxide] ]] && eval "$(zoxide init $THIS_SHELL)"
[[ $commands[aws] ]] && complete -C `which aws_completer` aws
[[ $commands[gf] ]] && complete -W "$(gf -list)" gf
[[ $commands[terraform] ]] && complete -o nospace -C `which terraform` terraform
[[ $commands[kubectl] ]] && source <(kubectl completion $THIS_SHELL)
[[ $commands[helm] ]] && source <(helm completion $THIS_SHELL)

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
