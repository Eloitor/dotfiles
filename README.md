# My Dotfiles
This repository contains a collection of my configuration files for Linux programs. They can be used in any Linux distribution.

I try to minimize what is directly on ~/
## General installation
```
git clone ...
cd
git submodule update --init
```

## Included dotfiles
   - .profile (for the login shell)
   - zsh (a great interactive shell, with a lot of plugins)
   - alacritty (terminal)
   - qutebrowser (web browser with vim keybindings)

## The configuration files that are read at startup are:
1. OpenRC
2. ~/.profile (.zprofile if you are using zsh as login shell)

    startx

3. ~/.config/X11/xinitrc



To make dash your login shell you have to run:
```
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
