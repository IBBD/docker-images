#!/bin/bash
# 导出镜像到/var/www/images
# 方便使用 docker load -i /path/to/filename.tar
# 
# 使用：
# ./docker-save.sh node-dev
#

if [ 1 -ne $# ]
then 
    echo 'ERROR: the name of image is empty!'
    exit 1
fi

# 存储目录
save_path=/var/www/docker-images/$1
if [ ! -d $save_path ]
then
    mkdir -p $save_path 
fi

save_file=$save_path/$1-$(date +%Y%m%d%H%M)".tar"
echo $save_file
sudo docker save -o $save_file ibbd/$1

username=$(whoami)
sudo chown $username:$username $save_file

echo "===>Finish!"

