# dotFiles

Dotfiles for bash/zsh. Clone at `~/.my-config` and source from your shell rc.

---

## Table of contents

- [Installation](#installation)
- [Aliases](#aliases)
- [Variables](#variables)
- [Functions](#functions)
- [Completions](#completions)
- [Optional: Zsh plugins](#optional-zsh-plugins)

---

## Installation

```bash
git clone https://github.com/Rishang/dotFiles.git ~/.my-config
```


Add to `~/.bashrc` or `~/.zshrc`:

```bash
[ -f ~/.my-config/rcfiles/main.sh ] && source ~/.my-config/rcfiles/main.sh
```

---

## Aliases

- `l`, `la`, `ll` :  ls variants
- `..`, `...`, `....` :  cd up
- `clr` :  clear
- `grep` :  with color
- `bat`, `batview` :  bat + fzf preview
- `btop` :  bpytop
- `k`, `kc` :  kubectl
- `myip`, `dig` :  short output
- `open-git-url`, `fhistory` :  git URL in browser, zsh history + fzf
- `dangling-rmi-docker` :  remove dangling docker images
- Distro-specific: `update`, `upgrade`, `autoremove` (Arch/Debian/Ubuntu/Fedora)



## Variables

- Man page colors (`LESS_TERMCAP_*`)
- `LC_ALL=en_US.UTF-8`
- `GOPATH`, PATH (bin, .local/bin, go, cargo, krew, pulumi, etc.)
- `DOCKER_BUILDKIT=1`
- NVM setup when present
- Grep regex vars: `grep_strings`, `grep_ip`, `grep_jwt`, `grep_urls`, `grep_email`, `grep_secret`, `grep_aws_access_key`



## Functions

- `__upgrade` :  brew / snap / flatpak
- `__update_docker_pull`, `__update_all_git`, `__update_all_pip`, `__update_awscli`
- `getup` :  tmux + takeBreak (start/stop)
- `open-multi-tabs` :  open URLs or search from stdin/file
- `caffine` :  GNOME screen blank on/off
- `venv-pip` :  create venv and activate
- `__cleanup` :  find/remove Python cache dirs
- `temp-clone`, `temp-dir`, `temp-notebook` :  temp dirs and jupyter

---

## Completions

- Shell-specific: `~/.bash_completion` (bash), `~/.zfunc` (zsh)
- Homebrew completions when brew is available
- zoxide, aws, gf, terraform, kubectl, docker, helm, task, glab (bash), NVM

---

## Optional: Zsh plugins

```zsh
plugins=(zsh-autosuggestions dotenv extract tmux web-search dnf)
```
