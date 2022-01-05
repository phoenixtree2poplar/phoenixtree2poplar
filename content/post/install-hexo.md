+++
title="install-hexo"
date= 2016-08-12 17:06:56
tags=["hexo"]
categories=["hexo"]
toc=true
+++
## 准备环境
#### 安装Windows环境
#### 安装Git: https://www.git-scm.com/
#### 安装Node.js: https://nodejs.org/en/
#### 安装过程就不说了,一直Next就行了
## 进入命令行
```cmd
npm install -g hexo  #注意：-g是指全局安装hexo
```
安装完成后，在你喜爱的文件夹下（如D:\Hexo），执行以下指令(在D:\Hexo内点击鼠标右键，选择Git Bash)
```cmd
hexo init  #Hexo即会自动在目标文件夹建立网站所需要的所有文件
npm install  #安装依赖包
hexo generate
hexo server  #也可以输入缩写 hexo s -g (gener + server)
```
现在我们已经搭建起本地的hexo博客了，执行以下命令(在D:\Hexo)，然后到浏览器输入localhost:4000看看。
## 创建github账号并添加key(网上有教程就不进行说明了)
建立与你用户名对应的仓库，仓库名必须为【your_user_name.github.io】，固定写法然后建立关联
现在我们需要_config.yml文件，来建立关联，可参考[官网](https://hexo.io/)说明 https://hexo.io/docs/deployment.html
编辑  _config.yml 翻到最下面，改成我这样子的
```yaml
deploy:
  type: git
  repo: <repository url>
  branch: [branch]
  message: [message]
```
安装hexo-deployer-git
```bash
npm install hexo-deployer-git --save  #支持git发布
hexo d -g  #发布你的 blog
```
你的博客就搭建成功了  网址为your_user_name.github.io
## 国内直接使用 npm 的官方镜像是非常慢的，这里推荐使用淘宝 NPM 镜像。
```bash
npm config set registry http://registry.npm.taobao.org  #配置淘宝仓库
npm config set prefix “F:\path\npm-pkg”  #设置本地包下载位置(增加相应环境变量)，根据个人，可不改
npm config set cache “F:\path\npm-pkg\cache”  #设置缓存位置，根据个人，可不改
```
## 新版特性  支持缩写
```bash
hexo g == hexo generate #生产静态html
hexo s == hexo server  #本地预览   localhost:4000
hexo d == hexo deploy  #推送远程发布，即正式发布
hexo n == hexo new
hexo s -g  #本地测试
hexo d -g  #git发布
```
## 本地资料丢失后的流程当重装电脑之后，或者想在其他电脑上修改博客，可以使用下列步骤
1. 使用git clone 拷贝仓库（默认分支为hexo）；
2. 在本地新拷贝的github.io文件夹下通过Git bash依次执行下列指令：
```bash
npm install hexo
npm install
npm install hexo-deployer-git  #记得，不需要hexo init这条指令
```
## hexo添加图片
```bash
npm install https://github.com/CodeFalling/hexo-asset-image --save #安装图片插件
#这样，在你新创建  hexo n  博客时就会在与博客同目录自动创建同名文件夹，将图片放入该文件夹
{% asset_img  你的图片全名包含后缀 %}  #博客中插入图片格式(使用markdown格式将无法显示)
```
## nrm仓库管理工具
```cmd
npm install -g nrm  #全局安装nrm
nrm ls  #列出所有仓库
nrm test  #仓库测试(果断淘宝第一)
nrm use taobao  #使用淘宝仓库
```