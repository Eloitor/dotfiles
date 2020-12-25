# My Dotfiles

This repository contains a collection of my configuration files for Linux programs. They can be used in any Linux distribution.

## Installation

1. Download my dotfiles
```bash
git clone --recursive https://github.com/Eloitor/dotfiles ~/.dotfiles
```
> Note: You can clone it into a folder diferent than `~/.dotfiles`, for example `~/.dotfiles-eloi`.
2. Install `rcm` in your system.
3. Add configuration file ~/.rcrc
  ```bash
  rcup rcrc
  ```
4. Install the dotfiles that you want
|                |     |
| --             | --  |
| rcup zsh zshrc | |
| rcup alacritty |     |


## Included dotfiles

  See all the symlinks that it will make:
   ```bash
   lsrc
   ```

   - .profile (for the login shell)
   - .config/X11/xinitrc (for graphics)
   - zsh (a great interactive shell, with a lot of plugins)
   - alacritty (terminal)
   - qutebrowser (web browser with vim keybindings)

## At startup:

At startup, the login shell runs `~/.profile` (`~/.zprofile` if you are using zsh). This runs `startx` with the argument `~/.config/X11/xinitrc`, which loads the window manager.

## REQUIREMENTS
To map caps to Mod/Escape
* xcape

## What I'm planning:
* Lightdm / SDDM compatible
* I'll try to setup a different desktop environment for each tty:

tty1 | tty2 | tty3 | tty4
---|--|--|--
awesome | awesome + XFCE | i3 | plasma

## How to change your login shell to dash
1. Install dash
>**Arch** based distributions:
>```bash
>sudo pacman -S dash
>```
2.  Make a symbolic link from `/bin/dash` to `/bin/sh`
> ```bash
> sudo ln -sfT /bin/dash /bin/sh
>```

## How to collect your dotfiles?

You can use rcm to collect your configuration files in one folder.

For example if you want to backup the configuration for zsh, just run:
```bash
mkrc -S ~/.config/zsh
```

Now the `zsh` folder inside `~/.config` is just a symbolic link to `~/.dotfiles/config/zsh`.

>With the -S option rcm treats the full directory as a file)
