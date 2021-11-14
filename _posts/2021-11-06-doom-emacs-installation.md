---
layout: post
title:  "Doom emacs installation"
categories: tech
tags: [doom, emacs, linux]
---

## Doom emacs installation

[doom-emacs-official-web](https://github.com/hlissner/doom-emacs)

### install doom emacs on Linux
#### preparation: install emacs
1. debian deb way
   - install debian default emacs `sudo apt install emacs`

1. flatpak way
[emacs-flatpak-version](https://github.com/flathub/org.gnu.emacs)

add to your shell config (.zshrc or .bashrc)

```
export EMACS="/usr/bin/flatpak run org.gnu.emacs"
```

#### install doom and fetch own .doom.d
1. install doom
```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```
note: setup github mirror before run `.emacs.d/doom install`

1. fetch own .doom.d
```
mv ~/.doom.d ~/.doom.d.bk
git clone git@github.com:idlesong/.doom.d.git
~/.emacs.d/bin/doom sync
```

### install doom emacs on Windows
[install_doom_emacs_on_windows](https://earvingad.github.io/posts/doom_emacs_win
1. install mingw64 or msys2
1. install doom emacs
1. install icons `M-x all-the-icons-install-fonts`

## tips & reference

1. use proxy; or github taobao mirror to run .emacs.d/doom install
- [Emacs 笔记 (一) —— 安装与配置 Doom Emacs](https://shigaro.horg/2020/07/01/emacs-1/)
- [linux命令行代理神器-proxychains](https://zhuanlan.zhihu.com/p/166375631)
- [fix ERROR: ld.so: object 'libproxychains.so.3' from LD_PRELOAD cannot be preloaded](https://blog.csdn.net/think_ycx/article/details/108199296)
