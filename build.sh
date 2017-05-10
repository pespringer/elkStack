#! /bin/bash

if [[ -z ${REPO_PATH} ]];
then
  echo Please set your env var REPO_PATH.
  echo ie: export REPO_PATH=~/repos/ascena/elkStack
  echo Exiting with prejudice.
  exit 1
fi

TAG=$(date '+%Y%m%d-%H%M%S')
IMAGE_NAME="elk_stack"
FULL_IMAGE_NAME=${IMAGE_NAME}:${TAG}

echo ${FULL_IMAGE_NAME}

docker build -t ${FULL_IMAGE_NAME} ${REPO_PATH}/. > /dev/null
