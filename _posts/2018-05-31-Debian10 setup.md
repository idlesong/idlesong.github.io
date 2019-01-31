---
layout: post
title:  "Debian 10(buster) and common software installation"
categories: Linux
tags: [Debian, Linux]
---
## Debian installation (on Thinkpad X1 Carbon)
### basic
- [Getting Started from official: www.debian.org](https://www.debian.org/)
- Getting Started:
 - [obtain a copy(stable): download a DVD-1.iso](https://www.debian.org/distrib/)
 - [obtain a copy(testing): download a DVD-1.iso](https://cdimage.debian.org/cdimage/buster_di_alpha2/amd64/iso-dvd/)
- [installation instructions](https://www.debian.org/releases/stable/amd64/)
 - Windows: win32diskimager
 - Linux: cp debian.iso /dev/sdX && sync

### tips
1. Debian butter is testing, but *Debian testing is stable enough*
1. Download a DVD-1.iso instead of netinst to avoid trouble.
1. [intel wifi drivers: iwlwifi](https://packages.debian.org/jessie/firmware-iwlwifi) Note: Need decompress xxx.deb to usb

### configure & tweaks
1. Gnome Tweaks: Adwaita Dark; Font size 13; Scaling factor: 1.10
1. [Flathub setup for Gnome Software](https://flatpak.org/setup/Debian/)
1. [sudo setup](https://wiki.debian.org/sudo)
1. Chinese input(中文输入法:ibus-rime, ibus-pinyin)
 - Setup Chinese Language first
```
$ sudo vi /etc/locale.gen
# undo comment zh.CN.UTF-8 UTF-8
$ locale.gen
# gnome-settings/Region & Language, select 汉语
```
 - install ibus-pinyin, ibus-rime
 - ibus-setup

### Common Software installation
#### Atom
1. install: Gnome-software with Flathub
1. Themes: Solarized light; (Settings Font size:16)
1. Custom keybindings(Edit/Keymap):
```
'atom-text-editor':
  'ctrl-left': 'editor:move-to-beginning-of-line'
  'ctrl-right': 'editor:move-to-end-of-line'
```
1. tweak font size: [change atom ui font size](https://discuss.atom.io/t/how-to-set-the-font-for-the-settings-ui-and-the-command-browser/13498); content font size: ctrl + '+'
1. Packages for javascript: linter, linter-js-standard
1. [12-favorite Atom tips](https://www.sitepoint.com/12-favorite-atom-tips-and-shortcuts-to-improve-your-workflow/)

#### Firefox
1. install: [Gnome-software with Flathub repository](https://firefox-flatpak.mojefedora.cz/)
1. extensions: NoSquint Plus(Zoom 125%)
1. or use firefox_esr

### Debian & Gnome useful tips
1. Gnome Help / Useful keyboard shortcuts:
  - Super
  - Super + Tab, Super + `
  - Super + Arrow up: Maximize
  - Super + Arrow down: Unmaximize
1. Debian software installation methods
  - install popular software from gnome-software
   - install other software from apt-install
   - install .deb with dpkg
   - install executable software, and [create gnome launcher shortcut](https://unix.stackexchange.com/questions/211005/create-launcher-shortcut)

### References
1. [Linux Command Line Cheat Sheet](https://www.cheatography.com/davechild/cheat-sheets/linux-command-line/)
1. [How can I run Debian stable but install some packages from testing?](http://serverfault.com/questions/22414/how-can-i-run-debian-stable-but-install-some-packages-from-testing)
1. [vi编辑器常见命令的使用](http://c.biancheng.net/cpp/html/2735.html)
1. [25 apt-get commands](https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/)
1. [Chinese input need set Chinese language first](https://www.linuxdashen.com/debian-8%e5%a6%82%e4%bd%95%e5%b0%86%e8%af%ad%e8%a8%80%e4%bb%8e%e8%8b%b1%e6%96%87%e6%9b%b4%e6%94%b9%e4%b8%ba%e4%b8%ad%e6%96%87)
1. [英文环境下使用中文输入法](https://blog.csdn.net/u010187139/article/details/40859267)
1. [Ubuntu Chinese inputs](https://jingyan.baidu.com/article/bad08e1ef4b2f109c85121b7.html)
1. [50 most used linux commands](https://www.thegeekstuff.com/2010/11/50-linux-commands/?utm%255fsource=feedburner)
1. [gnome: create launcher shortcut ](https://unix.stackexchange.com/questions/211005/create-launcher-shortcut)
