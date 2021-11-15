#!/bin/bash
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

array_contains () {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

# compress
mktar() {
    tar cvf  "${1%%/}.tar"     "${1%%/}/"; 
}
mktgz() {
    tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}
mktbz() {
    tar cvjf "${1%%/}.tar.bz2" "${1%%/}/";
}
mkzip() {
    zip -r "${1}.zip" "${1}"; 
}

# extract
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

testcert () {
    h=$(echo $1|cut -d":" -f1 )
    p=$(echo $1 |cut -d":" -f2 )
    if [ $p == $h ]; then
        p="443"
    fi
    echo "Cert for Host $h Port $p"
    echo ""
    echo "logout" | openssl s_client -CApath /etc/ssl/certs/ -connect $h:$p | openssl x509 -text|more
}

# start ssh agent + add key
function start_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# vim: set syntax=sh:ts=4:sw=4
