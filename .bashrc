#!/bin/sh

alias less="less -S"
alias ll='ls -alF'

function cds() {
  cd "$@" && ll
}

alias cd='cds'

function wght() {
  # size of location by folder
  du -h -c -d 1 "$@" 2>/dev/null |sort -h
}
