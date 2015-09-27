#!/bin/bash
# ./ibbd-docker-run每次修改之后，需要cp到/usr/local/bin/目录
#

sudo=
if which sudo; then 
    sudo=sudo
fi

$sudo rm /usr/local/bin/ibbd-docker-run
$sudo cp ./ibbd-docker-run /usr/local/bin/ibbd-docker-run

