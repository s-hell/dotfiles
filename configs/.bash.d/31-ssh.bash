# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ] && ( [ -f "~/.ssh/id_ecdsa" ] || [ -f "~/.ssh/id_rsa" ] ) ; then
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
