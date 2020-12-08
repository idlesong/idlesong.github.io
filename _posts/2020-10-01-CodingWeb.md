---
layout: post
title:  "Coding - Web: rails, react-native, ignite"
categories: technical_stacks, tech
tags: [tech, cheatsheet]
permalink: /coding_web/
---
## rails

#### Rails Basic Commands
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

#### rails sqlite3
    sqlite3 -line db/development.sqlite3
    select * from orders;
    select * from lineitems;
    .quit;

#### rails tips
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

## postgres with rails

### postgres 用户命令
- sudo su - postgres   //进入命令

- psql -U dbuser -d exampledb -h 127.0.0.1 -p 5432

注意以下两条命令可以在psql中创建，但删除却不可以
- dropuser -i -e dbuser
- dropdb -i -e exampledb

### psql commands(注意命令后的；\q 可在任何状态下退出)
- postgre=# CREATE USER dbuser With Password 'password';
- postgre=# Create database exampledb owner dbuser;
- postgre=# GRANT ALL PRIVILEGES ON DATABASE exampledb to dbuser;
- postgre=# \q
- postgre=# \l list all databases
- postgre=# \td
- postgre=# \du list all users


### notes
- Don't forget host: localhost. //
- create role myapp with createdb login password 'password1'
- Pipeline issue: in stylesheets references just reference application.css

### setup-ruby-on-rails-with-postgres
[how-to-setup-ruby-on-rails-with-postgres](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)

note: Don't forget host: localhost. //database.yml

### local postgres setup
- config.consider_all_requests_local = true
- rake db:setup RAILS_ENV=production
- rake assets:precompile
- rails server -e production  //or: RAILS_ENV=production rails server

## rails API (postman)
- postman
- [使用rails构建api实践](https://ruby-china.org/topics/25822)
- [Saving multiple objects in a single call in rails](http://stackoverflow.com/questions/2509320/saving-multiple-objects-in-a-single-call-in-rails)
- [Create Nested Object with Rails 4-json call](http://stackoverflow.com/questions/17394098/create-nested-object-with-rails-4-json-call)

## javascript
#### ES6 tutorials
[ES6 tutorials](http://javascript.ruanyifeng.com)

## ignite [official](https://github.com/infinitered/ignite)
#### cheatsheet
#### Notes
reactotron-cli

```
npm start tron
```
