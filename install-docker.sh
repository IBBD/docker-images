#!/bin/bash
# 
# 在linux系统下一键安装Docker环境
# docker, docker-compose
#

# 官方的经常出现网络问题
# 使用daocloud的服务：http://get.daocloud.io/#install-docker
#wget -qO- https://get.docker.com/gpg | sudo apt-key add -
#wget -qO- https://get.docker.com/ | sh
curl -sSL https://get.daocloud.io/docker | sh

# install pip
sudo apt-get install python-pip

# 启动docker服务
sudo service docker start

# docker-compose
#sudo pip install -U docker-compose -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
filename=__install-docker-compose
curl -L get.daocloud.io/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` -o $filename
sudo mv $filename /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose 
rm $filename

# 查看docker版本号等
sudo docker -v
sudo docker info
sudo docker-compose -v

# 在阿里云上得修改一下路由表, 因为 docker 的虚拟子网是在这个 prefix 里的 
# 否则可能会出现错误：connect to the Docker daemon. Is 'docker -d' running on this host?
# @see http://segmentfault.com/q/1010000000438713
#sudo route del -net 172.16.0.0 netmask 255.240.0.0  

