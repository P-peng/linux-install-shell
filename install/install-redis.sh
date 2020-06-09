#!/bin/bash
#
# 安装 redis
#
# 加载配置文件
source ./base-config.sh

APP=redis
VERSION=5.0.8

APP_NAME=$APP-$VERSION
APP_NAME_GZ=$APP_NAME.tar.gz
# 更新环境
yum install -y gcc

# 创建文件架
mkdir -p /usr/local/$APP_NAME
# 下载
cd /usr/local/$APP_NAME
# 可修改其它下载地址
wget http://$SERVER/linux/$APP/$VERSION/$APP_NAME_GZ
# 解压 去除第一个文件目录
tar -xvf $APP_NAME_GZ --strip-components 1
rm -rf $APP_NAME_GZ

make MALLOC=libc #编译
make PREFIX=/usr/local/redis install
rm -rf /usr/local/$APP_NAME
cd /usr/local/redis
wget http://$SERVER/linux/$APP/$VERSION/redis.conf
./bin/redis-server ./redis.conf

ps aux | grep redis
echo "#############################################"
echo "##########    $APP 安装启动成功    ##########"
echo "#############################################"
exit
