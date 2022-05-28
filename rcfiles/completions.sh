# linux brew

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


[[ `type zoxide` ]] && eval "$(zoxide init zsh)"
[[ `type aws` ]] && complete -C `which aws_completer` aws
[[ `type gf` ]] && complete -W "$(gf -list)" gf
[[ `type terraform` ]] && complete -o nospace -C /usr/bin/terraform terraform
