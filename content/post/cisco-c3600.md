+++
title="cisco-c3600"
date= 2017-06-01 14:23:12
tags=["路由器","route"]
categories=["route"]
toc=true
+++
![](TCP-IP.jpg)
```bash
en                     #enable  进入特权模式
disa                   #disable  退出特权模式，进入用户模式
conf t                 #configure terminal  进入全局配置模式
tab                    #可补全命令
？                     #可显示开头命令

int f0/0               #interface f0/0  进入指定接口配置
ip add 192.168.1.1 255.255.255.0 #ip address 在接口配置下为该接口添加IP
ip add dhcp            #接口配置下设置该接口为dhcp模式
no sh                  #no shutdown  在接口配置下打开该接口
ip route 21.21.21.21 255.255.255.255 33.33.33.33  #21是指定IP，255是匹配精确度，33下一跳或者接口
ip route 0.0.0.0 0.0.0.0 21.21.21.21              #21.21.21.21 为默认路由
ip route 1.1.1.1 0.0.0.0 2.2.2.2 50               #50 是管理距离，越大越不优先，最大255
ip route 1.1.1.0 255.255.255.0 null 0             #垃圾桶路由
ipv6 enable            #在接口配置下开启ipv6支持，自带链路本地地址 互联

router os 2            #router ospf 2  开启ospf 线程为2
router-id  2.2.2.2     #设置 路由id 默认优先为回环口地址 其次最大接口地址
net 0.0.0.0 0.0.0.0 a 0#network 0.0.0.0 0.0.0.0 area 0  所有网路划入 主网域
ip os 2 a 0            #ip ospf 2 area 0 接口配置下可将该接口划入指定网域
ip os net point-to-point #ip ospf network point-to-point  优化ospf为点对点网络
cle ip os pro          #clear ip ospf process  清除ospf进程

no ip routing          #清空并关闭路由
ip routing             #开启路由  与之上一起可重置路由表

sh run                 #show running-config 查看运行配置   后加 “ | s  ** ”  可匹配指定项
sh ip ro               #show ip route  显示路由表
sh ip int b            #show ip interface  brief  显示接口信息
sh ip os da            #show ip ospf database  显示ospf 数据库
sh ip os da ro         #show ip ospf database route 显示ospf路由表
sh ip os n             #show ip ospf neighbor 显示ospf邻居关系
sh line                #显示连接
clear line number      #关闭指定连接

enable password        #修改特权密码
enable secret          #加密密码
enable use-tacacs      #用tacacs服务器匹配密码

line vty 0 4           #开启远程控制 
no login               #不用登录
login                  #登录
password               #登录密码
privilege level 15     #权限15即特权模式
username ccna privilege 15 password ciso #用户名 ccna 登录等级 15特权  密码 ciso
```