# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#neofetch

# FOR TESTING: exec zsh
# Edit config: open ~/.zshrc in using the default editor specified in $EDITOR
alias ec="$EDITOR $HOME/.config/zsh/.zshrc"
timezsh() {
	shell=${1-$SHELL}
	for i in $(seq 1 10); do
		/usr/bin/time --format="real %e\tuser %U\tsys %S" $shell -i -c exit; done
}


# PLUGINS
autoload -Uz compinit
compinit

# source ~/.config/zsh/ohmyzsh/plugins/docker/_docker
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# git_super_status
# source ~/.config/zsh/plugins/zsh-git-prompt/zshrc.sh
# source ~/.config/zsh/ohmyzsh/lib/git.zsh
# source ~/.config/zsh/ohmyzsh/plugins/git/git.plugin.zsh

# Enable colors and change promt
autoload -U colors && colors
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

#### PROMPT

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

PS1=" %B%~%{$fg[red]%}"
PS1+=$'$(git_super_status) '
#PS1+=$'$(vcs_info_wrapper)'
PS1+=">>%{$reset_color%}%b "
export PS1


# Automatic navigation to files
#exec ~/.config/zsh/plugins/z/z.sh
# To try lua rewrite, which is faster:
# https://github.com/skywind3000/z.lua
#eval "$(lua ~/z.lua/z.lua -- init zsh)"


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -v

# myemacsclient () {
#    emacsclient -n -e "(if (> (length (frame-list)) 1) 't)" | grep -q t
#     if [ "$?" = "1" ]; then
#         emacsclient -c -n -a "" "$@"
#     else
#         emacsclient -n -a "" "$@"
#     fi
# }
# alias em=myemacsclient

# VI MODES

# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
           [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
             [[ ${KEYMAP} == viins ]] ||
             [[ ${KEYMAP} = '' ]] ||
             [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


alias ls="ls --color=auto"
alias vim="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias -g L="| less"
alias -g C="|wc -l"
# Sufix aliases. (default program to open this extensions)
alias -s pdf=zathura
alias -s {cs,ts,html}=code
alias -s {tex,md,txt}=nvim

# Arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# Must be sourced at the end of the .zshrc file.
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/plugins/p10k.zsh ]] || source ~/.config/zsh/plugins/p10k.zsh

# Created by `userpath` on 2020-11-16 13:54:26
export PATH="$PATH:/home/eloi/.local/bin"
