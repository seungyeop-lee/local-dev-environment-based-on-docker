#!/bin/bash

commands=$*
docker_compose_dir="../docker-compose"
service_name="spring_dev"

# OS 별 gradlew 실행 파일 설정
OS="`uname`"
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
  # up
  if [ "$1" = "cmd" ]; then
    $gradlew build -x test
    (cd $docker_compose_dir && docker compose up $service_name --build -d)

  # rmi
  elif [ "$1" = "rmi" ]; then
    imageList=$(docker images -f "dangling=true" -q)

    if [ "$imageList" != "" ]; then
      docker rmi $imageList
    fi
  fi
}

for command in $commands; do
  runCommand "$command"
done
