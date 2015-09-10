#!/bin/bash
# 
# 安装前端开发环境
# 

sudo docker pull ibbd/node-dev

[ ! -d ext ] && mkdir ext 

download_file=https://raw.githubusercontent.com/IBBD/dockerfile-node-dev/master/run.sh.example

[ ! -f $download_file ] && wget $download_file -O run-node-dev.sh 

sudo ./run-node-dev.sh

