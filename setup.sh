#!/usr/bin/bash

echo '  ____                _     '
echo ' |  _ \ __ ___      _| | __ '
echo ' | |_) / _` \ \ /\ / / |/ / '
echo ' |  _ < (_| |\ V  V /|   <  '
echo ' |_| \_\__,_| \_/\_/ |_|\_\ '
echo ' '
echo '======= Setup Script ========'

# Install Programs
echo "[+] Installing Neovim"
sudo apt install neovim

echo "[+] Setting up Neovim"
echo "[*] Creating Neovim directories"
if [ -d ~/.config/nvim ]; then echo "[*] .config/nvim Exists"; else mkdir -p ~/.config/nvim; fi
if [ -d ~/.config/nvim/lua ]; then echo "[*] .config/nvim/lua Exists"; else mkdir -p ~/.config/nvim/lua; fi
if [ -d ~/.config/nvim/plugin ]; then echo "[*] .config/nvim/plugin Exists"; else mkdir -p ~/.config/nvim/plugin; fi

# Install Packer for plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Download the init.lua config file
curl -s https://raw.githubusercontent.com/rawk77/blob/master/neovim/init.lua -o ~/.config/nvim/init.lua
echo "alias vim=nvim" >> ~/.zshrc
source ~/.zshrc

# Setup dotfiles
echo '[*] Downloading configuration files'
curl -q -s https://raw.githubusercontent.com/rawk77/blob/master/gdbinit -o ~/.gdbinit
curl -q -s https://raw.githubusercontent.com/rawk77/blob/master/tmux.conf -o ~/.tmux.conf
curl -q -s https://raw.githubusercontent.com/rawk77/blob/master/vpnpanel.sh -o ~/.local/vpnpanel.sh
chmod +x ~/.local/vpnpanel.sh

# Install Fonts
wget -q https://github.com/rawk77/blob/raw/master/fonts/Hack-Bold.ttf -P ~/.local/share/fonts/
wget -q https://github.com/rawk77/blob/raw/master/fonts/Hack-BoldItalic.ttf -P ~/.local/share/fonts/
wget -q https://github.com/rawk77/blob/raw/master/fonts/Hack-Regular.ttf -P ~/.local/share/fonts/
sudo fc-cache -fv

# Install Microsoft Fonts
sudo apt install ttf-mscorefonts-installer
wget -q -O - https://gist.githubusercontent.com/Blastoise/72e10b8af5ca359772ee64b6dba33c91/raw/2d7ab3caa27faa61beca9fbf7d3aca6ce9a25916/clearType.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/b74e06f739610c4a867cf94b27637a56/raw/96926e732a38d3da860624114990121d71c08ea1/tahoma.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/64ba4acc55047a53b680c1b3072dd985/raw/6bdf69384da4783cc6dafcb51d281cb3ddcb7ca0/segoeUI.sh | bash
#sudo fc-cache -fv
