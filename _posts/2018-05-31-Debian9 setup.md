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
### 中文输入法 ibus-pinyin, ibus-rime
1. Setup Chinese Language first
```
$ sudo vi /etc/locale.gen
# uncomment zh.CN.UTF-8 UTF-8
$ locale.gen
# gnome-settings/Region & Language, select 汉语
```
1. install ibus-pinyin, ibus-rime
1. ibus-setup

### Node/npm, yarn, react-native, ignite setup

1. [install node/npm](https://nodejs.org/en/download/package-manager/)
```
curl -sSL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```
1. install react-native-cli && ignite(reactotron)
```
$ npm install -g react-native-cli
$ npm install -g ignite-cli
```
 - Reactotron(download, unzip, run reactotron; install dependencies)
1. create react-native project with ignite
```
$ ignite new PizzaApp
```

1. react-native run
```
$ npm start
# run avd from android studio, or use a command as below ?
$ ~/Android/sdk/tools/emulator -avd Nexus_5X_API_23 -netdelay none -netspeed full
$ react-native run-android
```

1. [react-native: android](https://facebook.github.io/react-native/docs/getting-started.html)
1. GFW issues:
 - May cause many strange iusses, such as curl.
 - mirros: [react-native.cn](https://reactnative.cn/docs/0.51/getting-started.html); [android.cn](https://developer.android.google.cn/)

### ruby, rails



### References
1. [How can I run Debian stable but install some packages from testing?](http://serverfault.com/questions/22414/how-can-i-run-debian-stable-but-install-some-packages-from-testing)
2. [10分钟掌握Linux vi编辑器常见命令的使用，最简单的vi编辑器教程](http://c.biancheng.net/cpp/html/2735.html)
3. [intel wifi drivers: iwlwifi](https://packages.debian.org/jessie/firmware-iwlwifi)
4. [25 apt-get commands](https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/)
5. [Chinese input need set Chinese language first](https://www.linuxdashen.com/debian-8%e5%a6%82%e4%bd%95%e5%b0%86%e8%af%ad%e8%a8%80%e4%bb%8e%e8%8b%b1%e6%96%87%e6%9b%b4%e6%94%b9%e4%b8%ba%e4%b8%ad%e6%96%87)
1. [英文环境下使用中文输入法](https://blog.csdn.net/u010187139/article/details/40859267)
1. [50 most used linux commands](https://www.thegeekstuff.com/2010/11/50-linux-commands/?utm%255fsource=feedburner)
1. [gnome: create launcher shortcut ](https://unix.stackexchange.com/questions/211005/create-launcher-shortcut)
