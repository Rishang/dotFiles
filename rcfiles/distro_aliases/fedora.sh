# upgrade
alias upgrade="sudo dnf update; (command -v flatpak && sudo flatpak update); (command -v snap && sudo snap update)"
