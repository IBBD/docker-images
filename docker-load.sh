#!/bin/bash
#
# 根据前缀加载本地下载好的镜像 
#
# @example  ./docker-load.sh /path/to/php-fpm
# @author alex
# @version 2015-10-08
# 

file=$1
file=$(ls "$1"* -t | head -n 1)
echo $file

sudo docker load -i "$file"


