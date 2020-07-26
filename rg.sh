unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac



if rg >/dev/null; then
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
        echo "brew install ripgrep"
        echo "-----------------------------------------------------------"
    fi
fi
