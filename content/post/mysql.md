+++
title="mysql"
date= 2019-08-25 14:46:27
tags=["sql","mysql"]
categories=["sql"]
toc=true
+++
## Mysql 命令
```cmd
desc table；  #显示表头
select Host,User,plugin from user;  #用户名，登录方式，用户名，认证方式，
ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'root';  #修改root认证方式mysql_native_password，密码为root
FLUSH PRIVILEGES;  #刷新认证表
UPDATE user SET Password=PASSWORD('newpassword') where USER='root';   #修改密码
ALTER USER root@localhost identified WITH mysql_native_password BY 'root';  #修改密码

set password for root@localhost = password('root');   #进入数据修改密码 mysql5.7
mysql> use mysql;  #切换库
mysql> update user set host = '%'  where user = 'root';  #授权非本地登录
```
## Mysql7解压版cmd命令安装
```cmd
解压目录下新建  my.ini  文件，内容如下
----------
[mysqld]
port= 3306                      #服务器端口
basedir="D:/path/mysql7"        #安装目录（因人而异）
datadir="D:/path/mysql7/data"   #数据保存位置（必须存在，不然报错）
max_connections=200
character-set-server=utf8
default-storage-engine=INNODB
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
[mysql]
default-character-set=utf8
----------
在解压目录bin下启动cmd（管理员权限）
mysqld --initialize-insecure  #初始化无密码数据库
mysqld --install  sql7  #安装服务，服务名为 sql7（个人喜好）
net start sql7           #开启数据库 提示成功，表示安装成功
```
## 连接MySQL时的url解析
```
jdbc:mysql://localhost:3306/popalr?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&useSSL=true
```
#### localhost：地址
#### 3306：端口，默认是3306
#### newdb：数据库名
#### useUnicode=true：true表示使用unicode编码
#### characterEncoding=UTF-8：字符集
#### zeroDateTimeBehavior=convertToNull：java在连接mysql数据库时，在操作值为0的timestamp类型时不能正确的处理，而是默认抛出一个异常，就是所见的：java.sql.SQLException: Cannot convert value '0000-00-00 00:00:00' from column 7 to TIMESTAMP。这一问题在官方文档中有详细说明。
#### 在JDBC连接串中有一项属性：zeroDateTimeBehavior,可以用来配置出现这种情况时的处理策略，该属性有下列三个属性值：
#### exception：默认值，即抛出SQL state [S1009]. Cannot convert value....的异常；
#### convertToNull：将日期转换成NULL值；
#### round：替换成最近的日期即0001-01-01；
#### 因此对于这类异常，可以考虑通过修改连接串，附加zeroDateTimeBehavior=convertToNull属性的方式予以规避，例如：
#### jdbc:mysql://localhost:3306/mydbname?zeroDateTimeBehavior=convertToNull
#### 从另一个层面讲，这类异常的触发也与timestamp赋值的操作有关，如果能够在设计阶段和记录写入阶段做好逻辑判断，避免写入 '0000-00-00 00:00:00'这类值，那么也可以避免出现 Cannot convert value '0000-00-00 00:00:00' from column N to TIMESTAMP的错 误。
#### useSSL=true：使用JDBC跟你的数据库连接的时候，你的JDBC版本与MySQL版本不兼容，MySQL的版本更高一些，在连接语句后加上“useSSL=‘true’” ，就可以连接到数据库了。
### mysql最强笔记 【https://mp.weixin.qq.com/s/mzFdir8920uYmj5AI8TJ8Q