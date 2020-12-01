# ZSH

Zsh is a Shell which is POSIX complaint. I use it as my Interactive shell.

## Installation
Arch:
```
# pacman -S zsh
```
### My interactive shell is zsh

This is set in the [config for Alacritty](../alacritty/README.md).
To be able to put the .zshrc file in the .config/zsh directory we add the following to ~/.profile
```
export ZDOTDIR="$HOME/.config/zsh"
```

