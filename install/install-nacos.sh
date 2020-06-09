#!/bin/bash
#
# 安装 redis
#
# 加载配置文件
source ./base-config.sh

APP=nacos
VERSION=1.2.1

APP_NAME=$APP-$VERSION
APP_NAME_GZ=$APP-server-$VERSION.tar.gz

# 创建文件架
mkdir -p /usr/local/$APP_NAME
# 下载
cd /usr/local/$APP_NAME
# 可修改其它下载地址
wget http://$SERVER/linux/$APP/$VERSION/$APP_NAME_GZ
# 解压 去除第一个文件目录
tar -xvf $APP_NAME_GZ --strip-components 1
rm -rf $APP_NAME_GZ

./bin/startup.sh

ps aux | grep nacos
echo "#############################################"
echo "##########    $APP 安装启动成功    ##########"
echo "#############################################"
exit
