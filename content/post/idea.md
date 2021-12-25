+++
title="idea"
date= 2019-08-25 09:15:46
tags=["idea"]
categories=["idea"]
toc=true
+++
## idea系统配置
### 在安装目录 \idea\bin
#### idea.exe.vmoptions idea64.exe.vmoptions 2个文件可修改运行内存，根据物理机性能而定
#### idea.properties 文件修改可更改默认配置目录，最上面添加如下，可以不再C盘存放配置文件
```
idea.config.path=F:/dev/ideaconfig/config
idea.system.path=F:/dev/ideaconfig/system
idea.plugins.path=F:/dev/ideaconfig/plugins
idea.log.path=F:/dev/ideaconfig/log
```
# idea激活
#### 先下载补丁包，网上自行下载
#### idea.exe.vmoptions idea64.exe.vmoptions 文件末尾追加以下
```
-javaagent:F:\dev\ideaconfig\jetbrains-agent.jar
```
#### 一、选择最后一种License server激活方式，地址填入：http://jetbrains-license-server （应该会自动填上），或者点击按钮：”Discover Server”来自动填充地址，完成激活
#### 二、如果服务器激活方式无法激活，还可以选择Activation code方式激活，复制下面激活码即可
```
D00F1BDTGF-eyJsaWNlbnNlSWQiOiJEMDBGMUJEVEdGIiwibGljZW5zZWVOYW1lIjoiaHR0cHM6Ly96aGlsZS5pbyIsImFzc2lnbmVlTmFtZSI6IiIsImFzc2lnbmVlRW1haWwiOiIiLCJsaWNlbnNlUmVzdHJpY3Rpb24iOiJVbmxpbWl0ZWQgbGljZW5zZSB0aWxsIGVuZCBvZiB0aGUgY2VudHVyeS4iLCJjaGVja0NvbmN1cnJlbnRVc2UiOmZhbHNlLCJwcm9kdWN0cyI6W3siY29kZSI6IklJIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In0seyJjb2RlIjoiUlMwIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In0seyJjb2RlIjoiV1MiLCJwYWlkVXBUbyI6IjIwODktMDctMDcifSx7ImNvZGUiOiJSRCIsInBhaWRVcFRvIjoiMjA4OS0wNy0wNyJ9LHsiY29kZSI6IlJDIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In0seyJjb2RlIjoiREMiLCJwYWlkVXBUbyI6IjIwODktMDctMDcifSx7ImNvZGUiOiJEQiIsInBhaWRVcFRvIjoiMjA4OS0wNy0wNyJ9LHsiY29kZSI6IlJNIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In0seyJjb2RlIjoiRE0iLCJwYWlkVXBUbyI6IjIwODktMDctMDcifSx7ImNvZGUiOiJBQyIsInBhaWRVcFRvIjoiMjA4OS0wNy0wNyJ9LHsiY29kZSI6IkRQTiIsInBhaWRVcFRvIjoiMjA4OS0wNy0wNyJ9LHsiY29kZSI6IkdPIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In0seyJjb2RlIjoiUFMiLCJwYWlkVXBUbyI6IjIwODktMDctMDcifSx7ImNvZGUiOiJDTCIsInBhaWRVcFRvIjoiMjA4OS0wNy0wNyJ9LHsiY29kZSI6IlBDIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In0seyJjb2RlIjoiUlNVIiwicGFpZFVwVG8iOiIyMDg5LTA3LTA3In1dLCJoYXNoIjoiODkwNzA3MC8wIiwiZ3JhY2VQZXJpb2REYXlzIjowLCJhdXRvUHJvbG9uZ2F0ZWQiOmZhbHNlLCJpc0F1dG9Qcm9sb25nYXRlZCI6ZmFsc2V9-3OPFIX9/KSL76ctAKOwpBPCCAfUhUbucdNbtqMaTqRryvKEvrFqCKncE0eMHA2YkrcP2CtV9LKjlIXhJMqp0N821Qv1AhuIJrDMBubqiEtiqnGkcGV35DF0GzyUQaUdN6fTbZna05riHzR6yzgEzo9R3RIzCTDMQdB/0EojWM0nCBkPsLdncZeDv3+Y+VA8ZH3/BBvzwR1e0gWsT3mfT9tIvwxPuEhNrQFNOP1PZOjC8nX9h/J7ag5X3JQL1CQVi4TnEipdy0fxKbDPKTloM3Y/bA23uaW+Q/JQFBRKRR0q3FYJ1DQuSc7YmeJ7Q2IHq7u5QYz8jPZJtP6PKs6g/tQ==-MIIECDCCAfCgAwIBAgIJAI5/xwNtz47cMA0GCSqGSIb3DQEBCwUAMBgxFjAUBgNVBAMMDUpldFByb2ZpbGUgQ0EwIBcNMTgwODIzMDcwNDA3WhgPMjExODA3MzAwNzA0MDdaMBExDzANBgNVBAMMBnByb2QzeTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOZ3WopNRg9J8k3apGYFEUGRlvkRsQnQSEz1yMKY4YWg9ElxmuF0mQRAaIj3WOl1eqTn1CXsn4vXV7GODJk9A/rCqEk960sPesWn/RVz7zo5+KazE3Y9yYtwskKxlnkFNp82Kha6dUGDSwG2lYh0Sria2ByOhgr6gmyXtC0PKqlIlTAPcBvz0MEnKTZkxfSqdiHo/meTlMRd9885vr4P52Fd9Ryxe3yVAKZSP9ZzPmRvCvgF1oGCgobZJ5d7FvTwkGt2t4pjy/RlU6FDcXNMHLk4pfJqr3lnEkAh2MbCGlGo1i6Rc6DtgISuJn2AUkrQKhI6F0U7o9e5qPEOjNkhznMCAwEAAaNaMFgwCQYDVR0TBAIwADALBgNVHQ8EBAMCBaAwHQYDVR0OBBYEFJDgSMx4XrLktYOG827wP7VULTnJMB8GA1UdIwQYMBaAFDAS51akWaJlzxC2x4yP3iAYbqtxMA0GCSqGSIb3DQEBCwUAA4ICAQBxRyfCpL7q2VurGfh9XqaC4GsGp6ut3l/rOEyc6DP148A69DRmZ7saqfZW87DcLkmcynPhyBOxdcGwtwKlR9E/+X923JeL6VPQCTY5WyJKib36vQCnoC4ELTnw1yc51v2j+MaZXjrlzBIcCUocWK14WS4iBycUwLuMszz6rJ8xluuYDKDeNcS/AjQf+yTUfDXjktHLgcE27sSEQUQ+7bpbKHkJ5xBvaupJEPX+ndj7V2eD+/sO03jgnsWVa2nky7yDXX/5KCqzL5kAA1n2t2dWSJXxpac8O2bPyRhk6dUSwzNr+IjCjHqUKIouB0nosi85Q5MaIE0pwOOSggnawpnjmL3qDnsS/n7NUcX/mF4eiNQ8cMJmKIgfS6rntKuQY2zSod+4+G0AFbiihVTnKsRf7CiJa/VniZdaGdbclT8KzRnNKJ1TrPO8rVPjg+SpvqTq75xynS08/OXCpoJ3aVeBWZJYJmheHhvJw2RiNW2P2GSIw+m6HIIsthUtvvHqdKpIaThFHAOKmw0LpPO7uGs/z/Q3un7+lqSlW7akUoSCHdiAJ4wWv+qFEgE4mq8bKtHoa9yy6FZBoORbbRTj8WkS+UvCLN5p7kZenmKYnWCzBf02O1ULpMsR5WvKCGCekSwWf3lAF9lYTL12JaFTw9iH1nSkyvcu7AoXlWI50hOhmA==
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
### idea插件 https://blog.csdn.net/HeatDeath/article/details/80156993
### idea插件 https://blog.csdn.net/win7system/article/details/83508313
想要把IDEA窗口拖拽回当前屏幕，可以找到项目中.idea文件夹下的workspace.xml文件全文搜索ProjectFrameBounds关键字，修改x的值为0或者直接将name=“x”的这一行删除即可，然后重启IDEA即可
