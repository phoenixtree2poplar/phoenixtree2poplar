+++
title="shell"
date= 2020-03-04 21:06:27
tags=["shell"]
categories=["shell"]
toc=true
+++
# for循环
### for1.sh
```sh
#!/bin/bash
for ((i=1;i<=5;i++))
do
  echo $i >> test.txt
done
```
### for2.sh
```sh
#!/bin/bash
for i in {a..z} {A..Z} {0..9}  # 可任意组合
do
  echo $i >> test.txt
done
```
### for3.sh
```sh
#!/bin/bash
for i in `ls`  # ``为前置执行符
do
  echo $i >> test.txt
done
```