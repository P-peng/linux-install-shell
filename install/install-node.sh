#!/bin/bash
#
# 安装 node js
#
# 加载配置文件
source ./base-config.sh

APP=node
VERSION=v14.4.0

APP_NAME=$APP-$VERSION
APP_NAME_GZ=$APP_NAME-linux-x64.tar.xz
# 创建文件架
mkdir -p /usr/local/$APP_NAME
# 下载
cd /usr/local/$APP_NAME
# 可修改其它下载地址
wget http://$SERVER/linux/$APP/$APP_NAME_GZ
# 解压 去除第一个文件目录
tar -xvf $APP_NAME_GZ --strip-components 1
rm -rf $APP_NAME_GZ

ln -s /usr/local/$APP_NAME/bin/npm /usr/local/bin/
ln -s /usr/local/$APP_NAME/bin/node /usr/local/bin/

$APP -v
echo "#############################################"
echo "##########     $APP 安装成功      ##########"
echo "#############################################"
exit
