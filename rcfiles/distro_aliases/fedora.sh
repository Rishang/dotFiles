# upgrade
alias upgrade="sudo yum update; (command -v flatpak && sudo flatpak update); (command -v snap && sudo snap update)"
