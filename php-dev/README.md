# PHP本地开发环境

这是本地开发使用

## Docker Compose yml文件 

提供了三个基本形式：

- 启动完整的本地环境：`docker-compose.yml.example`
- 启动nginx, php-fpm, mysql的本地环境：`docker-compose-npm.yml.example`
- 启动nginx, php-fpm的本地环境：`docker-compose-np.yml.example`

将对应的example文件cp一份到`docker-compose.yml`, 然后运行`docker-compose up`即可。

复制配置文件也可以使用快捷脚本：

```sh 
./yml-cp.sh       # 完整环境，含：nginx, php-fpm, mariadb(mysql), redis, mongodb
./yml-cp.sh  npm  # nginx, php-fpm, mariadb(mysql)环境
./yml-cp.sh  np   # nginx, php-fpm环境
./yml-cp.sh  n    # 只是启动单独的nginx环境
```


