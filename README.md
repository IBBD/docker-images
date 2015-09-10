# Docker images

## 安装docker

- Linux用户：`./install-docker.sh`
- Windows/Mac用户：https://www.docker.com/toolbox

## 前端开发环境构建 

```sh
./install-env-node-dev.sh
```

## PHP开发环境构建

```sh 
cd php-dev

# 下载所有相关镜像
./docker-pull-all.sh

# 构建环境
sudo docker-compose up
```


