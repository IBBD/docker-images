#!/bin/bash
# 
# 登陆容器，容器名的前缀是ibbd-
# ./exec.sh php-fpm
# ./exec.sh nginx
# 

docker exec -ti ibbd-$1 /bin/bash

