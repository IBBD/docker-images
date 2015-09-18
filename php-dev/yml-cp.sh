#!/bin/bash
# 配置文件初始化 


start_type=
if [ 1 -eq $# ]
then
    start_type='-'$1
fi

cp docker-compose"$start_type".yml.example docker-compose.yml
