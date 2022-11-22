#!/bin/bash
#Setup Neovim

# Configuration Structure
# ~/.config/nvim/init.lua

# Create directories if they don't exist
echo "[*] Creating directories"
if [ -d ~/.config/nvim ]; then echo "[*] .config/nvim Exists"; else mkdir -p ~/.config/nvim; fi
if [ -d ~/.config/nvim/lua ]; then echo "[*] .config/nvim/lua Exists"; else mkdir -p ~/.config/nvim/lua; fi
if [ -d ~/.config/nvim/plugin ]; then echo "[*] .config/nvim/plugin Exists"; else mkdir -p ~/.config/nvim/plugin; fi

# Install Packer for plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Download the init.lua config file
curl -s https://raw.githubusercontent.com/rawk77/blob/master/neovim/init.lua -o ~/.config/nvim/init.lua
