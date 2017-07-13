# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/motersen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable colors
autoload -U colors && colors

source ~/.zshscripts.d/history-substring-search.zsh

source ~/.zshalias
source ~/.zshfunc
source ~/.zshwidget
source ~/.zshbind

# Display username, last exit status and pwd in prompt
# Remove prompt when pasting previous commands
nbsp=$'\u00a0'
setopt promptsubst
PROMPT="%n %? \$(pwdxz):$nbsp"
bindkey -s $nbsp '^u'

export CHICKEN_REPOSITORY="/home/motersen/chicken"
export EDITOR="emacsclient -nw"
export KEYTIMEOUT=1
