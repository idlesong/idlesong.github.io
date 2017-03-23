---
layout: post
title:  "Debian 8 and common softwares installation "
categories: linux
tags: [debian, linux]
---
## Debian 8 installation
### Prepare boot media(USB stick)
1. Download [unetbootin](http://unetbootin.sourceforge.net/) in linux
2. Make the boot usb stick under linux.
3. copy the below files from /usr/lib/syslinux/bios/ to the root of USB drive, then reboot:
 - libcom32.c32 - menu.c32 - libutil.c32

### Tips during Debian 8 installation
1. disk partion: (1)disk format: xfs (2)bootable: on
1. install gnome-desktop need net mirrors (use only 1 CD)


## Common softwares installation
### 中文输入法 fcitx-googlepinyin｜rime
1. sudo apt-get install fcitx-googlepinyin
1. fcitx-config (+googlepinyin,maybe need restart to show)
1. default shortcut: ctrl+space


### gnome-software
1. /etc/apt/sourcelist: add unstable and testing sources. See [Debian apt handbook](http://debian-handbook.info/browse/wheezy/apt.html)

```
su
apt-get update
apt-cache search gnome-software
apt-get install gnome-software-common
apt-get install gnome-software
su - username
```

### Shadowsocks

### References
1. [How can I run Debian stable but install some packages from testing?](http://serverfault.com/questions/22414/how-can-i-run-debian-stable-but-install-some-packages-from-testing)
2. [10分钟掌握Linux vi编辑器常见命令的使用，最简单的vi编辑器教程](http://c.biancheng.net/cpp/html/2735.html)
