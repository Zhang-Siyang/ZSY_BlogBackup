---
title: JDK 的安装与配置【For Windows】
date: 2017-02-21 23:15:17
tags: [JDK,Java,Guide]
---

## JDK 的安装

1. 下载 JDK 安装包

我本人推荐从官网下载 JDK ，不要在什么 百度、360 上面下载
`http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html`
	
选择合适你的版本，就像我，我选择的就是下图中最后那一个【阅读协议后，点击接受协议】
<!--more-->
![Java 官网下载界面](https://i.imgur.com/yoy2QX0.png)
2. 安装其实很简单，下一步 下一步 下一步就好了，如果已经安装过 JDK 或 JDE，最好卸载干净之后再安装新版 JDK。

## JDK的配置

1. 先寻找 JDK 安装到了哪里
	
    1. 一般都是安装到了 `C:\Program Files\Java\jdk1.8.0_121` 这样的路径
文件夹下通常有以下文件：![文件夹概览](https://i.imgur.com/ccqQ6ae.png)
`bin/ jre/ src.zip COPYRIGHT lib/ THIRDPARTYLICENSEREADME.txt db/ LICENSE THIRDPARTYLICENSEREADME-JAVAFX.txt include/ README.html javafx-src.zip release`
    2. 复制这个路径 

至此，安装完成，下一步配置 JDK 环境  
2. `Win` + `R` 打开运行，输入 `sysdm.cpl` ，回车 
  
    1. 切换到 `高级` 选项卡，点击环境变量按钮，可参考下图
![切换到 `高级` 选项卡，点击环境变量](https://i.imgur.com/NxhRSVS.png)  
		
        1. 新建变量，名为 `JAVA_HOME` ,路径为 `C:\Program Files\Java\jdk1.8.0_121` 【就是我们刚才找到的那个安装路径】
![各个按钮的位置](https://i.imgur.com/vGn95lT.png)
		
        2. 点击 Path ，点击编辑，点击 编辑文本 ，可参考下图
![编辑文本按钮的位置](https://i.imgur.com/lTMyMwM.png)
		
在出来的一串字符的最前面添加 `%JAVA_HOME%/bin;%JAVA_HOME%/jre/bin;` 保存退出。

        3.  新建变量，名为 `CLASSPATH` ,路径为 `.;%JAVA_HOME%/lib/dt.jar;%JAVA_HOME%/lib/tools.jar` 【千万不要忽略前面的那个点】

        4. 保存退出

至此，配置完成，下一步检测安装是否正确
3. `Win` + `R` 打开运行，输入 `cmd` ，回车

    1. 输入 `java -version` ，回车后出现如下内容即为正常
    ```
    java version "1.8.0_121"
    Java(TM) SE Runtime Environment (build 1.8.0_121-b13)
    Java HotSpot(TM) 64-Bit Server VM (build 25.121-b13, mixed mode)
    ```
    2. 输入 `javac -version` ，回车后出现如下内容即为正常
    ```
    javac 1.8.0_121
    ```
至此，安装与配置过程结束

----EOF--
