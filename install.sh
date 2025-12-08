#!/bin/bash

#full upgrade update
sudo apt update && sudo apt upgrade -y
echo "[+] System updated"

#common tools
sudo apt install $(cat tools.txt | tr "\n" " ") -y
echo "[+] Tools are installed"

#docker
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
echo "[+] Docker" 

#sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt-get install sublime-text

#tmux logging
git clone "https://github.com/tmux-plugins/tpm" ~/.tmux/plugins/tpm
mv -iv ./Tools/.tmux.conf ~/

#terminal config
cp ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.bak
mv -iv ./Tools/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/


#other tools
mkdir -p  ~/Documents/Tools
cd ~/Documents/Tools

#nmap parser
git clone "https://github.com/ernw/nmap-parse-output.git" 



#extra- portwfigger sert for burp; terminal config';
