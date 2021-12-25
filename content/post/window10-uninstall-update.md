+++
title="window10 uninstall update"
date= 2017-05-23 08:38:16
tags=["win10"," win10禁止更新","打印机服务"]
categories=["win10"]
toc=true
+++
## Win10系统关闭自动更新方法如下
1.按Win键+R键调出运行，输入“gpedit.msc”点击“确定”，调出“本地组策略编辑器”。
2.顺序依次展开"计算机配置"，"管理模板" ，"windows组件" ，"windows更新 "。
3.在右面找到“配置自动更新”，并双击,在配置窗口上的顺序选择“已禁用”，点击“应用”，“确定”。
4.最后重启。
## Windows查询激活时间
使用 Windows + R组合快捷键打开运行命令框
```bash
slmgr.vbs -dlv  #该命令命令可以查询到Win10的激活信息，包括：激活ID、安装ID、激活截止日期等信息     
slmgr.vbs -dli  #命令可以查询到操作系统版本、部分产品密钥、许可证状态等
slmgr.vbs -xpr  #命令可以查询Win10是否永久激活
```
## print spooler启动失败（win10 打印机服务）
在启动print spooler服务时，报启动错误1068依赖服务或组无法启动，找依赖服务等等用了各种方式，还是不好！
在开始----》运行  中输入以下命令：
``` bash
sc config spooler depend= rpcss  #要以管理员身份运行，看了下资料说这个命令是恢复系统默认的依赖关系
```