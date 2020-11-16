# My Dotfiles

## Included dotfiles

   * .profile (for the login shell)

   * zsh (a great interactive shell)
   * alacritty (terminal)
   * qutebrowser (web browser with vim keybindings)


I try to minimize what is directly on ~/

### My login shell is dash
  On login, it reads ~/.profile.

To make dash your login shell you have to run:
```
pacman -S dash
ln -sfT /bin/dash /bin/sh
```

### My interactive shell is zsh

  This is set in the config for Alacritty.
To be able to put the .zshrc file in the .config/zsh directory we add the following to ~/.profile
```
export ZDOTDIR="$HOME/.config/zsh"
```
Install:
```
pacman -S zsh
```

### Qutebrowser

Install:
```
pacman -S qutebrowser
```

### Alacritty

## How I collect my dotfiles?

I use rcm to collect my configuration files in one folder.

For example if I want to backup the configuration for zsh:
```
mkrc -S ~/.config/zsh
```
(With the -S option rcm treats the full directory as a file)
