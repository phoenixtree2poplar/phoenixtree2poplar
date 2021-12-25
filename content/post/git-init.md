+++
title="git-init"
date= 2019-07-12 21:49:14
tags=["git"]
categories=["git"]
toc=true
+++
# gitgub初始化
````sh
cd /d				#切换到d盘
mkdir git			#建立git目录
cd  git				#进入git目录
git init			#初始化仓库
git config --global user.name "phoenixtree"                               #设置用户名                       
git config --global user.email "wu_ton-g@foxmail.com"                   #设置用户邮箱
git remote add origin git@github.com:phoenixtree2poplar/only-test.git   #关联远程仓库

#########第一次SSH认证时候用##############
rm -fr ~/.ssh                           #删除本地密码对
ssh-keygen -t rsa  -C "wu_ton-g@foxmail.com"    #生成密码对
cp ~/.ssh/id_rsa.pub .                  #拷贝密码锁到  git目录
############网页操作--将密码锁添加到远程github账号##############

git add *           #添加文件到缓存区域
git commit          #提交文件到本地库
git tag  v.x.x      #打标签 
git push            #最后一步推送代码到远程仓库
````