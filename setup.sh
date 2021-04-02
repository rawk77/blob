#!/usr/bin/bash

echo '  ____                _     '
echo ' |  _ \ __ ___      _| | __ '
echo ' | |_) / _` \ \ /\ / / |/ / '
echo ' |  _ < (_| |\ V  V /|   <  '
echo ' |_| \_\__,_| \_/\_/ |_|\_\ '
echo ' '
echo '======= Setup Script ========'

# Create required Directories
mkdir ~/.local/bin
mkdir ~/.local/icons
mkdir -p ~/.local/share/applications

# Setup Obsidian
curl https://github.com/obsidianmd/obsidian-releases/releases/download/v0.11.9/Obsidian-0.11.9.AppImage -o ~/.local/bin/Obsidian
chmod +x ~/.local/bin/Obsidian
curl https://github.com/rawk77/blob/raw/master/Obsidian.png -o ~/.local/icons/Obsidian.png
curl https://raw.githubusercontent.com/rawk77/blob/master/Obsidian.desktop -o ~/.local/share/applications/Obsidian.desktop

# Setup .files
curl https://raw.githubusercontent.com/rawk77/blob/master/gdbinit -o ~/.gdbinit
curl https://raw.githubusercontent.com/rawk77/blob/master/tmux.conf -o ~/.tmux.conf
curl https://raw.githubusercontent.com/rawk77/blob/master/vimrc -o ~/.vimrc
