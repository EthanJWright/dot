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

4. Install any Coc language servers:

| - | - |
| CCLS | either `:CocInstall coc-ccls` or use package manager to install ccls |
| Deno | `:CocInstall coc-tsserver` `:CocInstall coc-deno` `:CocCommand
deno.types` |
| Python | `:CocInstall coc-python` maybe update jedi: `sudo pip3 install -U
jedi` |
