#!/bin/bash
# 
# 登陆mysql的命令行
# 本地都可以使用默认的用户名密码
# 

name=base-dev-tools
sudo docker run -ti --rm --name=ibbd-$name \
    -v /var/www:/var/www \
    -w /var/www \
    ibbd/$name \
    mycli -h ibbd-mariadb -u root -p 111111

