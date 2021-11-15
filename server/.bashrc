#!/bin/bash
# Source local definitions
if [ -d ~/.bashrc.d ]; then
  for RC_FILE in ~/bashrc.d/*.bash; do
    # FILE exists and read permission is granted
    if [ -r "$RC_FILE" ]
    then
      . "$RC_FILE"
    fi
  done
fi
# vim: set syntax=sh:ts=4:sw=4

