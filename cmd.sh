#!/bin/bash

commands=$*
docker_compose_dir="docker-compose"

function runCommand() {
  # up
  if [ "$1" = "up" ]; then
    (cd $docker_compose_dir && docker compose up -d --build)

  # down
  elif [ "$1" = "down" ]; then
    (cd $docker_compose_dir && docker compose down)

  # rmi
  elif [ "$1" = "rmi" ]; then
    imageList=$(docker images -f "dangling=true" -q)

    if [ "$imageList" != "" ]; then
      docker rmi $imageList
    fi

  # log
  elif [ "$1" = "log" ]; then
      (cd $docker_compose_dir && docker compose logs -f)
  fi
}

for command in $commands; do
  runCommand "$command"
done
