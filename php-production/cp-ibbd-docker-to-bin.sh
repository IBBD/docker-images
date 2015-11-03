#!/bin/bash 
# 将ibbd-docker cp 到/usr/local/bin 
# 
# @author alex 
# @date   20151102


# 有些平台没有sudo命令，例如windows下使用mingw的环境
sudo=
if which sudo; then 
    sudo=sudo
fi

# 配置文件名及目录
ibbd_docker_file=ibbd-docker
bin_path=/usr/local/bin

# 复制到目标目录
if [ ! -f "$PWD/$ibbd_docker_file" ]; then 
    echo "ERROR: 必须在当前目录运行，文件$PWD/$ibbd_docker_file不存在！"
    exit 1
fi

$sudo cp $ibbd_docker_file "$bin_path"

# 设置docker-compose配置文件目录
root_path="$PWD"

# 修改目录变量
root_path_new=$(echo $root_path | sed 's/\//\\\//g')
$sudo sed -i 's/^docker_compose_php_path=$/docker_compose_php_path='"$root_path_new"'/' "$bin_path/$ibbd_docker_file"
echo "下面输出docker-compose的php配置文件目录，检查是否正确, 如果不正确，则删除$bin_path/$ibbd_docker_file 文件，然后修复问题，再执行该文件"
grep -E '^docker_compose_php_path=' "$bin_path/$ibbd_docker_file"

echo "Success cp $ibbd_docker_file to $bin_path!"

