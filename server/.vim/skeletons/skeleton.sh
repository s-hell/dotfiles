#!/bin/bash
#
# author: shell@pcspinnt.de
#
for i in "$@"; do
    case $i in
        -d)
        set -x # Print commands and their arguments as they are executed.
        ;;
        -x)
        set -e # Exit immediately if a command exits with a non-zero status.
        ;;
        *)
            # unknown option
        ;;
    esac
done

