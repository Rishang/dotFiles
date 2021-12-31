#!/usr/bin/bash

source ~/.my-config/bash/exports.sh

_distro_name=$(cat /etc/os-release | grep "ID_LIKE" | cut -d "=" -f 2)
case $_distro_name in

  "arch")
    source ~/.my-config/bash/distro_aliases/arch.sh
    ;;

  "debian" | "ubuntu")
    source ~/.my-config/bash/distro_aliases/debian.sh
    ;;
  *)
    echo
    ;;
esac


source ~/.my-config/bash/bash-aliases.sh
source ~/.my-config/bash/bash-functions.sh
source ~/.my-config/bash/vars.sh

[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
