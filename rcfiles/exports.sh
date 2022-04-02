#!/usr/bin/bash

# man page color theme

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


export LC_ALL=en_US.UTF-8

#Go path
export GOPATH="$HOME/go"

# paths
export PATH=~/.local/bin:~/linuxbrew/.linuxbrew/bin:$GOPATH/bin:~/.pulumi/bin:$PATH

# Docker buildkit
export DOCKER_BUILDKIT=1