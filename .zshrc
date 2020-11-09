#!/bin/sh

export PATH=$PATH:~/bin

alias ll='ls -alF'
alias scp='rsync --verbose --progress --archive'

aws() {
    docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli:latest "$@"
}

aws_update() {
    docker pull amazon/aws-cli:latest
}

eval "$(pyenv init -)"
