#!/bin/bash
export SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    ssh-agent |sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add -t 8h
}

if [ -f ${SSH_ENV} ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent > /dev/null || start_agent
else
    start_agent;
fi
# vim: set syntax=sh:ts=4:sw=4
