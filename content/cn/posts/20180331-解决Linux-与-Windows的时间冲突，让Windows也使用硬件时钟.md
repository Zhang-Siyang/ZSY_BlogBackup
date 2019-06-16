---
title: 解决Linux 与 Windows的时间冲突，让Windows也使用硬件时钟
date: 2018-03-31 13:02:30
tags:
---
非常简单，设置一下注册表即可：

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation]
"RealTimeIsUniversal"=dword:00000001
```

保存为 .reg 文件，双击导入系统注册表即可
