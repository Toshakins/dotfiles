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

alias dumpost='sudo -u postgres  pg_dumpall -U postgres -h 127.0.0.1 | tar czvf db_all_`date +%F`.sql'
