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

nbsp=$'\u00a0'
PROMPT="%n %? %~:$nbsp"
bindkey -s $nbsp '^u'

# Display [NORMAL] tag when in cmd mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="[% NORMAL]%"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init > /dev/null
zle -N zle-keymap-select > /dev/null

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
