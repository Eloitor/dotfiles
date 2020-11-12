# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#neofetch

## The following two lines are needed for the git plugin to work.
## https://apple.stackexchange.com/questions/296477/my-command-line-says-complete13-command-not-found-compdef
autoload -Uz compinit
compinit

#source ~/.config/zsh/ohmyzsh/lib/git.zsh
source ~/.config/zsh/ohmyzsh/plugins/git/git.plugin.zsh

source ~/.config/zsh/ohmyzsh/plugins/docker/_docker

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Automatic navigation to files
#exec ~/.config/zsh/plugins/z/z.sh
# To try lua rewrite, which is faster:
# https://github.com/skywind3000/z.lua
#eval "$(lua ~/z.lua/z.lua -- init zsh)"

# Enable colors and change promt
autoload -U colors && colors
setopt prompt_subst
PS1=" %B%~%{$fg[red]%}>>%{$reset_color%}%b "
export PS1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# PS1="%~ >> "

# myemacsclient () {
#    emacsclient -n -e "(if (> (length (frame-list)) 1) 't)" | grep -q t
#     if [ "$?" = "1" ]; then
#         emacsclient -c -n -a "" "$@"
#     else
#         emacsclient -n -a "" "$@"
#     fi
# }
# alias em=myemacsclient

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


# Sufix aliases
alias -s pdf=zathura

# bulk association
alias -s {cs,ts,html}=code


# open ~/.zshrc in using the default editor specified in $EDITOR
alias ec="$EDITOR $HOME/.config/zsh/.zshrc"

# source ~/.zshrc
alias sc="exec zsh"

function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ $git_status =~ "working directory clean" ]]; then
        echo -e "%{$fg[red]%}"
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e "%{$fg[yellow]%}"
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e "%{$fg[green]%}"
    else
        echo -e "%{$fg[blue]%}"
    fi
}

function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]];
    then
        local branch=${BASH_REMATCH[1]}
        echo "($branch)"
    elif [[ $git_status =~ $on_commit ]];
    then
        local commit=${BASH_REMATCH[1]}
        echo "($commit)"
    fi
}

# PS1="\[$COLOR_WHITE\]\n[\W]"          # basename of pwd
#PS1+="$(git_color)"        # colors git status
#PS1+="$(git_branch)"           # prints current branch
# PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
#export PS1
#

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


#if [ -e /home/eloi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/eloi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
