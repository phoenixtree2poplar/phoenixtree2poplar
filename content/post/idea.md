+++
title="idea"
date= 2019-08-25 09:15:46
tags=["idea"]
categories=["idea"]
toc=true
+++
## idea系统配置
###  在安装目录\binidea.exe.vmoptions idea64.exe.vmoptions 2个文件可修改运行内存，根据物理机性能而定
### idea.properties 文件修改可更改默认配置目录，最上面添加如下
```
idea.config.path=F:/dev/ideaconfig/config
idea.system.path=F:/dev/ideaconfig/system
idea.plugins.path=F:/dev/ideaconfig/plugins
idea.log.path=F:/dev/ideaconfig/log
```
## idea激活
```cmd
# idea激活教程 https://blog.lupf.cn/articles/2021/12/30/1640851099736.html
-javaagent:D:\dev\mave-jar\ja-netfilter\ja-netfilter.jar
```
## idea快捷键
```
Alt + Insert  #set/get; 构造方法;  toString; 重写方法。。。
Ctrl+Alt+T  #将代码包在一个块中，例如try/catch  ;synchronized等
Ctrl+E  #最近使用的文件
Ctrl+Shift+E  #最近更改的文件
Ctrl+P  #可以显示参数信息
Ctrl + O  #查看我们继承的类或者接口中的方法，以及我们要实现的方法
Ctrl + Alt + b  #查看接口实现类中方法
Ctrl+Shift+F  #在路径中查找
Ctrl+Shift+R  #在路径中替换
Ctrl+Alt+O  #优化导入的类和包
```
## idea配置
```
Ctrl+Alt+s --> General -> Auto import；fly字段2个勾选上  #idea自动导入jar包
Ctrl+Alt+s --> Font -> Mononspaced；Size -> 18；Line Spacing -> 1.2；  #字体设置
Ctrl+Alt+s --> Compiler -> Build project automatically；  #开启IDEA的自动编译（静态）
Ctrl+Alt+Shift+/ --> Registry -> compiler.automake.allow.when.app.running  #开启IDEA的自动编译（动态）
顶部菜单 --> Edit Configurations -> SpringBoot插件 -> 目标项目 -> 勾选热更新  #开启IDEA的热部署策略（非常重要）
在POM文件添加热部署插件  #在项目添加热部署插件（可选）
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
</dependency>
```
## 启动Run Dashboard
#### 找到.idea下面的workspace.xml文件加入相关配置，最终代码如下
```xml
  <component name="RunDashboard">
    <option name="configurationTypes">
      <set>
        <option value="SpringBootApplicationConfigurationType" />
      </set>
    </option>
    <option name="ruleStates">
      <list>
        <RuleState>
          <option name="name" value="ConfigurationTypeDashboardGroupingRule" />
        </RuleState>
        <RuleState>
          <option name="name" value="StatusDashboardGroupingRule" />
        </RuleState>
      </list>
    </option>
  </component>
```
## idea插件 
- https://blog.csdn.net/HeatDeath/article/details/80156993
- https://blog.csdn.net/win7system/article/details/83508313
#### 想要把IDEA窗口拖拽回当前屏幕，可以找到项目中.idea文件夹下的workspace.xml文件全文搜索ProjectFrameBounds关键字，修改x的值为0或者直接将name=“x”的这一行删除即可，然后重启IDEA即可
