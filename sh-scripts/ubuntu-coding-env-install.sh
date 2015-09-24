#!/bin/bash
# 
# 宿主机器的编程环境安装
# - git, git-flow
# - tmux
# - zsh(oh-my-zsh)
# - vim(spf13-vim)
# - pinta: 图片编辑工具
# - guake: 下拉式终端
# - gnome-do: 程序调度器，可以通过快捷键快速打开程序
# - freemind: 思维导图
# - vlc: 视频播放器
# - 
# - 
# @author cyy0523xc@gmail.com
# @date   2015-9-25
#

user=$(whoami)

# 配置目录
sudo mkdir -p /var/www 
sudo chown -Rh $user:$user /var/www

sudo mkdir /data
sudo chown -Rh $user:$user /data

sudo mkdir /etc/nginx

# install
sudo apt-get install -y curl \
    guake gnome-do terminator \
    git git-flow gitk \
    tmux \
    vim \
    zsh \
    pinta

# config git
git config --global user.email $user'@ibbd.net'
git config --global user.name  "$user"
git config --global push.default simple

# config zsh 
# @see http://ohmyz.sh/
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# config vim 
# @see http://vim.spf13.com/
curl http://j.mp/spf13-vim3 -L -o - | sh


echo 
echo "==========================="
echo "===> Ubuntu coding env install is ok!"
echo 

