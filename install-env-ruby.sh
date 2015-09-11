#!/bin/bash
# 
# 安装前端开发环境(Ruby)
# 

sudo docker pull ibbd/ruby

[ ! -d ext ] && mkdir ext 

download_file=https://raw.githubusercontent.com/IBBD/dockerfile-ruby/master/run.sh.example

[ ! -f $download_file ] && wget $download_file -O run-ruby.sh 

sudo ./run-ruby.sh

