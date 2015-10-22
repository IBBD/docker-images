#!/bin/bash
# 
# 下载所有php生产环境相关的镜像
#

docker_pull_one() {
    if [ "$1" = busybox ]; then 
        image_name=busybox 
    else 
        image_name="ibbd/$1"
    fi
    sudo docker pull "$image_name"
    echo ""
    echo "===> docker pull $image_name done!"
}

images_list="busybox nginx php-fpm"

for i in $images_list
do 
    docker_pull_one $i
done

echo '===> All done!'
echo '下面输出已经下载了的镜像：'
sudo docker images

