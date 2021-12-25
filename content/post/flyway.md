+++
title="flyway"
date= 2019-12-06 22:16:49
tags=["flywaty"]
categories=["flywaty"]
toc=true
+++
# 官网 【https://flywaydb.org/
### Flyway是独立于数据库的应用、管理并跟踪数据库变更的数据库版本管理工具。用通俗的话讲，Flyway可以像Git管理不同人的代码那样，管理不同人的sql脚本，从而做到数据库同步。
## 流程
#### 1、首先配置好flyway的基本信息后，运行项目，会在数据库表中默认新建一个数据表用于存储flyway的运行信息，默认的数据库名：flyway_schema_history
#### 2、紧接着Flyway将开始扫描文件系统或应用程序的类路径进行迁移。然后，Flyway的数据迁移将基于对用sql脚本的版本号进行排序，并按顺序应用：
#### 可以看到执行数据库表后在checksum中储存一个数值，用于在之后运行过程中对比sql文件执行是否有变化。
###### 注意：
###### flyway在执行脚本时，会在源数据表中检查checksum值，并确定上次运行到哪一个脚本文件，本次执行时从下一条脚本文件开始执行。所以编写脚本的时候不要去修改原有的脚本内容，并且新的脚本版本号要连续
## 命名规范
#### sql 脚本存放目录:src/main/resources/db/migration
#### 对应一个程序版本的多个脚本，从1开始，比如1.0.9版本，有多个任务：张三负责a任务（tapd号为1111111），李四负责b任务（tapd号为222222），他们的任务都涉及到db更新他们会分别创建两个脚本：
#### V1.0.1__init-poplar.sql
#### V1.2.2__init-poplar.sql
#### 说明：V大写，中间是两个下划线

````xml
<plugin>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-maven-plugin</artifactId>
    <version>6.1.0</version>
    <dependencies>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.47</version>
        </dependency>
    </dependencies>
    <configuration>
        <url>
            jdbc:mysql://localhost:3306/poplar?useUnicode=true&amp;characterEncoding=UTF-8&amp;useSSL=false
        </url>
        <driver>com.mysql.jdbc.Driver</driver>
        <user>root</user>
    </configuration>
</plugin>
````