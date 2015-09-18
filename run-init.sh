#!/bin/bash

# 运行容器初始化程序

# 判断run_bashrc.sh文件是否存在
docker_bashrc_file="run-bashrc.sh"
if [ ! -f $docker_bashrc_file ]
then
    echo "ERROR: $docker_bashrc_file is not existed!"
    exit 1
fi

# 判断run_bashrc.sh的路径是否正确
s="ibbd_docker_run_root="
s_len=${#s}
current_pwd=$(grep -Ei '^ibbd_docker_run_root=' ./$docker_bashrc_file)
current_pwd=${current_pwd:$s_len}
echo $current_pwd

if [ ! -f $current_pwd"/"$docker_bashrc_file ]
then
    echo "ERROR: $current_pwd is error."
    exit 1
fi

# 判断是否已经加入了~/.bashrc


