#!/bin/bash
#
# 安装 go
#
SERVER=download.baolijinglight.com
GO_NAME=go
GO_NAME_GZ=go1.13.10.linux-amd64.tar.gz
# 创建文件架
mkdir -p /usr/local/$GO_NAME
# 下载 jdk
cd /usr/local/$GO_NAME
wget http://$SERVER/linux/go/$GO_NAME_GZ
# 解压 去除第一个文件目录
tar -xvf $GO_NAME_GZ --strip-components 1
# 设置环境变量
echo "" >> /etc/profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
echo 'export GOROOT=/usr/local/go' >> /etc/profile
echo 'export GOPATH=$HOME/go' >> /etc/profile
echo 'export PATH=$PATH:$HOME/go/bin' >> /etc/profile
source /etc/profile
go -version
echo "#############################################"
echo "##########        Go 安装成功      ##########"
echo "#############################################"
exit