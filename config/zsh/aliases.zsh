alias ls="ls --color=auto"
alias vim="nvim"
alias v="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias -g L="| less"
alias -g C="|wc -l"  # Count lines

# Sufix aliases. (default program to open this extensions)
alias -s pdf=zathura
alias -s exe=wine
alias -s {cs,ts,html}=code
alias -s {tex,md,txt}=nvim

# Stack
alias d='dirs -v'                                               # Write d to see the stack
for index ({1..10}) alias "$index"="cd +${index}"; unset index  # Write any index to go to the desired directory.
