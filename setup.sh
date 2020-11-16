#!/bin/bash

# Install Plug (nvim / vim package manager)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "/usr/local/bin/nvim"  ] || [ -f "/usr/bin/nvim" ]
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


unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if rg --help>/dev/null; then
    echo "RG Already installed"
else
    echo "You need to install RG for FZF to work..."
    echo "Following information about how to install:"
    if [ ${machine} == "Linux" ]
    then
        echo "On debian < 18.04?"
        echo "-----------------------------------------------------------"
        echo "curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb"
        echo "sudo dpkg -i ripgrep_11.0.2_amd64.deb"
        echo "-----------------------------------------------------------"
        echo "On debian > 18.04?"
        echo "-----------------------------------------------------------"
        echo "sudo apt-get install ripgrep -y"
        echo "-----------------------------------------------------------"
    elif [ ${machine} == "Mac" ] 
    then
        echo "-----------------------------------------------------------"
        echo "brew install regrip"
        echo "-----------------------------------------------------------"
    fi
fi

rm -rf ~/.config/nvim
cp -r nvim ~/.config/nvim
mkdir -pv ~/.vim/undodir
mkdir -pv ~/.vim/.notes
mkdir -pv ~/.vim/.sandbox
mkdir -pv ~/.vim/.trash

# Install other dotfiles
cp files/bash_profile ~/.bash_profile
cp files/bashrc ~/.bashrc
cp files/functions ~/.functions
cp files/fzf_functions ~/.fzf_functions
mkdir -pv ~/.config/kitty
cp files/kitty.conf ~/.config/kitty/.kitty.conf
cp files/public_aliases ~/.public_aliases
cp files/tmux.conf ~/.tmux.conf
