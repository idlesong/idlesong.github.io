---
layout: post
title:  "在MacbookAir2013上安装Ubuntu Gnome"
categories: jekyll update
---
# 在MacbookAir2013上安装Ubuntu Gnome 14.04注意事项

### 1.下载安装Ubuntu Gnome 14.04
提示：Ubuntu Gnome 14.04已不再需要专门的Mac版本

### 2.参考这个[安装教程](http://www.thatsthewayyoudoit.me/2013/04/how-to-install-ubuntu-1304-on-macbook.html)完成Ubuntu Gnome的安装。
EFI select sda (the default one)

注意:安装Ubuntu时一定要选择： something else(to assign the / ).

### 3.安装好系统，需针对Macbook Air 2013稍作修改
Ubuntu Gnome 14.04 在MacbookAir上安装bug已不太多，稍微修改即可。

1. grub的修改
  - 在grub中添加nosmp参数; 修改/etc/defaults/grub文件，使其永久保存；
2. wifi驱动的安装（Broadcom 802.11 Linux STA wireless driver）
[driver deb](http://launchpadlibrarian.net/157283339/bcmwl-kernel-source_6.30.223.141%2Bbdcom-0ubuntu2_amd64.deb);需要先安装dkms依赖
3. 按键的Bug修改
grave asciitilde key:
> xmodmap -e "keycode 49 shift = less greater"
> xmodmap -e "keycode 94 shift = grave asciitilde"

### 4.Ubuntu Gnome配置和常用软件安装
1. 输入法的安装 Fcitx google-pinyin （安装好后用Fcitx配置工具选择）
2. Chrome的安装
3. goagent的安装

### 4.reference
- [在MacbookAir2013上安装Ubuntu](http://www.thatsthewayyoudoit.me/2013/04/how-to-install-ubuntu-1304-on-macbook.html)
- [修改Macbook上的ubuntu的bug](http://blogs.aerys.in/jeanmarc-leroux/2013/08/28/ubuntu-13-04-on-the-new-macbook-air-2013/)
- [修改Macbook上的ubuntu的bug2](http://www.miek.nl/blog/archives/2013/08/31/macbook_air_61_2013_model_with_ubuntu/index.html)
- [ubuntu配置和常用软件](http://my.oschina.net/daizhe11/blog/170150)
