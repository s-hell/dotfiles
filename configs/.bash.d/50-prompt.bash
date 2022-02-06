#!/bin/bash
# color prompt
if [[ ${EUID} == 0 ]]; then
    export PS1="\[\e[31m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\] \[\e[36m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[m\]\\$ \[$RESET\]"
else
    export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\] \[\e[36m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[m\]\\$ \[$RESET\]"
fi

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r; echo -ne '\033]0;${USER}@${HOSTNAME}\007'"
# vim: set syntax=sh:ts=4:sw=4
