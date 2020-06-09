#!/bin/bash
#
# 安装 maven
#
SERVER=download.baolijinglight.com
MAVEN_NAME_VERSION=3.5.4
MAVEN_NAME=apache-maven-$MAVEN_NAME_VERSION
MAVEN_NAME_GZ=$MAVEN_NAME-bin.tar.gz
# 创建文件架
mkdir -p /usr/local/$MAVEN_NAME
# 下载 jdk
cd /usr/local/$MAVEN_NAME
wget http://$SERVER/linux/maven/$MAVEN_NAME_GZ
# 解压 去除第一个文件目录
tar -xvf $MAVEN_NAME_GZ --strip-components 1
rm -rf $MAVEN_NAME_GZ
# 设置环境变量
echo "" >> /etc/profile
echo export MAVEN_HOME=/usr/local/$MAVEN_NAME >> /etc/profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
mvn -v
echo "#############################################"
echo "##########     maven 安装成功      ##########"
echo "#############################################"
exit
