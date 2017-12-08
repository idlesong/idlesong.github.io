---
layout: post
title:  "Technical stacks"
categories: tech
tags: [git, markdown, atom, rails, ruby, react-native, javascript, ignite, linux]
---
## technical stacks
[git](./_drafts/techNotes/git.md) |
[markdown](./_drafts/techNotes/markdown.md) |
[atom](./_drafts/techNotes/atom.md) |
[rails](./drafts/techNotes/rails.md) |
[ruby](./_drafts/techNotes/ruby.md) |
[javascript](./_drafts/techNotes/javascript.md) |
[react-native-ignite](./_drafts/techNotes/ignite.md) |
[linux](./_drafts/techNotes/linux.md) |

## git
[git入门教程](http://rogerdudler.github.io/git-guide/)
### 创建新仓库
- git init

### 检出仓库
- git clone /path/to/repository
- git clone username@host:/path/to/repository
- git clone

### 添加与提交
- git status
- git add <filename> / git add -u
- git add .
- git commit -m "commit info"
- git push origin master

### 丢弃本地代码,到服务器获取最新版本,并将本地主分支指向他
- git fetch origin
- git reset --hard origin/master

## markdown
[github markdown syntax](https://guides.github.com/features/mastering-markdown/)

### [slides: remark](https://github.com/gnab/remark)
### [markdown-to-slides](https://github.com/partageit/markdown-to-slides)
```
markdown-to-slides -i markdown.md -o ./output_path/slideName.html
```
### Chrome print to pdf with 'Window Resizer Extension'

## atom
### atom shortcut
[atom shortcut](http://d2wy8f7a9ursnm.cloudfront.net/atom-editor-cheat-sheet.pdf)

## rails
[rails guides](http://guides.rubyonrails.org/)
### Rails Basic Commands
- rails new depot
- rake db:migrate
- rails g scaffold Product title:string des:text imageurl:string price:decimal
- rails g scaffold cart
- rails g scaffold line_item product_id:integer cartid:integer
- rails g scaffold order name:string address:text email:string paytype:string
- rails g controller store index
- rails g migration combine_items_in_cart
- rails g migration add_order_id_to_lineitem order_id:integer
- rails g migration add_order_id_and_other_to_lineitem order_id:inter other:string
- rails server
- rake db:seed / db:migrate / db:rollback
- rake test:units / test:functionals

### rails sqlite3
    sqlite3 -line db/development.sqlite3
    select * from orders;
    select * from lineitems;
    .quit;

### rails tips
- add colume to table(delete old migrate,delete db,g scaffold)
- rails console
``` ruby
    >rails console
    >> User.create(:name => 'dave', :password => 'secret',
  :password_confirmation => 'secret')
    >> User.count
```
- rake db:setup RAILS_ENV=production
- rails server -e production or: RAILS_ENV=production rails server
- /bin/bash --login

## ruby
[ProgrammingRuby](http://ruby-doc.com/docs/ProgrammingRuby/)

## javascript
[ES6 tutorials](http://javascript.ruanyifeng.com)
### tips

## react-native ignite
[ignite](https://github.com/infinitered/ignite)
### reactotron app

## linux
### Linux Commands
### Vi Commands
[最简单的vi编辑器教程(10分钟)](http://c.biancheng.net/cpp/html/2735.html)

### Debian
#### Debian installation(with software)
### Gnome
