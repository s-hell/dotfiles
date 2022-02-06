#!/bin/bash
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# Bash lists the status of any stopped and running jobs before exiting an interactive shell
shopt -s checkjobs
# Bash will attempt to perform hostname completion when a word containing a ‘@’ is being completed 
shopt -s hostcomplete
# enable cd spell correction
shopt -s cdspell
# Combine multiline commands into one in history
shopt -s cmdhist
# vim: set syntax=sh:ts=4:sw=4
