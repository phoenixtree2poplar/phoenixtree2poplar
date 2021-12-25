+++
title="Windows"
date= 2019-11-15 21:57:50
tags=["cmd","bat","脚本"]
categories=["cmd"]
toc=true
+++
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
```
## bat脚本
```cmd
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