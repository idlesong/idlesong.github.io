#!/bin/bash
# ******************************************
# Program: LAMP Stack Installation Script
# Developer: Pratik Patil
# Date: 10-04-2015
# Last Updated: 11-01-2016
# ******************************************

if [ "`lsb_release -is`" == "Ubuntu" ] || [ "`lsb_release -is`" == "Debian" ]
then
  # install for lamp & nextcloud
  # create DATABASE
  sudo apt install -y mariadb-client mariadb-server
  mysql -u root -p
  CREATE DATABASE nextcloud;
  CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'yourpassword';
  GRANT ALL ON nextcloud.* TO 'nextclouduser'@'localhost';
  FLUSH PRIVILEGES;
  quit

  # php
  sudo apt install php7.0 php7.0-mysql
  # php more libaries
  sudo apt install php7.0-xml php7.0-cgi php7.0-cli php7.0-mysql php7.0-mbstring php7.0-gd php7.0-curl php7.0-zip

  #apache
  sudo apt install apache2 libapache2-mod-php7.0
  systemctl restart apache2

  # install nextcloud
  cd ~/Downloads
  wget https://download.nextcloud.com/server/releases/nextcloud-16.0.4.zip
  unzip nextcloud-16.0.4.zip
  cp -r /home/user/Downloads/nextcloud /var/www/html/nextcloud

  chown -R www-data:www-data /var/www/html/nextcloud

else
    echo "Unsupported Operating System";
fi
