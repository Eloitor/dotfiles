# My Dotfiles

This repository contains a collection of my configuration files for Linux programs. They can be used in any Linux distribution.

## General installation
```
git clone https://github.com/Eloitor/dotfiles
cd
git submodule update --init
```

## Included dotfiles
   - .profile (for the login shell)
   - .config/X11/xinitrc (for graphics)
   - zsh (a great interactive shell, with a lot of plugins)
   - alacritty (terminal)
   - qutebrowser (web browser with vim keybindings)

## At startup:

At startup, the login shell runs `~/.profile` (`~/.zprofile` if you are using zsh). This runs `startx` with the argument `~/.config/X11/xinitrc`, which loads the window manager.


## How to change your login shell to dash:
```sh
# pacman -S dash
# ln -sfT /bin/dash /bin/sh
```

## How I collect my dotfiles?

I use rcm to collect my configuration files in one folder.

For example if I want to backup the configuration for zsh:
```
mkrc -S ~/.config/zsh
```
(With the -S option rcm treats the full directory as a file)
xkb-switch-gitAUR
