#!/bin/sh

# sh profile file. Runs on login. Environmental variables are set here.

export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export READER="zathura"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
#Disable less history
export LESSHISTFILE="-"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME"/zsh/history
# Sage
export DOT_SAGE="$XDG_CONFIG_HOME/sage"

# TexLive
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# Visual Studio Code (undocumented)
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode

# Created by `userpath` on 2020-11-16 13:54:26
export PATH="$PATH:/home/eloi/.local/bin"


if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep awesome || startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi


## Keyboard layouts:
# Catalan
# Arabic (Phonetic)
setxkbmap -layout "es,ara" -variant "cat,buckwalter"

export PATH="$HOME/.elan/bin:$PATH"
