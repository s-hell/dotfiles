#!/bin/bash
export LS_COLORS="di=1;36:ex=1;31"
# history
export HISTCONTROL=ignoreboth:ignoredups:erasedups:ignorespace
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S"
export HISTIGNORE='ls:ls -ahlt:ll:sudo -i'

# for installed pip packages
if [ -d ~/.local/bin ]; then
    export PATH=$PATH:~/.local/bin
fi
if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
fi

# vim: set syntax=sh:ts=4:sw=4