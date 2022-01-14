+++
title="config"
date= 2022-01-14 02:21:14
tags=["config"]
categories=["config"]
toc=true
+++
## git
````sh
git config --global user.name "phoenixtree"                               #设置用户名                       
git config --global user.email "wu_ton-g@foxmail.com"                   #设置用户邮箱
#########第一次SSH认证时候用##############
rm -fr ~/.ssh                           #删除本地密码对
ssh-keygen -t rsa  -C "wu_ton-g@foxmail.com"    #生成密码对
cp ~/.ssh/id_rsa.pub .                  #拷贝密码锁到  git目录
````
## maven
```xml
<?xml version="1.0" encoding="UTF-8"?>

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
          http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <!-- localRepository元素根据个人习惯设置本地仓库下载位置，默认为${user.home}/.m2/repository -->
    <localRepository>D:\dev\mave-jar</localRepository>
    <mirrors>
        <!-- mirror 元素设置镜像，这里设置为阿里镜像,在国内阿里镜像较快 -->
        <mirror>
            <id>alimaven</id>
            <mirrorOf>central</mirrorOf>
            <name>aliyun maven</name>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
        </mirror>
    </mirrors>
</settings>
```
## springboot项目内阿里仓库依赖
```xml
    <repositories>
        <repository>
            <id>public</id>
            <name>aliyun nexus</name>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
        </repository>
    </repositories>
    <pluginRepositories>
        <pluginRepository>
            <id>public</id>
            <name>aliyun nexus</name>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </pluginRepository>
    </pluginRepositories>
```
## idea
```
# idea.properties 文件修改可更改默认配置目录，最上面添加如下
idea.config.path=D:/dev/idea/me-config/config
idea.system.path=D:/dev/idea/me-config/system
idea.plugins.path=D:/dev/idea/me-config/plugins
idea.log.path=D:/dev/idea/me-config/log
# idea64.exe.vmoptions 2个文件可修改运行内存，根据物理机性能而定
# idea激活教程 https://blog.lupf.cn/articles/2021/12/30/1640851099736.html
-javaagent:D:\dev\mave-jar\ja-netfilter\ja-netfilter.jar
```
## nodejs
```cmd
npm config set registry http://registry.npm.taobao.org  #配置淘宝仓库
npm config set prefix “D:\dev\npm-jar”  #设置本地包下载位置(增加相应环境变量)
npm config set cache “D:\dev\npm-jar\cache”  #设置缓存位置
# nrm仓库管理工具
npm install -g nrm  #全局安装nrm
nrm ls  #列出所有仓库
nrm test  #仓库测试(果断淘宝第一)
nrm use taobao  #使用淘宝仓库
```