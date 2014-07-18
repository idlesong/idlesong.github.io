# postgres in rails

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


# notes
 Don't forget host: localhost. //
 create role myapp with createdb login password 'password1'

### setup-ruby-on-rails-with-postgres
[how-to-setup-ruby-on-rails-with-postgres](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)
note: Don't forget host: localhost. //database.yml


### local postgres setup
- config.consider_all_requests_local = true
- rake db:setup RAILS_ENV=production
- rake assets:precompile
- rails server -e production  //or: RAILS_ENV=production rails server

### pipeline issue
And in stylesheets references just reference application.css

<%= stylesheet_link_tag    "application", :media => "all" %>
Since assets pipeline will precompile all of your stylesheets in application.css.
This also happens in development so using any other references is wrong when using assets pipeline.
