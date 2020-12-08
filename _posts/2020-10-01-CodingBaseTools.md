---
layout: post
title:  "Coding base tools: git, markdown, atom, linux cmd"
categories: technical_stacks, tech
tags: [tech, cheatsheet, git, markdown, atom, linux]
permalink: /coding_base_tools/
---

## coding base tools
### git
#### 创建新仓库
- git init

#### 检出仓库
- git clone /path/to/repository
- git clone username@host:/path/to/repository
- git clone

#### 添加与提交
- git status
- git add <filename> / git add -u
- git add .
- git commit -m "commit info"
- git push origin master

#### 丢弃本地代码,到服务器获取最新版本,并将本地主分支指向他
- git fetch origin
- git reset --hard origin/master

### Markdown
```
markdown-to-slides -i markdown.md -o ./output_path/slideName.html
```
#### [github markdown](https://guides.github.com/features/mastering-markdown/)
#### [slides: remark](https://github.com/gnab/remark)
#### [markdown-to-slides](https://github.com/partageit/markdown-to-slides)

### Atom editor
[Atom editor shortcut](http://d2wy8f7a9ursnm.cloudfront.net/atom-editor-cheat-sheet.pdf)

### Linux
[Linux Commands Cheetsheet](https://images.linoxide.com/linux-cheat-sheet.pdf)

1. PATH
```
   - echo $PATH
   - nano ~/.bashrc
   - export PATH=$PATH:/home/dave/work
```

##### python3
1. pip3
sudo apt-get install python3-pip

pip search django
pip3 install django
pip3 install --force-reinstall --user django==2.2.1

[pip3 install specific version package](https://www.poftut.com/how-to-install-specific-version-of-python-package-with-pip/)
