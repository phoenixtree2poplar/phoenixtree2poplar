+++
title="Remove OneDrive"
date= 2017-05-05 10:27:52
tags=["OneDrive","Remove-OneDrive"]
categories=["win10"]
toc=true
+++
## 关于禁止onedrive自启动简单的就是在任务管理器的启动中禁用onedrive的启动项目就可以。
## 关于组策略管理
运行gpedit.msc，进入【计算机配置】-【管理模板】-【windows组件】-【onedrive】，右侧的三个选项：
默认情况下，将文档保存到 OneDrive，选择禁用；
禁止使用 OneDrive 进行文件存储，选择启用
禁止OneDrive 文件通过按流量的连接同步，选择启用。
如果是准备彻底删除onedrive，组策略的这三项其实是不用理会的，因为onedrive都没有了，这个策略设置就毫无意义。这个策略可能适用于同步行为的设置。
## 关于删除onedrive的程序卸载
### 卸载方法：运行输入 
```cmd
%localappdata%\Microsoft\OneDrive\  #查看版本号，一般是一串数值的形式。
%localappdata%\Microsoft\OneDrive\XXXXXXXXXXXXXXX(刚才查看到的那个版本号)\OneDriveSetup /uninstall  #这个命令可以卸载掉大多的onedrive程序，剩余的可以自行删除（可能须要权限设置或者以管理员模式运行cmd）
```
## 关于删除导航栏中的onedrive
卸载onedrive是不能清除导航栏里面的onedrive，进入注册表：
HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder
把右侧的Attributes属性的值 f080004d修改为f090004d。
重启资源管理器后生效
## 彻底把onedrive完全砍掉了,运行输入 
```bash
%localappdata%\Microsoft \onedrive  #最后记得重启
```