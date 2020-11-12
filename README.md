# My Dotfiles

I try to minimize what is directly on ~/

## Included dotfiles

	* qutebrowser
	* zsh (WIP)

## Install requirements:

pacman -S qutebrowser zsh

## How I collect my dotfiles?

I use rcm to collect my configuration files in one folder.

For example if I want to backup the configuration for zsh:

mkrc -S ~/.config/zsh

(With the -S option rcm treats the full directory as a file)
