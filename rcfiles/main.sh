#!/usr/bin/bash
# set -x
source ~/.my-config/rcfiles/exports.sh
source ~/.my-config/rcfiles/bash-aliases.sh
source ~/.my-config/rcfiles/bash-functions.sh
source ~/.my-config/rcfiles/completions.sh
source ~/.my-config/rcfiles/vars.sh

if [[ -e "/etc/os-release" ]];then

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

fi

if [[ -d /home/linuxbrew/.linuxbrew ]];then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
