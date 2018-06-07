---
layout: post
title:  "Debian 9 and common software setup "
categories: Linux
tags: [Debian, Linux]
---
## Debian 9 installation
### Prepare
- [Official site Getting Started : www.debian.org](https://www.debian.org/)
- Getting Started:[obtain a copy: download a iso](https://www.debian.org/distrib/)
- [installation instructions](https://www.debian.org/releases/stable/amd64/)
 - Windows: win32diskimager
 - Linux: cp debian.iso /dev/sdX && sync

### installation tips
1. Select Chinese Language to get mirros near China.
1. Only choose Gnome without debian desktop to get a clean installation

### upgrade to debian testing
1. *Debian testing is stable enough*
1. [How to upgrade to Debian (next-stable) Testing](https://wiki.debian.org/DebianTesting)

### debian setup
1. dark theme: Gnome tweak tool
1. [Flathub setup for Gnome Software](https://flatpak.org/setup/Debian/)
1. [sudo setup](https://wiki.debian.org/sudo)

## Gnome Tweaks
1. Gnome: Adwaita Dark; Font size 13
1. Atom:font size too small
  - [setting ui](https://discuss.atom.io/t/how-to-set-the-font-for-the-settings-ui-and-the-command-browser/13498)
  - content font size: ctrl + '+'

## Common softwares installation
### 中文输入法 fcitx-googlepinyin｜rime
1. sudo apt-get install fcitx-googlepinyin
1. fcitx-config (+googlepinyin,maybe need restart to show)
1. default shortcut: ctrl+space

### Node, react-native, yarn, ignite
1. [node & npm](https://nodejs.org/en/download/package-manager/)

```
curl -sSL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```
1. react-native: ```npm install -g react-native-cli```

### ruby, rails



### References
1. [How can I run Debian stable but install some packages from testing?](http://serverfault.com/questions/22414/how-can-i-run-debian-stable-but-install-some-packages-from-testing)
2. [10分钟掌握Linux vi编辑器常见命令的使用，最简单的vi编辑器教程](http://c.biancheng.net/cpp/html/2735.html)
3. [intel wifi drivers: iwlwifi](https://packages.debian.org/jessie/firmware-iwlwifi)
4. [25 apt-get commands](https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/)
