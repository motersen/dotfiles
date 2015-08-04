# Start ssh-agent and export settings
eval `ssh-agent` > /dev/null

export PATH="/home/motersen/bin:$PATH"
export PATH="/home/motersen/perl5/bin:/opt/android-sdk/tools:$PATH"

export GUILE_LOAD_PATH="$HOME/src/guile:..."

source /home/motersen/perl5/perlbrew/etc/bashrc