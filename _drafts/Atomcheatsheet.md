## cheatsheet gallery
参考github的cheatsheet， 通过css排版固定文件，然后通过快速导航

## git

#### 创建新仓库
- git init

#### 检出仓库
- git clone /path/to/repository
- git clone username@host:/path/to/repository
- git clone

#### 添加与提交
- git status
- git add <filename>
- git add .
- git commit -m "commit info"
- git push origin master

#### 丢弃本地代码,到服务器获取最新版本,并将本地主分支指向他
- git fetch origin
- git reset –hard origin/master

## rails

##### Rails Basic Commands
- rails new depot
- rake db:migrate
- rails g scaffold Product title:string des:text imageurl:string price:decimal
- rails g scaffold cart
- rails g scaffold line_item product_id:integer cartid:interger
- rails g scaffold order name:string address:text email:string paytype:string
- rails g controller store index
- rails g migration combine_items_in_cart
- rails g migration add_order_id_to_lineitem order_id:integer
- rails g migration add_order_id_and_other_to_lineitem order_id:inter other:string
- rails server
- rake db:seed / db:migrate / db:rollback
- rake test:units / test:functionals

#### rails tips
- add colume to table(delete old migrate,delete db,g scaffold)
- rails console

    >rails console
    >> User.create(:name => 'dave', :password => 'secret',
  :password_confirmation => 'secret')
    >> User.count

- /bin/bash --login

#### rails sqlite3
    sqlite3 -line db/development.sqlite3
    select * from orders;
    select * from lineitems;
    .quit;

## ruby

## linux

## Markdown
