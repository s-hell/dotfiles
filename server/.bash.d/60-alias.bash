#!/bin/bash
# bookmarks
alias cb1='alias b1="cd `pwd`" && echo -e "\nBookmark b1: `pwd` created.\n"'
alias cb2='alias b2="cd `pwd`" && echo -e "\nBookmark b2: `pwd` created.\n"'
alias cb3='alias b3="cd `pwd`" && echo -e "\nBookmark b3: `pwd` created.\n"'
alias cb4='alias b4="cd `pwd`" && echo -e "\nBookmark b4: `pwd` created.\n"'
alias cb5='alias b5="cd `pwd`" && echo -e "\nBookmark b5: `pwd` created.\n"'
alias cb6='alias b6="cd `pwd`" && echo -e "\nBookmark b6: `pwd` created.\n"'
alias cb7='alias b7="cd `pwd`" && echo -e "\nBookmark b7: `pwd` created.\n"'
alias cb8='alias b8="cd `pwd`" && echo -e "\nBookmark b8: `pwd` created.\n"'
alias cb9='alias b9="cd `pwd`" && echo -e "\nBookmark b9: `pwd` created.\n"'
alias lb='alias | grep -e "alias b[0-9]"|grep -v "alias cb"|sed "s/alias //"'

alias ta="tmux attach"
alias ll="ls -Nahl --sort=size --color=auto --group-directories-first"
alias ls="ls --quoting-style=literal --color=auto"
alias create_patch="diff -crB $1 $2"

alias source_bashrc="source ~/.bashrc"
# vim: set syntax=sh:ts=4:sw=4

