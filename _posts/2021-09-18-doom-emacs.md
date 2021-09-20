---
layout: post
title:  "Doom emacs notes"
categories: tech_life
tags: [yunohost, tech_life, raspberrypi]
---

# Doom emacs notes

## emacs tutorial
C-x c f
C-x C-s
C-s

## doom tutorial
C-c w L : open recent closed project
C-c f r : open recent closed session
C-c o p : neotree: open neotree
C-h 
C-c p f : projectile: jump to a file with completion

## terminal eshell
M-x eshell with highlight?

## check, spell check
flycheck rust?
flyspell

## doom
1. Doom Emacs for flatpak's Emacs
```
# add to your shell config (.zshrc or .bashrc)
export EMACS="/usr/bin/flatpak run org.gnu.emacs"
```


1. use proxy; or github taobao mirror to run .emacs.d/doom install

## configuration
1. .doom.d目录下初始有三个配置文件
    init.el
    packages.el
    config.el

## doom configure .doom.d/init.el
   - neotree
   - quit
   - vterm

`M-x all-the-icons-install-fonts`

## doom emacs usage
   - neotree C-c o p


## reference
[Emacs 笔记 (一) —— 安装与配置 Doom Emacs](https://shigaro.horg/2020/07/01/emacs-1/)
[linux命令行代理神器-proxychains](https://zhuanlan.zhihu.com/p/166375631)
[fix ERROR: ld.so: object 'libproxychains.so.3' from LD_PRELOAD cannot be preloaded](https://blog.csdn.net/think_ycx/article/details/108199296)
