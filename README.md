# 镜像使用说明

- Dockerfile地址：https://github.com/IBBD
- 镜像地址：https://hub.docker.com/u/ibbd/
- 镜像命名规则：`ibbd/$name`
- 容器命名规则：`ibbd-$name` （与镜像对应）

## 安装docker

- Linux用户：`./install-docker.sh`
- Windows/Mac用户：https://www.docker.com/toolbox

```
Windows/Mac用户：
如果官网下载太慢，可以从这里下载： https://get.daocloud.io/toolbox/ 
```

## 前端开发环境构建 

- 从hub.docker.com pull镜像安装：（可能耗时比较久，需要耐心）

```sh
./install-env-node-dev.sh
```

- `docker load`安装，需要先有打包好的镜像。


## PHP开发环境构建

### STEP1：获取镜像

```sh 
# 从hub.docker.com下载所有相关镜像，可能耗时比较久，需要耐心
./docker-pull-all.sh

# 或者使用 docker load 命令直接加载镜像，需要先有打包好的镜像
```

### STEP2：构建环境

```sh 
cd php-dev
sudo docker-compose up
```

