#!/usr/bin/bash

echo '  ____                _     '
echo ' |  _ \ __ ___      _| | __ '
echo ' | |_) / _` \ \ /\ / / |/ / '
echo ' |  _ < (_| |\ V  V /|   <  '
echo ' |_| \_\__,_| \_/\_/ |_|\_\ '
echo ' '
echo '======= Setup Script ========'

# Create required Directories if they don't exist
if [ -d ~/.local/bin ]; then echo "[+] .local/bin Exists"; else mkdir ~/.local/bin; fi
if [ -d ~/.local/icons ]; then echo "[+] .local/icons"; else mkdir ~/.local/icons; fi
if [ -d ~/.local/share/applications ]; then echo "[+] .local/share/applications Exists"; else mkdir -p ~/.local/share/applications; fi
if [ -d ~/.vim/colors ]; then echo "[+] .vim/colors Exists"; else mkdir -p ~/.vim/colors; fi

# Setup Obsidian
curl https://github.com/obsidianmd/obsidian-releases/releases/download/v0.11.9/Obsidian-0.11.9.AppImage -o ~/.local/bin/Obsidian
chmod +x ~/.local/bin/Obsidian
curl https://github.com/rawk77/blob/raw/master/Obsidian.png -o ~/.local/icons/Obsidian.png
curl https://raw.githubusercontent.com/rawk77/blob/master/Obsidian.desktop -o ~/.local/share/applications/Obsidian.desktop

# Setup dotfiles
echo 'Downloading configuration files'
curl https://raw.githubusercontent.com/rawk77/blob/master/gdbinit -o ~/.gdbinit
curl https://raw.githubusercontent.com/rawk77/blob/master/tmux.conf -o ~/.tmux.conf
curl https://raw.githubusercontent.com/rawk77/blob/master/vimrc -o ~/.vimrc
curl https://raw.githubusercontent.com/rawk77/blob/master/vpnpanel.sh -o ~/.local/vpnpanel.sh
chmod +x ~/.local/vpnpanel.sh

# Vim Color Schemes
curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim -o ~/.vim/colors/badwolf.vim
curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -o ~/.vim/colors/solarized.vim

