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

