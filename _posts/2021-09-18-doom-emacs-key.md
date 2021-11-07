---
layout: post
title: "Doom emacs key bindings and configuration"
categories: tech_life
tags: [doom, emacs, tech_life, linux]
---

### Doom emacs shortcuts
[Emacs shortcut cheatsheet](https://courses.cs.washington.edu/courses/cse351/16wi/sections/1/Cheatsheet-emacs.pdf)

Emacs basics

```
Moving arround:             Back       Forth
  move by char              C-b        C-f
  move by word              M-b        M-f              
  move by line              C-p        C-n
  move by sentence          M-a        M-e
  goto end of line          C-a        C-e
  top or bottom of buffer   M-<        M->
  center screen here        C-l
  move by half screen       M-r
                                        
Deleting and editing        Back       Forth  
  delete word               M-del      C-d
  delete rest of line       M-0 C-k    C-k
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
```

Windowns

```
close window                C-x 0
close other window          C-x 1
split window Horirental     C-x 2
split window Vertical       C-x 3
narrower window             C-x { 
wider window 25 times       C-u 25 C-x {
```

Files & buffers & projects
```
open project                C-c p p 
open current opened files   C-c f r
find file                   C-c f f
Kill buffer                 C-x k
```

Dired
```
dired open                  C-c f d  
jump dired from this buffer C-c o- #C-x C-j
open dired to project root  C-c p D

goto next line              SPC
up to parent dictionary     ^
goto previous file line     <
goto next file line         >
goto describled file line   j
                             
open item in other window   o
toggle brief & full view    (
create dir in Dired         +
Copy files to destination   C
Rename or move file/dir     R
Delete file/dir             D

insert this subdictionary   i
```

[Dired shortcuts](https://zhuanlan.zhihu.com/p/156907392)


avy 
```
avy goto char in line       M-g f
avy goto char               M-g c
avy goto line(compatible)   M-g g
avy goto word-1             M-g w
avy goto word-0             M-g e
```

Markdown or org-mode
```
  previous outline          C-c C-p 
  next outline              C-c C-n 
  out line up               C-c C-u 
  outline back same level   C-c C-b
  foreword block            M-}
  backword block            M-{
  forward paragraph         C-<down>   M-n 
  backward paragraph        C-<up>     M-p
  top or bottom of buffer   C-x [      C-x ]
```

Doom Emacs key bindings
```
  reload last session       C-c w L 
  open org-agenda           C-c n a 
  recent opened files       C-c f r 
  open project              C-c p p 
  jump to bookmark          C-c s m 
  open private config       C-c f p
  
```

Projectile 
```
  find file with completion C-c p f 
  open dired in root        C-c f D
  lockup functions document C-c c k 
  lookup defination         C-c c d 
```


Others

```
Enter /exit CUA rectangular  C-RET
Eshell: toggle popup window  C-c o e
Youdao: youdao input         C-c o y
Quick-Calc                   C-x * q
```

## Common packages
1. check, spell check
   - flycheck rust?
   - flyspell
1. eshell
1. youdao

## configuration
1. .doom.d目录下初始有三个配置文件
   - init.el
   - packages.el
   - config.el
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
      "C-M-n" #'cua-scroll-up
      "C-c o y" #'youdao-dictionary-search-from-input
      "M-g c" #'avy-goto-char
      "M-g s" #'avy-goto-char-2
      "M-g f" #'avy-goto-char-in-line
      "M-g g" #'avy-goto-line
      "M-g w" #'avy-goto-word-1
      "M-g e" #'avy-goto-word-0
      )

(map! :map markdown-mode-map
        "M-n" #'markdown-forward-paragraph
        "M-p" #'markdown-backward-paragraph
        "C-M-p" #'cua-scroll-down
        "C-M-n" #'cua-scroll-up)

```

