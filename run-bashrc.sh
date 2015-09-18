#!/bin/bash

# 运行环境初始化
# @author cyy0523xc@gmail.com
# Usage: ./run-init.sh
# 

# 注意：配置目录
ibbd_docker_run_root=ibbd_docker_run_root


# 启动docker容器
# 
# @param string 类型：dev|node|php
# @return 
ibbd_docker_run() {
    back_pwd=$PWD
    cd $ibbd_docker_run_root
    echo $ibbd_docker_run_root

    if [ 1 -eq $# ]
    then
        case $1 in 
            "dev")
                # 启动基础开发环境
                ./run-base-dev-tools.sh 
                ;;
            "node")
                # 启动前端开发环境
                ./run-node-dev.sh
                ;;
            "php")
                # 启动php开发环境
                # 先确定./php-dev/docker-compose.yml文件是否存在
                cd ./php-dev/
                dc_filename=docker-compose.yml
                if [ ! -f $dc_filename ]
                then
                    echo "ERROR: $dc_filename is not existed!"
                else
                    sudo docker-compose up -d
                fi
                ;;
            *)
                echo 'ERROR'
                echo 'ibbd-docker-run dev|node|php'
                ;;
        esac
    else
        echo 'ERROR'
        echo 'ibbd-docker-run dev|node|php'
    fi

    # 返回原来的目录
    cd $back_pwd
}



