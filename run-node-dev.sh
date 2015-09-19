#!/bin/bash
# 
# 运行：
# cp ./run.sh.example ./run.sh
# sudo ./run.sh
# 

#-----------------------------------
# ----- 配置目录  BEGIN ------------
#-----------------------------------

name=node-dev

# 代码目录
code_path=/var/www

# 日志目录
logs_path=/var/log/node

#-----------------------------------
# ----- 配置目录  END --------------
#-----------------------------------

sudo docker run -it --rm --name ibbd-$name \
    -v $code_path:/var/www \
    -v $logs_path:/var/log/node \
    ibbd/$name \
    /bin/bash

