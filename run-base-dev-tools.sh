#!/bin/bash
# 
# 启动基础开发工具容器
# 

# 可以直接启动指定的命令
ibbd_command=tmux 
if [ 1 -eq $# ]
then
    ibbd_command=$1
fi

name=base-dev-tools
sudo docker run -ti --rm --name=ibbd-$name \
    -v /var/www:/var/www \
    -w /var/www \
    ibbd/$name \
    $ibbd_command

