---
layout: post
title:  "My self-hosting - Docker Server on Pi "
categories: tech_life
tags: [docker, tech_life, raspberrypi]
---

## My Docker Server on Pi(Raspberry Pi4)

There are lots of interesting self-host solutions: Yunohost, Sandbox, Freedom Box, HomeLabOS and more.
After tested some solution, it seems the pure Docker solution on Raspberry is my best choise:
- Raspberry Pi4: low cost popular open source hardware, fit family self-hosting.
- Docker compose: 
  - Simple & clean
    - Pure Raspberry Pi OS;
    - Simple setup: script and git auto setup and sync ssh, python-3, docker, docker-compose. 
    - 1 Docker 1 App. Up/Down completely, no harm.
    - Many mature docker images & Apps with Web UI.
  - Customize
    - docker-compose parameters can config easily. 
  - Security

![raspberrypi NAS](/images/raspberrypi_NAS.jpg)


### Raspberry pi OS install & config
1. install raspberry OS lite 
1. apt update && upgrade
1. enable ssh

``` shell
sudo systemctl start ssh

sudo systemctl status ssh
sudo systemctl enable ssh
```

  - or enable ssh headless way
    - create a ssh file in root folder
1. password

``` shell
sudo passwd <USERNAME> # username root; current user leave blank
```


### Install Docker & Docker-compose

``` shell
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
docker version
docker run hello-world

sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip

sudo pip3 install docker-compose
```

[patch for libseccomp](https://docs.linuxserver.io/faq#libseccomp)
```
    wget http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.4.4-1~bpo10+1_armhf.deb
    sudo dpkg -i libseccomp2_2.4.4-1~bpo10+1_armhf.deb
```


[install docker](https://pimylifeup.com/raspberry-pi-docker/)
[install issues debug](https://stackoverflow.com/questions/39100641/docker-service-start-failed)
[docker install overlay issues](https://raspberrypi.stackexchange.com/questions/114665/failed-to-mount-overlay-no-such-device-when-start-docker-in-raspberry-pi-4)

docker commands
```
nano docker-compose.yml
docker-compose up -d
docker-compose down
docker-compose logs
```
-v /etc/localtime:/etc/localtime:ro

### mount external USB drive
- note: mount usb drive
```
sudo fdisk -l
sudo mount /dev/sda1 /mnt
```


## debug
1. check port & stop process
```
lsof -i:8000 #-i port number
netstat -tunlp | grep 8080 # port number
kill -9 PID #PID: process number
```

## advanced notes
1. rsync to local (avoid to setup git environment)
```
## local to remote
$ rsync -avz /local_path/docker/ username@docker_server:/home/username/docker/
## remote to local
$ rsync -avz username@docker_server:/home/username/docker/ /local_path/docker
```
1. git init, git push, git clone to github
   - ignore config folders ``` *config*/```

### Host App: cockpit
``` 
sudo apt install cockpit cockpit-docker
sudo apt install firewalld #iptables 1.8.2 has bugs
```

- [install cockpit in debian](https://www.iplayio.cn/post/63930)
- [install cockpit in raspberry](https://zhuanlan.zhihu.com/p/380802017)

- cockpit Boot start up
``` 
sudo systemctl enable cockpit.socket
sudo systemctl status cockpit.socket
```

## Popular Docker Apps

### heimdall

- [heimdall docker](https://docs.linuxserver.io/images/docker-heimdall)
- note: url need add http://
   
### samba 
- [samba docker](https://github.com/dperson/samba)
- note: support SMB1
```
  docker exec -i -t samba /bin/bash
  vi /etc/samba/smb.conf
  server min protocol = LANMAN1
```
-I  Add an include option at the end of the smb.conf

### jellyfin
- [jellyfin docker](https://github.com/linuxserver/docker-jellyfin)

### emby 
- [linuxserver docker](https://docs.linuxserver.io/images/docker-emby)

### transmission
- [transmission docker](https://docs.linuxserver.io/images/docker-transmission)


### syncthing
- [syncthing docker](https://docs.linuxserver.io/images/docker-syncthing)

### nextcloud
   - official docker?


## Testing Apps
### piwigo
   [install guide](https://xmanyou.com/install-piwigo-with-docker-in-minutes/)


### kodi-headless
   - web UI

### calibre-web

- [calibre-web docker](https://github.com/linuxserver/docker-calibre-web/)
- copy [metadata.db](https://github.com/kovidgoyal/calibre/blob/master/src/calibre/db/tests/metadata.db) to calibre-library
- login: defalut: admin, admin123
- chmod 777 metadata.db
   
1. portainer 
   - deploy: localhsot: works!
   - docker managerment

## tips & reference
https://jackstromberg.com/2021/07/how-to-add-buster-backports-to-a-raspberry-pi/
