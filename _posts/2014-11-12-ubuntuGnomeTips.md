---
layout: post
title:  "Ubuntu Gnome常用软件"
categories: linux
tags: [ubuntu, gnome]
---
## UbuntuGnome 常用软件

## 中文输入法（fcitx-googlepinyin）
1. sudo apt-get install fcitx-googlepinyin
1. fcitx-config (+googlepinyin,maybe need restart to show)
1. default shortcut: ctrl+space

## 翻墙软件

## Atom
1. sudo add-apt-repository ppa:webupd8team/atom  
2. sudo apt-get update
3. sudo apt-get install atom


## ruby,rails环境的安装
1. $ curl -L https://get.rvm.io | bash -s stable
1. $ source ~/.rvm/scripts/rvm
1. $ rvm install 2.0.0
1. $ rvm 2.0.0 --default
1. $ gem source -r https://rubygems.org/
1. $ gem source -a https://ruby.taobao.org
1. $ gem install rails
1. $ rails -v

## twister
### compile & install
1. sudo apt-get update
1. sudo apt-get install git autoconf libtool build-essential libboost-all-dev libssl-dev libdb++-dev libminiupnpc-dev
1. git clone https://github.com/miguelfreitas/twister-core.git
1. cd twister-core
1. ./bootstrap.sh
1. ./configure
1. make
1. mkdir ~/.twister
1. git clone https://github.com/miguelfreitas/twister-html.git ~/.twister/html


### run
1. ./twisterd -rpcuser=user -rpcpassword=pwd -rpcallowip=127.0.0.1
2. http://user:pwd@localhost:28332


## Create App Launcher(desktop shortcut)

In 14.04 To create a shortcut on the desktop to an existing application: the
simpelest solution is to copy the application's desktop file to the Desktop:

- go to /usr/share/applications,right click on the application's desktop file >copy,
- go to your desktop, right click >paste.
- Dont't forget to make it executable, its correct icon will appear after you made it executable.
