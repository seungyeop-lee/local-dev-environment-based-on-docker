#!/bin/bash

commands=$*
docker_compose_dir="../docker-compose"
service_name="spring_dev"

# OS 별 gradlew 실행 파일 설정
OS="$(uname)"
case $OS in
'Linux')
  OS='Linux'
  gradlew="./gradlew"
  ;;
'WindowsNT')
  OS='Windows'
  gradlew="gradlew.exe"
  ;;
'Darwin')
  OS='Mac'
  gradlew="./gradlew"
  ;;
*) ;;
esac

function runCommand() {
  # update
  if [ "$1" = "update" ]; then
    (cd $docker_compose_dir && docker compose up $service_name --build -d)

  # rmi
  elif [ "$1" = "rmi" ]; then
    imageList=$(docker images -f "dangling=true" -q)

    if [ "$imageList" != "" ]; then
      docker rmi $imageList
    fi

  # build
  elif [ "$1" = "build" ]; then
    $gradlew build -x test
    status=$?
    if [ $status != 0 ]; then
      exit 1
    fi
  fi
}

for command in $commands; do
  runCommand "$command"
done
