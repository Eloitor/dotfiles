#!/bin/zsh
fpath=(.config/zsh/plugins $fpath)

# FOR TESTING: exec zsh
# startup time zsh:
timezsh() {
	shell=${1-$SHELL}
	for i in $(seq 1 10); do
		/usr/bin/time --format="real %e\tuser %U\tsys %S" $shell -i -c exit; done
}

# NAVIGATION

setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

setopt HIST_SAVE_NO_DUPS    # Do not write a duplicate event to the history file.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt beep

# COMPLETION
autoload -Uz compinit; compinit             # Initialize completion for the current Zsh session.
_comp_options+=(globdots)                   # Autocomplete hidden files

source ~/.config/zsh/plugins/completion.zsh # Autocomplete

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # Show previously typed commands
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme #PS1


source ~/.config/zsh/plugins/vim.zsh       # VIM key bindings
source ~/.config/zsh/aliases.zsh           # Define costum aliases

# Arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/plugins/p10k.zsh ]] || source ~/.config/zsh/plugins/p10k.zsh

# SYNTAX HIGHLIGHTING

# Must be sourced at the end of the .zshrc file.
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
