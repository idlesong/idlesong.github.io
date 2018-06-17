---
layout: post
title:  "Debian 9,10 and common software installation"
categories: Linux
tags: [Debian, Linux]
---
## Debian installation
### installation
- [Getting Started from official: www.debian.org](https://www.debian.org/)
- Getting Started:
 - [obtain a copy(stable): download a DVD-1.iso](https://www.debian.org/distrib/)
 - [obtain a copy(testing): download a DVD-1.iso](https://cdimage.debian.org/cdimage/buster_di_alpha2/amd64/iso-dvd/)
- [installation instructions](https://www.debian.org/releases/stable/amd64/)
 - Windows: win32diskimager
 - Linux: cp debian.iso /dev/sdX && sync

### installation tips
1. Debian butter is testing, but *Debian testing is stable enough*
1. Download a DVD-1.iso instead of netinst to avoid trouble.
1. [intel wifi drivers: iwlwifi](https://packages.debian.org/jessie/firmware-iwlwifi)

### debian setup
1. [Flathub setup for Gnome Software](https://flatpak.org/setup/Debian/)
1. [sudo setup](https://wiki.debian.org/sudo)
1. Chinese input(中文输入法:ibus-rime, ibus-pinyin)
 - Setup Chinese Language first
```
$ sudo vi /etc/locale.gen
# uncomment zh.CN.UTF-8 UTF-8
$ locale.gen
# gnome-settings/Region & Language, select 汉语
```
 - install ibus-pinyin, ibus-rime
 - ibus-setup

### Gnome Tweaks
1. Gnome: Adwaita Dark; Font size 13

## debian software installation
1. install popular software from gnome-software
1. install other software from apt-install
1. install .deb with dpkg
1. install executable software, and [create gnome launcher shortcut](https://unix.stackexchange.com/questions/211005/create-launcher-shortcut)

### install common Software
#### Atom
1. install: Gnome-software with Flathub
1. tweak font size: [change atom ui font size](https://discuss.atom.io/t/how-to-set-the-font-for-the-settings-ui-and-the-command-browser/13498); content font size: ctrl + '+'

#### firefox
1. install: [Gnome-software with Flathub repository](https://firefox-flatpak.mojefedora.cz/)
1. extensions: NoSquint Plus(Manage site-specific zoom levels and color settings)
1. or use firefox_esr  

### References
1. [How can I run Debian stable but install some packages from testing?](http://serverfault.com/questions/22414/how-can-i-run-debian-stable-but-install-some-packages-from-testing)
2. [10分钟掌握Linux vi编辑器常见命令的使用，最简单的vi编辑器教程](http://c.biancheng.net/cpp/html/2735.html)
4. [25 apt-get commands](https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/)
5. [Chinese input need set Chinese language first](https://www.linuxdashen.com/debian-8%e5%a6%82%e4%bd%95%e5%b0%86%e8%af%ad%e8%a8%80%e4%bb%8e%e8%8b%b1%e6%96%87%e6%9b%b4%e6%94%b9%e4%b8%ba%e4%b8%ad%e6%96%87)
1. [英文环境下使用中文输入法](https://blog.csdn.net/u010187139/article/details/40859267)
1. [50 most used linux commands](https://www.thegeekstuff.com/2010/11/50-linux-commands/?utm%255fsource=feedburner)
1. [gnome: create launcher shortcut ](https://unix.stackexchange.com/questions/211005/create-launcher-shortcut)
