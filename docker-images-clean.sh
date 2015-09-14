#!/bin/bash

# 清理已经退出的容器
docker rm $(docker ps -a|grep 'Exited ('|cut -d" " -f 1)

# 删除为none的镜像
docker rmi $(docker images|grep "<none>"|sed -e 's/ \+/,/g'|cut -d "," -f 3)

