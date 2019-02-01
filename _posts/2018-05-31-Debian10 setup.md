---
layout: post
title:  "Debian 10(buster) and common software installation"
categories: Linux
tags: [Debian, Linux]
---
## Debian Buster installation
### basic installation(on Thinkpad X1 Carbon)
- [Getting Started from official: www.debian.org](https://www.debian.org/)
- Obtain a copy(buster alpha5 DVD-1.iso): [Free software](https://cdimage.debian.org/cdimage/buster_di_alpha2/amd64/iso-dvd/);or [ include firmware](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/buster_di_alpha5+nonfree/amd64/iso-dvd/)
- [installation instructions](https://www.debian.org/releases/stable/amd64/)
- Prepare USB stick
   - Windows: win32diskimager
   - Linux: `cp debian.iso /dev/sdX && sync`

### configure & tweaks
1. Gnome Tweaks: Adwaita Dark; Font size 11(default); Scaling factor: 1.25
1. [Flathub setup for Gnome Software](https://flatpak.org/setup/Debian/)
1. [sudo setup](https://wiki.debian.org/sudo)

### tips
1. Debian butter is testing, but *Debian testing is stable enough*
1. Download a DVD-1.iso instead of netinst to avoid network trouble.
1. [intel wifi drivers: iwlwifi](https://packages.debian.org/jessie/firmware-iwlwifi) Note:extract to usb stick `dpkg -X ./xxx.deb folder`

### Common Software installation
#### Rime(Chinese input)
 1. Setup Chinese Language first
```
$ sudo vi /etc/locale.gen
# undo comment zh.CN.UTF-8 UTF-8
$ sudo /usr/sbin/locale-gen
# gnome-settings/Region & Language, select 汉语
```
 1. install ibus-rime `sudo apt install ibus-rime`
 1. ibus-setup
 1. gnome-settings/Region & Language, select English
 1. tips: `ctrl+``, Atom has ibus issue


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
1. extensions: NoSquint Plus(Zoom 125%, text 100%)
1. Customize firefox: uncheck title bar
1. or use flatpak version: [Gnome-software with Flathub repository](https://firefox-flatpak.mojefedora.cz/)

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
1. [25 apt-get commands](https://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/)
1. [Chinese input need set Chinese language first](https://www.linuxdashen.com/debian-8%e5%a6%82%e4%bd%95%e5%b0%86%e8%af%ad%e8%a8%80%e4%bb%8e%e8%8b%b1%e6%96%87%e6%9b%b4%e6%94%b9%e4%b8%ba%e4%b8%ad%e6%96%87)
1. [gnome: create launcher shortcut ](https://unix.stackexchange.com/questions/211005/create-launcher-shortcut)
