---
layout: post
title:  "Doom emacs notes"
categories: tech_life
tags: [doom, emacs, tech_life, linux]
---

# Doom emacs notes

## common key bindings

### emacs key bindings
1. editing

```
C-f, C-b, C-p, C-n
M-f, M-b
C-a, C-e, M-a, M-e
C-L     ## sroll the widown middle and top
M-<, M->## jump to begining, end of file

C-k, C-S-Backspace
C-x C-t ## swith with above line
```

1. general

```
C-h ->k, ->b->b, ->d
cua-mode C-c C-v C-x
```

1. files

```
C-x c f ## find file
C-x C-s ## save file
C-x C-c ## exit emacs
C-s     ## search files
```

1. Markdown or org-mode

```
C-c C-p ## previous
C-c C-n ## next
C-c C-u ## up
C-c C-b ## back
C-arrow down, arrow up  ## next, previous paragraph
```

### doom key bindings

```
C-c w L ## reload last session
C-c n a ## open org-agenda
C-c f r ## recent opened files
C-c p p ## open project 
C-c s m ## jump to bookmark
C-c f p ## open private configuration

C-c p f ## projectile: jump to a file with completion
C-c c k ## view functions/macro's document
C-c c d ## jump to defination
```

## Common packages
1. terminal eshell
   - M-x eshell with highlight?

1. check, spell check
   - flycheck rust?
   - flyspell

## configuration
1. .doom.d目录下初始有三个配置文件
    init.el
    packages.el
    config.el
1. use cua-mode
```
# note add below to config.el
(cua-mode t)
```

### doom configure .doom.d/init.el
   - neotree
   - quit
   - vterm

`M-x all-the-icons-install-fonts`

## tips & reference
1. Doom Emacs for flatpak's Emacs
```
# add to your shell config (.zshrc or .bashrc)
export EMACS="/usr/bin/flatpak run org.gnu.emacs"
```

1. use proxy; or github taobao mirror to run .emacs.d/doom install

[Emacs 笔记 (一) —— 安装与配置 Doom Emacs](https://shigaro.horg/2020/07/01/emacs-1/)
[linux命令行代理神器-proxychains](https://zhuanlan.zhihu.com/p/166375631)
[fix ERROR: ld.so: object 'libproxychains.so.3' from LD_PRELOAD cannot be preloaded](https://blog.csdn.net/think_ycx/article/details/108199296)
