# 镜像使用说明

- Dockerfile地址：https://github.com/IBBD
- 镜像地址：https://hub.docker.com/u/ibbd/
- 镜像命名规则：`ibbd/$name`
- 容器命名规则：`ibbd-$name` （与镜像对应）
- 代码目录：`/var/www/`
- 日志目录：`/var/log/`
- 数据目录：`/data/`

## 总体理念

本地开发环境和测试环境使用了不同的镜像。以php开发为例，说明整体开发工作流：

1. 在宿主机器上，代码都统一放到一个代码目录下，例如：`/var/www`
2. 开发的时候使用`基础开发环境镜像`，宿主机的代码目录映射到开发容器中的`/var/www`
3. 需要测试的时候，启动`PHP开发环境`（从`docker-compose`启动，一次性启动nginx，php-fpm，mariadb，redis，mongoDB，当然也可以根据自己定义的配置启动）注意：nginx的配置文件目录

## 安装docker

- Linux用户：`./install-docker.sh`
- Windows/Mac用户：https://www.docker.com/toolbox

```
Windows/Mac用户：
如果官网下载太慢，可以从这里下载： https://get.daocloud.io/toolbox/ 
```

## Linux下启动环境的快捷命令配置

```
# 运行初始化脚本
./run-init.sh

# 重启终端，即可拥有命令：ibbd_docker_run 

# 启动基础开发环境
ibbd_docker_run dev 

# 启动nodejs前端开发环境 
ibbd_docker_run node 

##########################
## PHP环境如下 ###########
##########################

# 启动php环境 
ibbd_docker_run php

# 停止php环境 
ibbd_docker_run php stop
```

## 基础开发环境

包含了git, vim（含spf13-vim），zsh（含oh-my-zsh）, tmux, mycli等工具。可以用于日常的开发工作。需要具体的运行环境则需要执行具体的镜像（例如ibbd/nginx镜像等），通过/var/www代码目录进行共享。

- 镜像地址：https://hub.docker.com/r/ibbd/base-dev-tools/ 

## 前端开发环境构建 

### Node环境

包含glup，sass，compass等，具体见：IBBD/dockerfile-node-dev 

- 从hub.docker.com pull镜像安装：（可能耗时比较久，需要耐心）

```sh
./install-env-node-dev.sh
```

- `docker load`安装，需要先有打包好的镜像。

### Ruby环境（单独的SASS和Compass环境）

- 从hub.docker.com pull镜像安装：（可能耗时比较久，需要耐心）

```sh
./install-env-ruby.sh
```

- `docker load`安装，需要先有打包好的镜像。

## PHP开发环境构建

### STEP1：获取镜像

```sh 
# 从hub.docker.com下载所有相关镜像，可能耗时比较久，需要耐心
cd ./php-dev/
./docker-pull-all.sh

# 或者使用 docker load 命令直接加载镜像，需要先有打包好的镜像
```

### STEP2：构建环境

```sh 
cd php-dev
sudo docker-compose up
```

## 容器的基本操作

```
# 登陆nginx容器
./docker-exec.sh nginx

# 查看容器的日志
sudo docker logs ibbd-nginx 
```

## 爬虫线上环境

部署到正式环境使用


## 爬虫开发环境

在线上环境的基础上，增加开发测试时的一些基本工具，主要是vim等。



