---
layout: post
title:  "Doom emacs notes"
categories: tech_life
tags: [doom, emacs, tech_life, linux]
---

# Doom emacs notes

### Doom emacs shortcuts
[Emacs shortcut cheatsheet](https://courses.cs.washington.edu/courses/cse351/16wi/sections/1/Cheatsheet-emacs.pdf)

```
Moving arround:             Back       Forth
  move by char              C-b        C-f
  move by word              M-b        M-f              
  move by line              C-p        C-n
  move by sentence          M-a        M-e
  goto end of line          C-a        C-e
  top or bottom of buffer   M-<        M->
  center screen here        C-l 
                                        
Deleting and editing        Back       Forth  
  delete word               M-del      C-d
  delete rest of line       M-0 C-k    C-k
  delete whole line         C-S-Backspace
  swith with above line     C-x C-t
  cua-mode                  C-c C-v C-x C-z
  cua rectangular start     C-RET and arrow keys

Getting Help:
  help on key structure     C-h k
  help on bindings          C-h b b
  doom emacs help           C-h d
  
Files:
  find file C-x C-f
  save file C-x C-s

Searching
  forword                   C-s
  backword                  C-r
  forword expression        C-M-s
  exit searching            Enter
  abort searching           C-g
  
Abort and Exiting Emacs:
  abort actions             C-g
  exit emacs                C-x C-c 

Markdown or org-mode
  previous outline          C-c C-p 
  next outline              C-c C-n 
  out line up               C-c C-u 
  outline back same level   C-c C-b
  foreword block            M-}
  backword block            M-{
  forward paragraph         C-<down>   M-n 
  backward paragraph        C-<up>     M-p
  top or bottom of buffer   C-x [      C-x ]

Doom Emacs key bindings
  reload last session       C-c w L 
  open org-agenda           C-c n a 
  recent opened files       C-c f r 
  open project              C-c p p 
  jump to bookmark          C-c s m 
  open private config       C-c f p 
                                                
Projectile 
  find file with completion C-c p f 
  open dired in root        C-c f D
  lockup functions document C-c c k 
  lookup defination         C-c c d 
```

Windowns

```
close window                C-x 0
close other window          C-x 1
split window Horirental     C-x 2
split window Vertical       C-x 3
shrink-window-horizontally  C-x { 
shrink-window-horizontally  C-u 25 C-x {
```

Files & buffers
```
open current opened files   C-c f r
Kill buffer                 C-x k
```

[Dired shortcuts](https://zhuanlan.zhihu.com/p/156907392)

```
dired open                  C-c f d  
jump dired from this buffer C-c o- #C-x C-j
open dired to project root  C-c p D

goto next line                  SPC
up to parent dictionary      ^
goto previous file line      <
goto next file line          >
goto describled file line    j
                              
open item in other window    o
insert this subdictionary    i
```

CUA rectangular regions editing

```
Enter or exit rectangular  C-RET
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

(setq kill-whole-line t)

(setq confirm-kill-emacs nil)

(setq ispell-program-name "aspell")

(cua-mode t)

(map! "M-p" #'backward-paragraph
      "M-n" #'forward-paragraph
      "C-M-p" #'cua-scroll-down
      "C-M-n" #'cua-scroll-up)

(map! :map markdown-mode-map
        "M-n" #'markdown-forward-paragraph
        "M-p" #'markdown-backward-paragraph
        "C-M-p" #'cua-scroll-down)
        "C-M-n" #'cua-scroll-up

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
