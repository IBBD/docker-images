#!/bin/bash
# 
# 启动基础开发工具容器
# 

name=base-dev-tools
sudo docker stop ibbd-$name
sudo docker rm ibbd-$name

sudo docker run -ti --rm --name=ibbd-$name \
    -v /var/www:/var/www \
    -w /var/www \
    ibbd/$name \
    tmux

