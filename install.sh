#!/bin/bash
#
# author: shell@pcspinnt.de
#
set -x
if [[ -z $1 ]]; then
    echo "Please specify a username"
else
    USER=$1
    HOMEDIR=$( getent passwd $USER | cut -d: -f6 )
    CURRENT_PATH=$(dirname $0)

    # bash
    cp -r $CURRENT_PATH/configs/.bash.d $HOMEDIR/
    chown $USER $HOMEDIR/.bash.d
    SOURCEBASHD="source ~/.bash.d/bashdreader"
    if grep -Fxq "$SOURCEBASHD" $HOMEDIR/.bashrc
    then
            echo "exists"
        else
            echo $SOURCEBASHD >> $HOMEDIR/.bashrc
    fi

    # tmux
    cp $CURRENT_PATH/configs/.tmux.conf $HOMEDIR/
    chown $USER $HOMEDIR/.tmux.conf

    # vim
    cp -r $CURRENT_PATH/.vim $HOMEDIR/
    cp -r $CURRENT_PATH/.vimrc $HOMEDIR/
    chown -R $HOMEDIR/.vim*
fi
