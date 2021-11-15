#!/bin/bash
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
# don't start ssh-agent for root
    if [[ ${EUID} != 0 ]]; then
        start_agent;
    fi
fi
# vim: set syntax=sh:ts=4:sw=4
