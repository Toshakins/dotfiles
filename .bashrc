#!/bin/sh

alias less="less -S"
alias ll='ls -alF'
alias scp='rsync --verbose --progress --archive'

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

docker-prune () 
{ 
    docker-compose down && docker system prune -f && docker network ls | grep dashboard_unico_aero_default | awk '{print $1 }' | xargs docker network rm
}



##### OS X
# shows notification and says it
function notif() {
   osascript -e 'display notification "'${1}'" with title "Important"' && say -v Milena "'${1}'";
}
