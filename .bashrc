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

# Docker
removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armaggedon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

##### OS X
# shows notification and says it
function notif() {
   osascript -e 'display notification "'${1}'" with title "Important"' && say -v Milena "'${1}'";
}
