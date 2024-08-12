# Fail on any command.
set -eux pipefail
#apt cleanup commands
sudo apt update 
sudo apt upgrade -y
sudo apt autoclean
sudo apt autoremove
#snap cleanup commands
sudo snap refresh
