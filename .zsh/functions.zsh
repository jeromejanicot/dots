__source() {
    if [[ -f $1 ]]; then
        source "$1"
    fi
}

dce() {
    docker compose run --rm --service-ports "$1" /bin/sh
}

dca() {
    docker-compose run --rm "$1" /bin/sh
}

dr() {
    docker run -it $1
}

