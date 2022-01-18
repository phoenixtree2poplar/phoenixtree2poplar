+++
title="pop"
date= 2022-01-18 02:21:21
tags=["learn"]
categories=["learn"]
toc=true
+++
## docker容器

## 推送阿里云镜像
```sh
docker login --username=wu_ton-g@foxmail.com registry.cn-hangzhou.aliyuncs.com
docker tag c059bfaa849c registry.cn-hangzhou.aliyuncs.com/phoenixtree/poplar:0.1
docker push registry.cn-hangzhou.aliyuncs.com/phoenixtree/poplar:0.1
```
## mysql7
```sh
docker pull centos/mysql-57-centos7
docker run -id --name=mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=i88  centos/mysql-57-centos7
```
### rocketmq
```sh
#rocketmq镜像获取
docker pull foxiswho/rocketmq:server-4.5.1
docker pull foxiswho/rocketmq:broker-4.5.1
#rocketmq启动
docker run -di -p 9876:9876 --name=rmqserver -e "JAVA_OPT_EXT=-server -Xms128m -Xmx128m -Xmn128m" -e "JAVA_OPTS=-Duser.home=/opt" foxiswho/rocketmq:server-4.5.1
docker run -di -p 10911:10911 -p 10909:10909 --name=rmqbroker -e "JAVA_OPTS=-Duser.home=/opt" -e "JAVA_OPT_EXT=-server -Xms128m -Xmx128m -Xmn128m" foxiswho/rocketmq:broker-4.5.1
#rmqbroker容器需要配置 rmqserver ip地址
vi /etc/rocketmq/broker.conf
brokerIP1=172.17.0.3
namesrvAddr=192.168.17.130:9876
#rocketmq测试
sh tools.sh org.apache.rocketmq.example.quickstart.Producer
sh tools.sh org.apache.rocketmq.example.quickstart.Consumer
#rocketmq web管理工具
docker run -id --name=rmq-web  -e "JAVA_OPTS=-Drocketmq.namesrv.addr=192.168.17.130:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" -p 8080:8080 docker.io/styletang/rocketmq-console-ng
```