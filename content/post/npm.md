+++
title="npm"
date= 2020-01-18 22:03:18
tags=["node","npm"]
categories=["npm"]
toc=true
+++
# [nodejs](https://nodejs.org/en/)包管理工具npm
```cmd
npm config set registry http://registry.npm.taobao.org  #配置淘宝仓库
npm config set prefix “F:\path\npm-pkg”  #设置本地包下载位置(增加相应环境变量)
npm config set cache “F:\path\npm-pkg\cache”  #设置缓存位置
```
# nrm仓库管理工具
```cmd
npm install -g nrm  #全局安装nrm
nrm ls  #列出所有仓库
nrm test  #仓库测试(果断淘宝第一)
nrm use taobao  #使用淘宝仓库
```