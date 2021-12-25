+++
title="maven配置"
date= 2018-08-31 10:53:29
tags=["maven","mvn"]
categories=["maven"]
toc=true
+++
## maven历史版本[下载](https://archive.apache.org/dist/maven/maven-3/)
## 先附上缩减后的源配置文件  setting.xml  在 maven主目录/conf下
```xml
<?xml version="1.0" encoding="UTF-8"?>

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
          http://maven.apache.org/xsd/settings-1.0.0.xsd">
    <!-- localRepository元素根据个人习惯设置本地仓库下载位置，默认为${user.home}/.m2/repository -->
    <localRepository>F:\path\maven-jar</localRepository>
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
