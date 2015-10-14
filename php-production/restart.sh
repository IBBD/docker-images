#!/bin/bash 

if ! ./init.sh; then 
    echo '请确认php和nginx的配置文件是否已经配置了？'
    exit 1
fi

sudo docker-compose restart 

