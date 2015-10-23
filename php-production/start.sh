#!/bin/bash 
# 
# 这个脚本会加入开机自动启动
# /etc/rc.local 
#
# 注意：
# 1. 该文件加入到/etc/rc.local自动执行
# 2. 必须在当前目录执行该文件
# 3. 执行完之后，该文件不能删除
# 
# @author alex 
#

if ! ./init.sh; then 
    echo '请确认php和nginx的配置文件是否已经配置了？'
    exit 1
fi

# 启动
sudo docker-compose up -d
sudo docker ps 
echo '====> 启动完成'


# 设置自动启动 
rc_local=/etc/rc.local 
sh_script=$0
sh_script=${sh_script##*/}
if [ ! -f "$PWD/$sh_script" ]; then 
    echo "$PWD/$sh_script 文件不存在, 必须在当前目录执行该文件！"
    exit 1
fi

if ! grep "$sh_script" $rc_local; then 
    sed -E 's/exit 0\s*$//g' $rc_local 
    echo >> $rc_local 
    echo '# 启动php相关的docker容器' >> $rc_local 
    echo "bash $PWD/$sh_script" >> $rc_local 
    echo >> $rc_local 
    echo 'exit 0' >> $rc_local 
    echo "$PWD/$sh_script 该文件加入 $rc_local 成功, 开机自动启动。"
else 
    echo "$PWD/$sh_script 该文件已经在 $rc_local 中"
fi

echo 
echo "$sh_script 该文件不能删除"
echo "Finish!"

