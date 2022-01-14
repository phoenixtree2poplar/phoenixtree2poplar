+++
title="docker"
date= 2019-09-03 23:14:41
tags=["docker"]
categories=["docker"]
toc=true
+++
![](docker.jpg)
## docker 基础镜像环境 alpine
在hub官网会经常能看到 alpine 字样, alpine 是要给非常轻量级的Linux发行版,Docker官方已经推荐使用alpine 代替之前的 Ubuntu作为基础镜像环境, 好处是制作出的最终镜像文件很多, 但docker dub上目前仍以 Ubuntu 为主流的基础镜像环境.
下面是几个常用发行版基础镜像的大小. 
```
REPOSITORY TAG IMAGE ID VIRTUAL SIZE
alpine latest 4e38e38c8ce0       4.799 MB
debian latest 4d6ce913b130      84.98 MB
ubuntu latest b39b81afc8ca      188.3 MB
centos latest 8efe422e6104       210 MB
alpine 内置 apk 包管理器, 而不是Ubuntu的apt, alpine 包的网址是 https://pkgs.alpinelinux.org/packages
```
# 常用 docker images
```bash
docker search 命令搜索指定的 image, 或者访问网址 https://hub.docker.com/explore/ 
docker pull openjdk:8-alpine  # 大小为107.8MB
docker pull openjdk:8             # 大小为309MB 
docker pull nginx
docker pull tomcat
docker pull wnameless/oracle-xe-11g
docker pull python
docker pull mysql
docker pull mongo
docker pull redis
docker pull rabbitmq
docker pull rabbitmq:3-management
------------------------------------
用于 docker 命令学习的镜像和命令
docker pull nginx:1.15-alpine  #只需要20M的空间
docker pull busybox  #只占用2M空间
以守护态运行容器, 经常用于容器的学习. 
docker run -d --name mybusybox busybox /bin/sh -c "while true; do echo hello world; sleep 1; done"
使用镜像nginx:1.15-alpine以后台模式启动一个容器, 并将容器的80端口映射到主机随机端口(80是该镜像expose的端口)
docker run -P -d --name mynginx1 nginx:1.15-alpine
使用镜像nginx:1.15-alpine以后台模式启动一个容器, 指定主机的端口为 80
docker run -p 80:80 -d --name mynginx2 nginx:1.15-alpine
docker 容器端口映射
1. 指定host端口和容器内端口
使用镜像nginx:1.15-alpine以后台模式启动一个容器, 指定主机的端口为80, 冒号前的host端口, 冒号后为容器内部的端口. 
docker run -p 80:80 -d --name mynginx2 nginx:1.15-alpine
2. 容器内端口随机分配一个Host端口 
下面 -p 参数的 80 指的是容器内部的端口, 没有指定host端口, docker在主机上自动开放一个映射端口(当然是未被占用的), 自动端口号一般大于等于 32768 . 
docker run -p 80 -d --name mynginx2 nginx:1.15-alpine
3. 自动为所有的 Dockerfile EXPOSE 端口映射Host端口
Dockerfile EXPOSE 可能会开放多个端口, 使用 -P 参数将自动为这些容器内部端口分配对应的Host主机端口
docker run -P -d --name mynginx1 nginx:1.15-alpine
```
# 常用命令
```bash
docker images 命令, 显示可用的容器
docker rmi <镜像Id> 命令,删除指定镜像
docker pull hello-world 命令 , 下载 hello-world image
docker rmi <镜像Id> 命令,删除指定镜像
docker ps 命令, 列出当前正在运行的容器, 结果的第一列是container_Id, 第2列是容器名称. 
docker ps -a 命令, 列出当前正在运行的和之前运行完的容器
docker stop container_id/container-name 命令, 停止指定的容器, 该容器Id或名称可以从docker ps中获取. 
docker restart container_id/container-name 命令, 重新启动指定的容器, 该容器Id或名称可以从docker ps中获取. 
docker start container_id/container-name 命令, 启动指定的容器, 该容器Id或名称可以从docker ps中获取. 
docker rm container_id/container-name, 删除指定的容器
docker rm $(docker ps -a -q) 命令, 删除所有运行结束了容器, 正在运行的容器不会被删除
docker top container_id/container-name, 查看容器内的进程
docker logs [-f] [-t] [--tail string] 容器名, 查看容器的日志输出, -f是打开跟踪, -t是加上时间戳, --tail 100 表示仅显示最后的100行日志
docker search nginx, 在hub站点中搜索 nginx 镜像
docker image inspect image_id 命令, 显示指定镜像的详细信息. 
docker container inspect container_id/container-name 命令, 显示指定容器的详细信息,包括容器的Ip
docker images -f dangling=true 命令, 列出没有被容器化的镜像
docker rmi $(docker images -qf dangling=true) 命令, 删除那些没有被容器化的镜像
docker system df 命令, 可以一次性查看镜像/容器/host volume的磁盘占用情况. 
docker ps -s 命令, 输出容器的空间占用
```
# docker 一些管理命令集
#### 除了上面常用的命令外, docker 还有一些管理命令集, 这些命令集还可以包含二级命令:
```bash
config Manage Docker configs
container Manage containers
image Manage images
network Manage networks
node Manage Swarm nodes
plugin Manage plugins
secret Manage Docker secrets
service Manage services
stack Manage Docker stacks
swarm Manage Swarm
system Manage Docker
trust Manage trust on Docker images
volume Manage volumes
比较常用的是, 
docker image build, 编译 Dockfile
docker network create, 创建 docker 网络
docker volume create, 创建数据卷
```
# ocker run/exec 命令
```bash
运行 hello-world 容器, 如果本地没有下载, 将会自动从hub站点下载. 
docker run hello-world 命令
以守护态运行容器
docker run -d --name mybusybox busybox /bin/sh -c "while true; do echo hello world; sleep 1; done"
登陆一个容器, 运行中的容器其实是一个功能完备的Linux操作系统, 所以我们可以在登陆该容器执行常规的Linux命令. 
docker exec -it container_id/container-name /bin/bash
使用 redis-cli 登陆 myredis 容器
docker exec -it myredis redis-cli 
exec 后的 -it 参数的意思是, 以交互的方式并分配一个伪tty, 经常一起联用.
```

# docker redis 使用
```bash
docker pull redis:latest  # 下载最新版的 redis image
pull run redis  # 简单方式启动 redis 服务

下面命令摘自: https://blog.csdn.net/cookily_liangzai/article/details/80726163
docker run --name redis-test -p 6379:6379 -d --restart=always redis:latest redis-server --appendonly yes --requirepass "your passwd"
--name redis-test: 为容器指定名称为 redis-test
-p 6379:6379 :将容器内端口映射到宿主机端口(容器端口在右边, 宿主端口在左边) 
-d: 即 --detach, 以后台的方式执行容器
–restart=always: 随docker启动而启动
redis-server –appendonly yes: 在容器执行redis-server启动命令, 并打开redis持久化配置 
requirepass "your passwd" : 设置redis认证密码

```
```bash
下面命令摘自: http://www.cnblogs.com/cgpei/p/7151612.html
# docker run -p 6699:6379 --name myredis -v $PWD/redis.conf:/etc/redis/redis.conf -v $PWD/data:/data -d redis:3.2 redis-server /etc/redis/redis.conf --appendonly yes
　　命令说明：
　　--name myredis : 指定容器名称，这个最好加上，不然在看docker进程的时候会很尴尬。
　　-p 6699:6379 ： 端口映射，默认redis启动的是6379，至于外部端口，随便玩吧，不冲突就行。
　　-v $PWD/redis.conf:/etc/redis/redis.conf ： 将主机中当前目录下的redis.conf配置文件映射。
　　-v $PWD/data:/data -d redis:3.2 ： 将主机中当前目录下的data挂载到容器的/data
　　--redis-server --appendonly yes :在容器执行redis-server启动命令，并打开redis持久化配置\
　　注意事项：
　　　　如果不需要指定配置，-v $PWD/redis.conf:/etc/redis/redis.conf 可以不用 ，
　　　　redis-server 后面的那段 /etc/redis/redis.conf 也可以不用。
```
# MySQL 官方Docker镜像的使用
```bash
摘自 https://itbilu.com/linux/docker/EyP7QP86M.html

docker run --name itbilu-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-pass -d mysql:5.7
我们就创建了一个名为 itbilu-mysql 的MySQL数据库服务器容器实例, 在创建数据库时，通过环境变量MYSQL_ROOT_PASSWORD设置数据库的root密码，还通过5.7标签指定了所使用的镜像版本。

不使用cnf文件的配置方式, 启动一个MySQL服务器容器，并使用UTF-8(utf8mb4)格式的表编码：
docker run --name itbilu-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-pw -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

使用宿主机/my/cnf/my.cnf 配置文件，这时就可以通过以下方式启动MySQL容器
docker run --name itbilu-mysql -p 3306:3306 -v /my/cnf/:/etc/mysql/ -e MYSQL_ROOT_PASSWORD=my-pass -d mysql:5.7

指定MySQL数据目录的volume 
docker run --name itbilu-mysql -p 3306:3306 -v /my/datadir:/var/lib/mysql -v /my/cnf/:/etc/mysql/ -e MYSQL_ROOT_PASSWORD=my-pw -d mysql:5.7
```
