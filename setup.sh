#!/usr/bin/bash

echo '  ____                _     '
echo ' |  _ \ __ ___      _| | __ '
echo ' | |_) / _` \ \ /\ / / |/ / '
echo ' |  _ < (_| |\ V  V /|   <  '
echo ' |_| \_\__,_| \_/\_/ |_|\_\ '
echo ' '
echo '======= Setup Script ========'

# Install Programs
echo "[+] Installing Terminator"
sudo apt install terminator -y

# Create required Directories if they don't exist
if [ -d ~/.vim/colors ]; then echo "[+] .vim/colors Exists"; else mkdir -p ~/.vim/colors; fi
if [ -d ~/.config/terminator ]; then echo "[+] .config/terminator"; else mkdir -p ~/.config/terminator; fi

# Setup dotfiles
echo 'Downloading configuration files'
curl -s https://raw.githubusercontent.com/rawk77/blob/master/gdbinit -o ~/.gdbinit
curl -s https://raw.githubusercontent.com/rawk77/blob/master/tmux.conf -o ~/.tmux.conf
curl -s https://raw.githubusercontent.com/rawk77/blob/master/vimrc -o ~/.vimrc
curl -s https://raw.githubusercontent.com/rawk77/blob/master/vpnpanel.sh -o ~/.local/vpnpanel.sh
chmod +x ~/.local/vpnpanel.sh

# Vim Color Schemes
curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim -o ~/.vim/colors/badwolf.vim
curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -o ~/.vim/colors/solarized.vim

# Vim-Plug Install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Microsoft Fonts
sudo apt install ttf-mscorefonts-installer
wget -q -O - https://gist.githubusercontent.com/Blastoise/72e10b8af5ca359772ee64b6dba33c91/raw/2d7ab3caa27faa61beca9fbf7d3aca6ce9a25916/clearType.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/b74e06f739610c4a867cf94b27637a56/raw/96926e732a38d3da860624114990121d71c08ea1/tahoma.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/64ba4acc55047a53b680c1b3072dd985/raw/6bdf69384da4783cc6dafcb51d281cb3ddcb7ca0/segoeUI.sh | bash
#sudo fc-cache -fv
