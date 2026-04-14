#!/bin/bash

#full upgrade update
sudo apt update && sudo apt upgrade -y
echo "[+] System updated"

#common tools
grep -v "#" tools.txt | tr "\n" " " > tools
sudo apt install $(cat tools) -y
echo "[+] Tools are installed"

#docker
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
echo "[+] Docker" 

#sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt-get update
sudo apt-get install sublime-text

#tmux logging
git clone "https://github.com/tmux-plugins/tpm" ~/.tmux/plugins/tpm
cp ./Configs/.tmux.conf ~/


echo "Other tools:" 

#other tools
mkdir -p  ~/Documents/Tools
cd ~/Documents/Tools

#nmap parser
git clone "https://github.com/ernw/nmap-parse-output.git" 
#sudo mv nmap-parse-output nmp && mv nmp /opt/
#sudo ln -ls /opt/mytool /usr/local/bin/mytool

## Web ##
#PD tools
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
echo 'export PATH=$PATH:/home/kali/.pdtm/go/bin' >> ~/.zshrc
echo 'export PATH=$PATH:/home/kali/go/bin' >> ~/.zshrc
source ~/.zshrc

#Gowitness
go install github.com/sensepost/gowitness@latest

## AD ##
wget "https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64"
sudo mv kerbrute_linux_amd64 /opt/kerbrute && chmod u+x /opt/kerbrute
echo "[+] Kerbrute"

## UI ##
mkdir -p ~/.config/picom
cp ./Configs/picom.conf ~/.config/picom/picom.conf

# I3
mkdir -p ~/.config/i3
cp ./Configs/i3/conf ~/.config/i3/conf

# Other
