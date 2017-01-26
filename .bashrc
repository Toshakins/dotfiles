#!/bin/sh

alias less="less -S"
alias ll='ls -alF'

function cs() {
  cd "$@" && ll
}

alias cd='cs'
