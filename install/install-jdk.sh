#!/bin/bash
#
# 安装 jdk 8
#
SERVER=download.baolijinglight.com
JDK_NAME=jdk-8u231
JDK_NAME_GZ=$JDK_NAME-linux-x64.tar.gz
# 创建文件架
mkdir -p /usr/local/$JDK_NAME
# 下载 jdk
cd /usr/local/$JDK_NAME
wget http://$SERVER/linux/jdk/$JDK_NAME_GZ
# 解压 去除第一个文件目录
tar -xvf $JDK_NAME_GZ --strip-components 1
# 设置环境变量
echo "" >> /etc/profile
echo JAVA_HOME=/usr/local/$JDK_NAME >> /etc/profile
echo CLASSPATH=$JAVA_HOME/lib/ >> /etc/profile
echo 'PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo export PATH JAVA_HOME CLASSPATH >> /etc/profile
source /etc/profile
java -version
echo "#############################################"
echo "##########       jdk 安装成功      ##########"
echo "#############################################"
exit