+++
title="win装机"
date= 2020-03-15 17:28:12
tags=["pkgs","win装机"]
categories=["pkgs"]
toc=true
+++
## Win装机
C盘100G
1. [Windows官网](https://www.microsoft.com/zh-cn/software-download/windows10)最新镜像制作-->安装 [国内镜像](https://msdn.itellyou.cn)
2. 系统文件夹地址更改(重要)
3. 安装完后更新一次
4. 关闭Windows保护 --> 关闭Win更新 -->  win10 Defender一键关闭 --> Windows激活-->重启
5. 开启备份
## software
1. winrar 解压软件 + 迅雷 (修改下载位置) + [ccleaner](https://www.ccleaner.com/)
2. [chrome](https://www.google.cn/intl/zh-CN/chrome) + [搜狗输入法](https://pinyin.sogou.com/zhihui) (智慧版)
3. [微信](https://weixin.qq.com) + [QQ](https://im.qq.com/) (文件位置修改)
4. [notepad++](https://notepad-plus.en.softonic.com/) 主题obsidian
5. [honeyview](https://honeyview.en.softonic.com/) 图片浏览器 + FSCapture(截图工具) + 图片压缩工具
6. [potplayer](http://potplayer.org/) 视频播放器
7. [网易音乐](https://music.163.com) + [QQ音乐](https://y.qq.com/) (文件位置修改)
8. [百度云盘](https://pan.baidu.com/download/) + [阿里云盘](https://www.aliyundrive.com/) 存储装大盘
9. [WPS](https://www.wps.cn/) + [SumatraPDF](https://www.sumatrapdfreader.org/) + [typora](https://www.typora.io/) markdown编辑器
10. [everything](https://everything.en.softonic.com/) + [有道词典](https://www.youdao.com/)
11. [打印机驱动](https://support.hp.com/cn-zh/drivers/selfservice/hp-laserjet-pro-m1136-multifunction-printer-series/5094778)
## dev
- jdk
- [git](https://git-scm.com/)
- [maven](https://archive.apache.org/dist/maven/maven-3/)(仓库位置修改),
- [node](http://nodejs.cn/) +npm(仓库位置修改+换阿里镜像)
- [hugo](https://github.com/gohugoio/hugo/releases)
- ide(修改位置)
- [mysql7](https://dev.mysql.com/downloads/mysql)
- navicat数据库连接工具
- xhell
### dev选装
- [docker](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
- [postman](https://www.getpostman.com/)
- [nginx](http://nginx.org/en/download.html)
- [redis](https://github.com/microsoftarchive/redis/releases)
- [TortoiseGit+中文补丁](https://tortoisegit.org/download/)
- [jdk1.8中文文档](https://docs.oracle.com/javase/8/docs/)
## plugins插件
- [idea插件官网](https://plugins.jetbrains.com)
    - EasyCode
    - free mybatis plugin
    - maven helper
## vpn
- [clash](https://github.com/Fndroid/clash_for_windows_pkg/releases) win
- [v2rayN](https://github.com/2dust/v2rayN/releases) win
- [v2rayNG](https://github.com/2dust/v2rayNG/releases) Android
- [v2rayx](https://github.com/Cenmrev/V2RayX/releases) mac
- [科学上网官网](https://github.com/haotian-wang/google-access-helper)
## 装一个win10虚拟机(安装未知软件)
## Win10系统关闭自动更新方法如下
1.按Win键+R键调出运行，输入“gpedit.msc”点击“确定”，调出“本地组策略编辑器”。
2.顺序依次展开"计算机配置"，"管理模板" ，"windows组件" ，"windows更新 "。
3.在右面找到“配置自动更新”，并双击,在配置窗口上的顺序选择“已禁用”，点击“应用”，“确定”。
4.最后重启。
## Windows查询激活时间
使用 Windows + R组合快捷键打开运行命令框
```bat
slmgr.vbs -xpr  #命令可以查询Win10是否永久激活
```
## software选装:
- [wox](http://www.wox.one/) 本地软件搜索神器
- [BeyondCompare](http://www.scootersoftware.com/download.php) 对比工具
- [xmind](https://www.xmind.cn/)
- [360急速浏览器](https://browser.360.cn/ee)
- [蓝牙驱动](https://www.lulian.cn/download/list-122-cn.html)
## print spooler启动失败（win10 打印机服务）
在启动print spooler服务时，报启动错误1068依赖服务或组无法启动，找依赖服务等等用了各种方式，还是不好！
在开始----》运行  中输入以下命令：
``` bash
sc config spooler depend= rpcss  #要以管理员身份运行，看了下资料说这个命令是恢复系统默认的依赖关系
```
## 禁止onedrive自启动简单的就是在任务管理器的启动中禁用onedrive的启动项目就可以。
## 组策略管理
运行gpedit.msc，进入【计算机配置】-【管理模板】-【windows组件】-【onedrive】，右侧的三个选项：
默认情况下，将文档保存到 OneDrive，选择禁用；
禁止使用 OneDrive 进行文件存储，选择启用
禁止OneDrive 文件通过按流量的连接同步，选择启用。
如果是准备彻底删除onedrive，组策略的这三项其实是不用理会的，因为onedrive都没有了，这个策略设置就毫无意义。这个策略可能适用于同步行为的设置。
## 删除onedrive的程序卸载，卸载方法：运行输入
```cmd
%localappdata%\Microsoft\OneDrive\  #查看版本号，一般是一串数值的形式。
%localappdata%\Microsoft\OneDrive\XXXXXXXXXXXXXXX(刚才查看到的那个版本号)\OneDriveSetup /uninstall  #这个命令可以卸载掉大多的onedrive程序，剩余的可以自行删除（可能须要权限设置或者以管理员模式运行cmd）
```
## 删除导航栏中的onedrive
卸载onedrive是不能清除导航栏里面的onedrive，进入注册表：
HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder
把右侧的Attributes属性的值 f080004d修改为f090004d。
重启资源管理器后生效
## 彻底把onedrive完全砍掉了,运行输入
```bash
%localappdata%\Microsoft \onedrive  #最后记得重启
```