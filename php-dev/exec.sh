#!/bin/bash
# 
# ./exec.sh php-fpm
# ./exec.sh nginx

docker exec -ti php-dev-$1 /bin/bash

