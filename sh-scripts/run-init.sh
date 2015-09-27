#!/bin/bash

# 运行容器初始化程序

sudo=
if which sudo; then 
    sudo=sudo
fi

# 判断ibbd-docker-run文件是否存在
docker_bashrc_file="ibbd-docker-run"
if [ ! -f $docker_bashrc_file ]
then
    echo "$docker_bashrc_file is not existed!"
    if [ ! -f $docker_bashrc_file".example" ]
    then
        "ERROR: $PWD is error!"
        exit 1
    fi
    cp $docker_bashrc_file".example" $docker_bashrc_file
fi

# 替换正确的路径
ibbd_docker_run_root=${PWD%/*}
echo $ibbd_docker_run_root
ibbd_docker_run_root_p=$(echo $ibbd_docker_run_root | sed 's/\//\\\//g')
sed -i 's/^ibbd_docker_run_root=.*$/ibbd_docker_run_root='$ibbd_docker_run_root_p'/' ./$docker_bashrc_file

# cp to /usr/local/bin/
$sudo cp ./ibbd-docker-run /usr/local/bin/

########################################
### 初始化相关目录 #####################
########################################

[ ! -d /etc/nginx ] && $sudo mkdir /etc/nginx
[ ! -d /var/www ] && $sudo mkdir /var/www
[ ! -d /data ] && $sudo mkdir /data

#user=$(whoami)
#$sudo -R $user:$user /var/www

########################################
### 初始化PHP环境的相关配置 ############
########################################

cd $ibbd_docker_run_root

cd ./php-dev/config/
if [ ! -f php-fpm.conf ]
then 
    # 将example文件复制成正式配置文件
    # 如果本地有特殊的配置，可以自己修改
    file_list=$(ls *.example)
    for from_file in $file_list 
    do 
        to_file=${from_file%.*}
        [ ! -f $to_file ] && cp $from_file $to_file
    done
    echo "Finish: copy php-dev config files"
else
    echo "The php-dev config files is existed!"
fi

# 执行成功
echo 'SUCCESS!'
