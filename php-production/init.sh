#!/bin/bash 
# 
# 生产环境初始化
# 
# @author alex 
#

# php配置文件
cd config
files=$(ls)
for file_example in $files; do 
    # 文件后缀
    lastname=${file_example##*.}
    if [ "$lastname" = example ]; then 
        dest_name=${file_example%.*}
        if [ ! -f "$dest_name" ]; then 
            cp "$file_example" "$dest_name" \
                && echo "cp $file_example $dest_name "
        fi
    fi
done

# nginx配置
nginx_conf=/etc/nginx/nginx-conf/products 
if [ ! -d $nginx_conf ]; then 
    echo "$nginx_conf 目录不存在"
    exit 1
fi

if [ ! -f "$nginx_conf/nginx.conf" ]; then 
    echo "$nginx_conf/nginx.conf 文件不存在"
    exit 1
fi

echo 
echo '请注意修改配置文件，如果需要的话。'
echo '====> Finish!'
