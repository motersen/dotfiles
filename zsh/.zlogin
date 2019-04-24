# Start ssh-agent and export settings
eval `ssh-agent` > /dev/null

find $HOME/tmp ! -samefile $HOME/tmp -print0 | xargs -0 rm -rf
