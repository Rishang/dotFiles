# update
alias update='sudo pacman -Syy'

# upgrade
alias upgrade='sudo pacman -Syu;__upgrade'

# autoremove non depended packager
alias autoremove='sudo pacman -R $(pacman -Qdtq)'
