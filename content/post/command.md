+++
title="command"
date= 2019-08-09 22:24:12
tags=["命令","command","hexo","linux","tomcat","maven","mvn","cmd"]
categories=["command"]
toc=true
+++
## git
#### https://github.com/pcottle/learnGitBranching  # 交互式Git学习
```bash
git fetch --all   #强制拉取
git reset --hard origin/master  #强制覆盖本地
git checkout -b dev  #从当前分支创建并切换分支到dev
git push --set-upstream origin dev  #当前分支推送远程分支dev
git push origin :dev  #推送空分支到远程即删除远程分支，需当前不在该分支
git rm -r --cached .  #刷新文件缓存
git update-index --assume-unchanged file  #手动忽略某个文件
git update-index --no-assume-unchanged file  #取消忽略
# https://njuferret.github.io/2018/08/24/git-usage/  #git学习
```
## shell for循环
```sh
# for1.sh
#!/bin/bash
for ((i=1;i<=5;i++))
do
  echo $i >> test.txt
done
# for2.sh
for i in {a..z} {A..Z} {0..9}  # 可任意组合
do
  echo $i >> test.txt
done
# for3.sh
for i in `ls`  # ``为前置执行符
do
  echo $i >> test.txt
done
```
## Windows 命令
```cmd
netstat -ano | findstr ":80"    #查询80端口，记下最后一位数字，即PID
tasklist /fi "PID eq 4"        #查询进程号为4的服务名称
taskkill /pid 4 /f               #根据pid 关闭进程，其中 /f 表示强制关闭该进程
taskkill /im nginx.exe           #根据服务名称关闭进程

sc delete sql   #删除sql服务
regedit         #打开注册表编辑器
slmgr.vbs -dlv  #该命令命令可以查询到Win10的激活信息，包括：激活ID、安装ID、激活截止日期等信息     
slmgr.vbs -dli  #命令可以查询到操作系统版本、部分产品密钥、许可证状态等
slmgr.vbs -xpr  #命令可以查询Win10是否永久激活
--------------------- bat脚本 ------------------------------
@echo off
echo "开始更新..  执行 git pull"
cd %~dp0
set currentFolder=%~dp0
for /D %%i in (Folder*) do ( 
  echo %%i
  cd %%i
  git pull
  rem git branch  字段rem是用来注释的 “:” 也可以用来注释
  cd ..
)
pause

if 1==1 (
  xcopy /y *.jar %currentFolder%jar  #bat拷贝命令参数/y是覆盖
  rd /q/s package  #删除目录package /q不询问，静默模式 /s目录树迭代删除
  md package  #创建目录package
  jar xf dev.jar  #静默解压dev.jar到当前目录
  pause  #暂停
)

for /l %%i in (1,1,40) do (echo INSERT INTO `t_user` VALUES (%%i, 'poplar%%i', 'di%%i', '%%i'^)^; >> sql-test-user.sh)
```

## Maven命令
```cmd
mvn -DskipTests clean package  #本地跳过测试打包
call mvn -f pom.xml dependency:copy-dependencies  #根据pom.xml拉取仓库
```
## free
```
PURGE RECYCLEBIN  #清除回收BIN，gaussdb数据库命令
# java远程调试
java -Xdebug -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=20001 -Dfile.encoding=utf-8 -jar poplar.jar --server.port=20000
#sed命令修改 free.sh文件的第五行
sed -i "5c poplar" free.sh
```
## Hexo 命令
```cmd
hexo init [folder]  #Hexo 默认在目前的文件夹建立网站
hexo n　　＃　　== hexo new "主题"  新建一篇文章，默认使用 _config.yml 中的 default_layout 参数代替
hexo g  #　　== hexo generate  生产静态html
hexo s  #　　== hexo server  #本地预览   localhost:4000
hexo d  #　　== hexo deploy  #推送远程发布，即正式发布
hexo s -g  #本地测试
hexo d -g  #发布网页
```
## tomcat 直接部署应用到根目录
### 方法一：（最简单直接的方法）
#### 删除原 webapps/ROOT 目录下的所有文件，将应用下的所有文件和文件夹复制到ROOT文件夹下。
### 方法二：
#### 打开Tomcat/conf/server.xml，在<host></host>之间加入代码：
```xml
<Context path="" docBase="D:/path/apache-tomcat-8.5.35/webapps/bbs.war"/>
```
#### 这样重新启动tomcat，我们的bbs.war应用就直接部署到ROOT目录了。
### tomcat 增加jvm运行内存
#### linux系统修改TOMCAT_HOME/bin/catalina.sh
#### win系统修改TOMCAT_HOME/bin/catalina.bat
```
JAVA_OPTS="-server -Xms1024m -Xmx2048m -XX:PermSize=156M -XX:MaxPermSize=512m"
配置文件前面添加上面一行就行，下面为参数解释
-server:一定要作为第一个参数，在多个CPU时性能佳 
-Xms：java Heap初始大小， 默认是物理内存的1/64。
-Xmx：java heap最大值，建议均设为物理内存的一半。不可超过物理内存。 
-XX:PermSize:设定内存的永久保存区初始大小，缺省值为64M。
-XX:MaxPermSize:设定内存的永久保存区最大 大小，缺省值为64M。
-XX:SurvivorRatio=2  :生还者池的大小,默认是2，如果垃圾回收变成了瓶颈，您可以尝试定制生成池设置
-XX:NewSize: 新生成的池的初始大小，省值为2M。
-XX:MaxNewSize: 新生成的池的最大大小，缺省值为32M。
```
## Linux服务器硬件信息
```bash
cat /proc/cpuinfo  | grep name | cut -f2 -d: | uniq  #查看cpu名称
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l  #查看物理CPU个数
cat /proc/cpuinfo| grep "cpu cores"| uniq  #查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo| grep "processor"| wc -l  #查看逻辑CPU的个
free -m  #数查看内存 
#总核数 = 物理CPU个数 X 每颗物理CPU的核数 
#总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数