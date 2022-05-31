#!/bin/bash

commands=$*
docker_compose_dir="../docker-compose"
service_name="angular_dev"

function runCommand() {
  # init
  if [ "$1" = "init" ]; then
    npm install

  # update
  elif [ "$1" = "update" ]; then
    (cd $docker_compose_dir && docker compose up $service_name --build -d)

  # rmi
  elif [ "$1" = "rmi" ]; then
    imageList=$(docker images -f "dangling=true" -q)

    if [ "$imageList" != "" ]; then
      docker rmi $imageList
    fi

  # build
  elif [ "$1" = "build" ]; then
    ng build -c development
    status=$?
    if [ $status != 0 ]; then
      exit 1
    fi
  fi
}

for command in $commands; do
  runCommand "$command"
done
