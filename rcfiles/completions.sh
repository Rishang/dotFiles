# linux brew

THIS_SHELL=$(ps -p $$ | awk '{print $4}' | tail -n 1)

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit

if type brew &>/dev/null
then
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


[[ $commands[zoxide] ]] && eval "$(zoxide init $THIS_SHELL)"
[[ $commands[aws] ]] && complete -C `which aws_completer` aws
[[ $commands[gf] ]] && complete -W "$(gf -list)" gf
[[ $commands[terraform] ]] && complete -o nospace -C `which terraform` terraform
[[ $commands[kubectl] ]] && source <(kubectl completion $THIS_SHELL)
[[ $commands[helm] ]] && source <(helm completion $THIS_SHELL)
