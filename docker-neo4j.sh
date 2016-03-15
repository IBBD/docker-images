#!/bin/bash

usage() {
    echo "$0 run   创建并运行容器"
    echo "$0 exec  进入容器"
    echo "$0 start 启动容器"
    echo "$0 stop  停止容器"
}

if [ $# = 0 ]; then
    usage
    exit 1
fi

# 容器名称
name=ibbd-neo4j

# 对外端口
port=7474

# 数据目录
data=/data/neo4j/data
if [ ! -d "$data" ]; then
    echo "$data is not exists!"
    echo "Please create it first!"
    exit 2
fi

case $1 in
    run)
        sudo docker run \
            --detach \
            --publish=$port:$port \
            --volume=/data/neo4j/data:/data \
            --name="$name" \
            neo4j
        ;;
    exec)
        sudo docker exec --interactive "$name" bin/neo4j-shell
        ;;
    start)
        sudo docker start "$name"
        ;;
    stop)
        sudo docker stop "$name"
        ;;
    *)
        echo 'error params'
        echo
        usage
        ;;
esac
