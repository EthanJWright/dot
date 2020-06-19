#!/bin/bash

# Install Plug (nvim / vim package manager)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "/usr/local/bin/nvim" ] 
then
    echo "NeoVim already installed, moving on." 
else
    echo "Building NeoVim from source..."
    git clone https://github.com/neovim/neovim.git
    cd neovim
    make CMAKE_BUILD_TYPE=Release
    sudo make install
    cd ..
fi

rm -rf ~/.config/nvim
cp -r nvim ~/.config/nvim

# Install other dotfiles
cp files/bash_profile ~/.bash_profile
cp files/bashrc ~/.bashrc
cp files/functions ~/.functions
cp files/fzf_functions ~/.fzf_functions
cp files/kitty.conf ~/.kitty.conf
cp files/public_aliases ~/.public_aliases
cp files/tmux.conf ~/.tmux.conf
