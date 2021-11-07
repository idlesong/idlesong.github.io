---
layout: post
title:  "Doom emacs installation"
categories: tech
tags: [doom, emacs, linux]
---

## Domm emacs installation


### install doom emacs on Windows
- install mingw64 or msys2
- [install_doom_emacs_on_windows](https://earvingad.github.io/posts/doom_emacs_windows/)



`M-x all-the-icons-install-fonts`

## tips & reference

1. use proxy; or github taobao mirror to run .emacs.d/doom install
- [Emacs 笔记 (一) —— 安装与配置 Doom Emacs](https://shigaro.horg/2020/07/01/emacs-1/)
- [linux命令行代理神器-proxychains](https://zhuanlan.zhihu.com/p/166375631)
- [fix ERROR: ld.so: object 'libproxychains.so.3' from LD_PRELOAD cannot be preloaded](https://blog.csdn.net/think_ycx/article/details/108199296)

### install doom emacs on Linux
1. Doom Emacs with flatpak's Emacs

```
# add to your shell config (.zshrc or .bashrc)
export EMACS="/usr/bin/flatpak run org.gnu.emacs"
```
