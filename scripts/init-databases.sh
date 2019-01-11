#!/usr/bin/env bash

docker network create public-no-net

echo "启动mongo——>"
docker run -d --name public-no-mongo \
      --net public-no-net \
      -p 127.0.0.1:27017:27017 \
      mongo:3.6.5-jessie

echo "运行redis——>"
docker run --name public-no-redis \
        --net public-no-net \
        -p 6379:6379 \
        -d \
        docker.io/redis redis-server

echo "运行elasticsearch——>"
docker run -d --name public-no-es \
    --net public-no-net \
    -p 9200:9200 \
    -p 9300:9300 \
    -e "discovery.type=single-node" \
    elasticsearch:6.5.4


sleep 5
echo "初始化mongo——>"
./init-mgo-auto.sh

