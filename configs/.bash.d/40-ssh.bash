#!/bin/bash
if [ -f ${SSH_ENV} ]; then
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        if [[ ${EUID} != 0 ]]; then
            start_agent;
        fi
    fi
    if [[ ! "$SSH_AUTH_SOCK" ]]; then
        if [[ ${EUID} != 0 ]]; then
            source "${SSH_ENV}" >/dev/null
        fi
    fi
fi
# vim: set syntax=sh:ts=4:sw=4
