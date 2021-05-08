# Dotfiles for NEOVIM configuration

### install neovim and plug:

```
./setup.sh
```

### install plugins
1. Open neovim
```
nvim
```
2. Install the plugins
```
:PlugInstall
```
3. reload neovim


## Notes on extra things

### Ranger installed with devicons

```
sudo apt-get install -y ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
```

### LSP

```
pip3 install 'python-language-server[all]'
python3 -m pip install pyright-langserver
npm install --save tsserver
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

cd ~ ; git clone https://github.com/sumneko/lua-language-server

wget https://swift.org/builds/swift-5.3.3-release/ubuntu2004/swift-5.3.3-RELEASE/swift-5.3.3-RELEASE-ubuntu20.04.tar.gz.sig
wget https://swift.org/builds/swift-5.3.3-release/ubuntu2004/swift-5.3.3-RELEASE/swift-5.3.3-RELEASE-ubuntu20.04.tar.gz
gpg --verify swift-5.3.3-RELEASE-ubuntu20.04.tar.gz{.sig,}
tar -xzvf swift-5.3.3-RELEASE-ubuntu20.04.tar.gz -C ~
```

## Fish

### Plugins

```
fisher install PatrickF1/fzf.fish
fisher install franciscolourenco/done
fisher install acomagu/fish-async-prompt
fisher install jorgebucaran/autopair.fish
fisher install komarnitskyi/theme-zephyr
fisher install daveyarwood/tomita
fisher install gazorby/fish-abbreviation-tips
fisher install jethrokuan/z
```

### Prompt

```
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

## Languages

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## System Utils

```
sudo apt-get install -y ripgrep
cargo install exa

wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb
sudo dpkg -i bat-musl_0.18.0_amd64.deb
```

## Font Requirements

A font from [Nerd Font](https://www.nerdfonts.com/)
