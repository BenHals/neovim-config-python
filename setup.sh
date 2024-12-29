#!/bin/bash

unameOut="$(uname -s)"
echo $unameOut


sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install build-essential
sudo apt install libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc liblzma-dev lzma
sudo apt-get install nodejs npm
sudo apt-get install neovim
sudo apt-get install python-tk python3-tk tk-dev
sudo apt-get install fd-find
sudo apt-get install ripgrep
sudo apt-get install stow

username_home=$HOME

if [ ! -d "$username_home/.config/tmux/plugins/catppuccin" ]; then
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.1.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
fi

stow nvim
stow tmux
stow starship
stow iterm2
stow ghostty


source $username_home/.bashrc
tmux source $username_home/.tmux.conf
