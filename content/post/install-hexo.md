+++
title="install-hexo"
date= 2016-08-12 17:06:56
tags=["hexo"]
categories=["hexo"]
toc=true
+++
# 准备环境
### 安装Windows环境
### 安装Git: https://www.git-scm.com/
### 安装Node.js: https://nodejs.org/en/
####  安装过程就不说了,一直Next就行了
## 1、进入Git Bash
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

## 2、创建github账号并添加key(网上有教程就不进行说明了)
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
## 3、国内直接使用 npm 的官方镜像是非常慢的，这里推荐使用淘宝 NPM 镜像。
```bash
npm config set registry http://registry.npm.taobao.org  #配置淘宝仓库
npm config set prefix “F:\path\npm-pkg”  #设置本地包下载位置(增加相应环境变量)，根据个人，可不改
npm config set cache “F:\path\npm-pkg\cache”  #设置缓存位置，根据个人，可不改
```
# nrm仓库管理工具
```cmd
npm install -g nrm  #全局安装nrm
nrm ls  #列出所有仓库
nrm test  #仓库测试(果断淘宝第一)
nrm use taobao  #使用淘宝仓库
```
## 4、新版特性  支持缩写
```bash
hexo g == hexo generate #生产静态html
hexo s == hexo server  #本地预览   localhost:4000
hexo d == hexo deploy  #推送远程发布，即正式发布
hexo n == hexo new
hexo s -g  #本地测试
hexo d -g  #git发布
```
# 双分支管理git
## 1、创建双分支
1.创建仓库;
2.创建两个分支：master 与 hexo
3.设置hexo为默认分支（因为我们只需要手动管理这个分支上的Hexo网站文件）
4.使用git clone 拷贝仓库
5.在本地github.io文件夹下通过Git bash依次执行
```bash
npm install hexo
hexo init
npm install
npm install hexo-deployer-git  #此时当前分支应显示为hexo，hexo可能洗掉 git环境
```
6.修改_config.yml中的deploy参数，分支应为master
7.这样一来，在GitHub上仓库就有两个分支，一个hexo分支用来存放网站的原始文件，一个master分支用来存放生成的静态网页。
## 2、关于日常的改动流程在本地对博客进行修改（添加新博文、修改样式等等）后，通过下面的流程进行管理。
依次执行
```bash
git add .  #最后有个 “.”  表示当前目录
git commit -m "..."
git push origin hexo  #指令将改动推送到GitHub（此时当前分支应为hexo）
hexo g -d  #发布网站到master分支上
```
虽然两个过程顺序调转一般不会有问题，不过逻辑上这样的顺序是绝对没问题的（例如突然死机要重装了，悲催....的情况，调转顺序就有问题了）。
## 3、本地资料丢失后的流程当重装电脑之后，或者想在其他电脑上修改博客，可以使用下列步骤
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
