# update
alias update='sudo pacman -Syy'

# upgrade
alias upgrade='sudo pacman -Syu;([[ $(which snap) ]] && sudo snap refresh);([[ $(which flatpak) ]] && sudo flatpak upgrade)'

# autoremove non depended packager
alias autoremove='sudo pacman -R $(pacman -Qdtq)'
