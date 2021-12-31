#!/usr/bin/bash

source ~/.my-config/rcfiles/exports.sh

_distro_name=$(cat /etc/os-release | grep "ID_LIKE" | cut -d "=" -f 2)
case $_distro_name in

  "arch")
    source ~/.my-config/rcfiles/distro_aliases/arch.sh
    ;;

  "debian" | "ubuntu")
    source ~/.my-config/rcfiles/distro_aliases/debian.sh
    ;;
  *)
    echo
    ;;
esac


source ~/.my-config/rcfiles/bash-aliases.sh
source ~/.my-config/rcfiles/bash-functions.sh
source ~/.my-config/rcfiles/vars.sh

[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
