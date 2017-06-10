---
title: 红米Note3 强刷及强制解除 Bootload 锁教程
date: 2017-02-03 20:50:53
tags: [XiaoMi,RedMi Note3,Guide,Unlock,Flash]
---
昨天【2017-02-02】想给手机从头到尾重新做一遍系统，结果一不小心把手机 BL 锁上了，手机系统又已经清空无法用官方工具解锁，多亏了下面那篇译文才得以重新解开 BL 锁。这篇文章就是把那篇译文整理之后的作品。

<!-- more -->
>闲话：一直以来都比较喜欢小米公司，觉得很合我的心，年轻、爱发烧，但最近我发现去官网找个文件都找不到，“产能不足”也很严重。是小米急躁了吗？


## 进入9008强刷模式
1. 解压附件"fastboot_edl.7z"并进入解压出的文件夹，你应该能看到几个文件
2. 重启你的手机到 fastboot 模式（按住“音量下”与“电源键”），将之连接电脑
3. 双击文件夹中的 edl.cmd
4. 手机震动之后，就代表已经从 900E 模式暂时跳转到 9008 模式了，手机会亮起红色呼吸灯，具体可进入设备管理器确认
5. 进入设备管理器，安装附件中的高通驱动

## 强行解锁bootloader##
1. 将线刷前的手机系统开启 开发者模式 并开启 OEM解锁模式
2. 用 Unlocked_Bootloader.zip 中的 emmc_appsboot.mbn 替换线刷包中的对应文件
3. 在9008模式下用文末提供的刷机工具刷入经替换之后的线刷包【建议选择 清除所有数据 】。刷入之后进入 Fastboot 模式，在电脑端执行以下命令即可解除BL锁
 * `fastboot oem unlock-go`

 * `fastboot oem device-info`

 第二条命令提示“Device unlocked：ture”【如下图】代表成功解锁，机器会震动后进入系统
 ![解锁成功](https://p1.bqimg.com/1949/a8a8d483042116a7.png)
 若解锁失败，机器震动后将会闪两次 MI 字界面 之后黑屏，失败原因大多是线刷前系统未开启开发者模式-未勾选OEM解锁模式选项



## 所需文件


>*Name:*【刷机工具】*MiPhone20151028.exe*
>-
>Size:26.0 MB (27,305,815 字节)
>CRC32: 47962DD3
>MD5: 64A2B6F5620DB2BF249DAC0CE2017428
>SHA-1: 7FA20958DA2A4061DAFA5A007D3575895927EED7
>Download:http://121.22.250.4/bigota.d.miui.com/tools/MiPhone20151028.exe
>*Name:*【高通驱动】*Qualcomm_Driver.7z*
>-
>Download:https://www.dropbox.com/s/owqq8f5385j2c5n/Qualcomm_Driver.7z?dl=1
>Size:339 KB (347,919 字节)
>CRC32: 37EB2F65
>MD5: 50C8020099D6DE5F8DD92F485CA95A9B
>SHA-1: A906552770CB6286A50A2016EC639D01B2D33EA9
>*Name:*【原线刷包】*kenzo_global_images_V7.1.8.0.LHOMICL_20160129.0000.14_5.1_global_9706e12561.tgz*
>-
>Size:1.26 GB (1,356,148,824 字节)
>CRC32: 334B0B9A
>MD5: 9706E1256126FCB74F373BCAB6848E9E
>SHA-1: B7D9FC7C80ADF0D94002A0BFF8B3A16ADDA8C14D
>Download:http://obigota.d.miui.com/V7.1.8.0.LHOMICL/kenzo_global_images_V7.1.8.0.LHOMICL_20160129.0000.14_5.1_global_9706e12561.tgz
>*Name:fastboot_edl.7z*
>-
>Size:135 KB (138,259 字节)
>Download:https://www.dropbox.com/s/p6noweo7yl21d5g/fastboot_edl.7z?dl=1
>CRC32: E79A4C7F
>MD5: BD5DB3C6DDA08910312849CF39EE3F18
>SHA-1: 7A9FE43E254A4C7B22BB7A2890903F7D029B9378
>*Name:Unlocked_Bootloader.zip*
>-
>Size:212 KB (217,205 字节)
>Download:https://www.dropbox.com/s/vw3nf1zbvvco44h/Unlocked_Bootloader.zip?dl=1
>CRC32: D2CCA8C7
>MD5: F69EEB321FB63C4CCAC51CBEF7545B87
>SHA-1: 51CBFD17C177841A1786095BFFEABFC53E536EE6

注：如以上文件的下载链接失效，请发送邮件至CE.BB.CAT(at)GMAIL.COM。特别地，线刷包【可能】可以用其他线刷包替代。

原文【By:emuzychenko】：https://forum.xda-developers.com/android/software-hacking/guide-how-to-reboot-to-edl-fastboot-t3394292

本文基于译文【By:clawneo】：http://bbs.zhiyoo.com/forum.php?mod=viewthread&tid=12591147
