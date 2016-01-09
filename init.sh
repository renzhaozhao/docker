#!/bin/bash
if [ $1 = "-h" ]; then
    echo "./init.sh <wyunservice path> <wyunmobile path> <sslkey path>"
    exit 0
fi

# 启动数据镜像
docker run --name data-wyunbank \
    -v $1:/wyunservice:rw \
    -v $2:/wyunmobile:rw \
    centos:7
# 启动数据库镜像
docker run -d -p 3306:3306 --name mysql-wyunbank -e MYSQL_ROOT_PASSWORD=1 mysql
# 启动redis镜像
docker run -d -p 6379:6379 --name redis-wyunbank redis
# 生成工具镜像
docker build -t wyunbank/tools tools
# 启动后端镜像
docker build -t wyunbank/php php7.0-apache
if [ $# = 0 ]; then
    docker run -d -p 443:443 \
        --name laravel-wyunbank \
        --link mysql-wyunbank:mysql \
        --link redis-wyunbank:redis \
        wyunbank/php
elif [ $# = 2 ]; then
    docker run -d -p 443:443 \
        --volumes-from data-wyunbank \
        --name laravel-wyunbank \
        --link mysql-wyunbank:mysql \
        --link redis-wyunbank:redis \
        wyunbank/php
elif [ $# = 3 ]; then
    docker run -d -p 443:443 \
        --volumes-from data-wyunbank \
        -v $3:/pki \
        --name laravel-wyunbank \
        --link mysql-wyunbank:mysql \
        --link redis-wyunbank:redis \
        wyunbank/php
fi

# 启动前端镜像
docker build -t wyunbank/cordova cordova
docker run -d -p 8000:80 \
    --volumes-from data-wyunbank \
    --link laravel-wyunbank \
    --name cordova-wyunbank \
    wyunbank/cordova