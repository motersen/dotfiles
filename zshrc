# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/motersen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable colors
autoload -U colors && colors

nbsp=$'\u00a0'
PROMPT="%n %? %~:$nbsp"
bindkey -s $nbsp '^u'

vim_ins_mode="%{$fg[cyan]%}[INSERT]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[NORMAL]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  RPROMPT=$vim_mode
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
  RPROMPT=$vim_mode
}
zle -N zle-line-finish

function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

RPROMPT=$vim_mode

function paste {
	LBUFFER+=`xclip -o`
}
zle -N paste

function cmd-paste {
	zle vi-insert
	paste
	zle vi-cmd-mode
}
zle -N cmd-paste

# paste primary buffer by pressing <Insert>
bindkey '^[[2~' paste
bindkey -M vicmd '^[[2~' cmd-paste

# prepend sudo to a command while entering it
function prepend-sudo {
	BUFFER="sudo $BUFFER"
	CURSOR+=5
}
zle -N prepend-sudo

bindkey '^[#' prepend-sudo

# color ls output in terminal
alias ls='ls --color=auto'
alias l='ls -1'
alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color'
alias path="echo $PATH | awk '{gsub(/:/, \"\n\", \$0); print}' | sort"
alias addon-sdk="source /opt/addon-sdk/bin/activate"

diff () {
	colordiff -u $* | less -R
}

diskspace () {
  du -ah $1 2>/dev/null | tail -1
}

unreq-size () {
	pacman -Qdt | awk '{print $1;}' | xargs pacman -Qi \
		| awk '/^Name/ {printf $3 " ";} /^Installed Size/ {print $4 $5;}' \
		| column -t | sort -hrk2,2
}

export EDITOR="nvim"
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/motersen/perl5"
export PERL_MB_OPT="--install_base /home/motersen/perl5"
export PERL_MM_OPT="INSTALL_BASE=/home/motersen/perl5"
export PERL5LIB="/home/motersen/perl5/lib/perl5:$PERL5LIB"
export KEYTIMEOUT=1

source ~/perl5/perlbrew/etc/bashrc >/dev/null
