#!/bin/bash

if [ ! $1 == "" ]
then
  output=docker ps | grep $1
  if [ ! $output == "" ]
  then
    docker stop $1
    docker rm $1
  fi
  docker run --name $1 -v "$PWD"/web:/usr/share/nginx/html -v "$PWD"/nginx.conf:/etc/nginx/nginx.conf:ro -p 82:80 -d nginx
else
  echo "Give a name to the container"
fi
