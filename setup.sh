#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update
sudo apt-get install build-essential
sudo apt install libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc liblzma-dev lzma
sudo apt-get install nodejs npm
sudo apt-get install neovim
sudo apt-get install python-tk python3-tk tk-dev
sudo apt-get install fd-find
sudo apt-get install ripgrep

username_home=$HOME
if [ ! -d "$username_home/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git $username_home/.asdf --branch v0.13.1
fi

sudo chmod u+x $username_home/.asdf/asdf.sh

sudo cp $username_home/.config/nvim/.bashrc $username_home/.bashrc
sudo cp $username_home/.config/nvim/.tmux.conf $username_home/.tmux.conf

source $username_home/.bashrc

asdf plugin-add python

asdf install python 3.11.6
asdf global python 3.11.6
