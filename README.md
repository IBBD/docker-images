# 镜像使用说明

- Dockerfile地址：https://github.com/IBBD
- 镜像地址：https://hub.docker.com/u/ibbd/
- 镜像命名规则：`ibbd/$name`
- 容器命名规则：`ibbd-$name` （与镜像对应）
- 代码目录：`/var/www/`
- 日志目录：`/var/log/`
- 数据目录：`/data/`

## 安装docker

- Linux用户：`./install-docker.sh`
- Windows/Mac用户：https://www.docker.com/toolbox

```
Windows/Mac用户：
如果官网下载太慢，可以从这里下载： https://get.daocloud.io/toolbox/ 
```

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



