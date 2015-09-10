#!/bin/bash
# 导出镜像到/var/www/images
# 方便使用 docker load -i /path/to/filename.tar
#

save_file=/var/www/docker-images/$1-$(date +%Y%m%d%H%M)".tar"
echo $save_file
sudo docker save -o $save_file ibbd/$1

username=$(whoami)
sudo chown $username:$username $save_file

echo "===>Finish!"

