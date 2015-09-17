#!/bin/bash

# 清理已经退出的容器
sudo docker rm $(sudo docker ps -a|grep 'Exited ('|awk '{print $1}')

# 删除为none的镜像
sudo docker rmi $(sudo docker images|grep "<none>"|awk '{print $3}')

echo "All is ok!"

