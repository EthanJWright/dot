#!/bin/bash

# Install Fisher (fish package manager)
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Install Plug (nvim / vim package manager)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
cp nvim/init.vim ~/.config/nvim

cp -r fish ~/.config/
