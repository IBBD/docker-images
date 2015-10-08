#!/bin/bash
# 
# 下载所有php开发环境相关的镜像
#

sudo docker pull busybox

docker_pull_one() {
    sudo docker pull ibbd/$1
    echo ""
    echo "===> docker pull ibbd/$1 done!"
}

images_list="nginx php-fpm-dev redis mongo mariadb"

for i in $images_list
do 
    docker_pull_one $i
done

echo '===> All done!'
