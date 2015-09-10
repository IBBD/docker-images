#!/bin/bash
# 
# 登陆正在运行的IBBD容器
# 

sudo docker exec -ti ibbd-$1 /bin/bash 

