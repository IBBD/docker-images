#!/bin/bash
# 配置文件初始化 
# 
# USAGES: ./yml-cp.sh np 


start_type=
if [ 1 -eq $# ]
then
    start_type='-'$1
fi

# 判断文件是否存在 
from_file=./docker-compose"$start_type".yml.example
if [ ! -f $from_file ]
then
    echo "ERROR: $from_file is not existed!"
    exit 1
fi

to_file=./docker-compose.yml
cp $from_file $to_file

echo 'SUCCESS: Copy '$from_file' to '$to_file
