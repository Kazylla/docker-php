#!/bin/bash
if [ "$1" = "" ];then
  exit -1
fi
docker-compose exec $1 /bin/bash
