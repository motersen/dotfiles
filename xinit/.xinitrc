#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# load keybindings
xbindkeys

# Load Xresources files
cat 2> /dev/null $HOME/.Xresources.d/* | xrdb

# start urxvt daemon
urxvtd -q -f -o &
# start compositor
compton -CGb &
# set wallpaper
feh -z --bg-fill ~/wallpapers
# set up f.lux
xflux-run

exec i3