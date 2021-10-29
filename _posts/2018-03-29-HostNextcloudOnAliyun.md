



### Host Nextcloud on Aliyun
- [install lamp(Linux/Apache/Mysql/PHP) server on debian 9](https://linuxconfig.org/how-to-install-a-lamp-server-on-debian-9-stretch-linux)
- [install nextcloud server on debian 9](https://linuxconfig.org/how-to-install-nextcloud-on-debian-9-stretch-linux)
- [open http port on Aliyun](https://help.aliyun.com/document_detail/25471.html?spm=a2c4g.11186623.2.7.1V50WI)

Linux commands
```
    monitor linux:
    ssh user@hostaddress
    top,
    pisof,
    kill
    free -m
    vi:
    mode: insert(i); command(ESC :)
    save: q, q!, wq, ZZ
```
Apache command
```
    start/stop/restart apache

    /etc/init.d/apache2 restart
```

### Host gitlab on Aliyun
#### install gitlab
[install gitlab on unbuntu](https://about.gitlab.com/install/#ubuntu)

#### mantain gitlab
- vi /etc/gitlab/gitlab.rb
- gitlab-ctl reconfigure
- gitlab-ctl restart #stop, start
