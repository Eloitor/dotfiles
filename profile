#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

#export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export READER="zathura"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"  # used for git
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export LESSHISTFILE="-"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"
