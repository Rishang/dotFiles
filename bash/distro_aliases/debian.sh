# update
alias update='sudo apt update'

# upgrade
alias upgrade='sudo apt update;sudo apt full-upgrade --fix-policy --fix-broken -y;([[ $(which snap) ]] && sudo snap refresh);([[ $(which flatpak) ]] && sudo flatpak upgrade)'

# autoremove non depended packager
alias autoremove='sudo apt autoremove'
