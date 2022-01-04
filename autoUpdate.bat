@echo off
echo "开始自动推送代码 git push"
git add *
git commit -m "auto update"
git push
echo "执行 git push 自动推送完成"