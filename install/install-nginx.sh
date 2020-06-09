#!/bin/bash
#
# 安装 nginx
#

# 下载 依赖
yum -y update
yum -y install gcc pcre-devel zlib-devel openssl openssl-devel wget

# 下载 nginx
cd /usr/local
wget https://nginx.org/download/nginx-1.9.9.tar.gz
tar -xvf nginx-1.9.9.tar.gz
cd nginx-1.9.9
./configure --prefix=/usr/local/nginx
make
make install

cd ../nginx/sbin
./nginx

echo "#############################################"
echo "##########  nginx 80端口 启动成功  ##########"
echo "#############################################"
exit