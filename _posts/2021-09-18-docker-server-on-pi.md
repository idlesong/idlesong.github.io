---
layout: post
title:  "Personal Docker Server on Raspberry Pi4"
categories: tech_life
tags: [docker, tech_life, raspberrypi]
---

# My Docker Server on Raspberry Pi4
## Raspberry pi OS install & config
1. install raspberry OS lite 
1. apt update && upgrade

1. enable ssh

``` shell
sudo systemctl start ssh

sudo systemctl status ssh
sudo systemctl enable ssh
```

1. enable ssh on Windows headless way
create a ssh file in root folder

1. password

``` shell
sudo passwd <USERNAME> # username root; current user leave blank
```


## Install Docker & Docker-compose

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

## mount external USB drive
- note: mount usb drive
```
sudo fdisk -l
sudo mount /dev/sda1 /mnt
```


## Host App: cockpit
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


# Popular Docker Apps

## heimdall

- [heimdall docker](https://docs.linuxserver.io/images/docker-heimdall)
- note: url need add http://

```
---
version: "2.1"
services:
  heimdall:
    image: lscr.io/linuxserver/heimdall
    container_name: heimdall
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
    volumes:
      - ./config:/config
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped
```
   
### samba 
- [samba docker](https://github.com/dperson/samba)

```
version: '3.4'

services:
  samba:
    image: dperson/samba
    environment:
      - TZ=/etc/timezone:/etc/timezone:ro
    networks:
      - default
    ports:
      - "137:137/udp"
      - "138:138/udp"
      - "139:139/tcp"
      - "445:445/tcp"
    read_only: true
    tmpfs:
      - /tmp
    restart: unless-stopped
    stdin_open: true
    tty: true
    volumes:
      - ./share:/share
    command: '-s "SambaShare;/share;yes;no;no;bob" -u "bob;bobspasswd" -p'

networks:
  default:
```

- note: support SMB1
```
  docker exec -i -t samba /bin/bash
  vi /etc/samba/smb.conf
  server min protocol = LANMAN1
```
-I  Add an include option at the end of the smb.conf


### emby 
- [linuxserver docker](https://docs.linuxserver.io/images/docker-emby)

```
version: "2.1"
services:
  emby:
    image: ghcr.io/linuxserver/emby
    container_name: emby
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
    volumes:
      - ./library:/config
      - ./tvshows:/data/tvshows
      - ./movies:/data/movies
      - /opt/vc/lib:/opt/vc/lib #optional
    ports:
      - 8096:8096
      - 8920:8920 #optional
    devices:
    restart: unless-stopped
```

### jellyfin
- [jellyfin docker](https://github.com/linuxserver/docker-jellyfin)

```
---
version: "2.1"
services:
  jellyfin:
    image: ghcr.io/linuxserver/jellyfin
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
    volumes:
      - ./config:/config
      - ./tvshows:/data/tvshows
      - ./movies:/data/movies
      - /opt/vc/lib:/opt/vc/lib #optional
    ports:
      - 8096:8096
      - 8920:8920 #optional
      - 7359:7359/udp #optional
      - 1900:1900/udp #optional
    restart: unless-stopped
```




### transmission
- [transmission docker](https://docs.linuxserver.io/images/docker-transmission)

```
---
version: "2.1"
services:
  transmission:
    image: ghcr.io/linuxserver/transmission
    container_name: transmission
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
      - TRANSMISSION_WEB_HOME=/combustion-release/ #optional
    volumes:
      - ./config:/config
      - ./downloads:/downloads
      - ./watch:/watch
    ports:
      - 9091:9091
      - 51413:51413
      - 51413:51413/udp
    restart: unless-stopped
```

### syncthing
- [syncthing docker](https://docs.linuxserver.io/images/docker-syncthing)

```
---
version: "2.1"
services:
  syncthing:
    image: lscr.io/linuxserver/syncthing
    container_name: syncthing
    hostname: syncthing #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
    volumes:
      - ./config:/config
      - ./data1:/data1
    ports:
      - 8384:8384
      - 22000:22000/tcp
      - 22000:22000/udp
      - 21027:21027/udp
    restart: unless-stopped
```

### nextcloud
   - official docker?

```
version: '3'

services:
  nextcloud:
    image: lscr.io/linuxserver/nextcloud
    volumes:
      - ./mynextcloud/:/var/www/html
      - ./mynextcloud/apps:/var/www/html/custom_apps
      - ./mynextcloud/config:/var/www/html/config
      - ./mynextcloud/data:/var/www/html/data
    ports:
      - 8090:80
    depends_on:
      - mariadb
    restart: always      

  mariadb:
    image: linuxserver/mariadb
    restart: always
    volumes:
      - ./mynextcloud/mariadb:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=nextcloud
      - MYSQL_PASSWORD=nextcloud
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
    ports:
      - "3306:3306"
    restart: always

---
version: "2.1"
services:
  nextcloud:
    image: lscr.io/linuxserver/nextcloud
    container_name: nextcloud
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
    volumes:
      - ./config:/config
      - ./data:/data
    ports:
      - 443:443
    restart: unless-stopped

```

## Testing Apps
### nextcloud all in one
```
version: "3.8"

volumes:
  nextcloud_aio_mastercontainer:
    name: nextcloud_aio_mastercontainer # This line is not allowed to be changed

services:
  nextcloud:
    image: nextcloud/all-in-one:latest # Must be changed to 'nextcloud/all-in-one:latest-arm64' when used with an arm64 CPU
    restart: always
    container_name: nextcloud-aio-mastercontainer # This line is not allowed to be changed
    volumes:
      - nextcloud_aio_mastercontainer:/mnt/docker-aio-config # This line is not allowed to be changed
      - /var/run/docker.sock:/var/run/docker.sock:ro # May be changed on macOS, Windows or docker rootless. See the applicable documentation
    ports:
      - 80:80 # Can be removed when running behind a reverse proxy. See https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md
      - 8080:8080
      - 8443:8443 # Can be removed when running behind a reverse proxy. See https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md
    # environment: # Is needed when using any of the options below
      # - APACHE_PORT=11000 # Is needed when running behind a reverse proxy. See https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md
      # - APACHE_IP_BINDING=127.0.0.1 # Should be set when running behind a reverse proxy that is running on the same host. See https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md
      # - TALK_PORT=3478 # This allows to adjust the port that the talk container is using.
      # - NEXTCLOUD_DATADIR=/mnt/ncdata # Allows to set the host directory for Nextcloud's datadir. See https://github.com/nextcloud/all-in-one#how-to-change-the-default-location-of-nextclouds-datadir
      # - NEXTCLOUD_MOUNT=/mnt/ # Allows the Nextcloud container to access the chosen directory on the host. See https://github.com/nextcloud/all-in-one#how-to-allow-the-nextcloud-container-to-access-directories-on-the-host
      # - DOCKER_SOCKET_PATH=/var/run/docker.sock # Needs to be specified if the docker socket on the host is not located in the default '/var/run/docker.sock'. Otherwise mastercontainer updates will fail.
      # - DISABLE_BACKUP_SECTION=true # Setting this to true allows to hide the backup section in the AIO interface.
      # - NEXTCLOUD_UPLOAD_LIMIT=10G # Can be adjusted if you need more. See https://github.com/nextcloud/all-in-one#how-to-adjust-the-upload-limit-for-nextcloud
      # - NEXTCLOUD_MAX_TIME=3600 # Can be adjusted if you need more. See https://github.com/nextcloud/all-in-one#how-to-adjust-the-max-execution-time-for-nextcloud
      # - NEXTCLOUD_MEMORY_LIMIT=512M # Can be adjusted if you need more. See https://github.com/nextcloud/all-in-one#how-to-adjust-the-php-memory-limit-for-nextcloud
      # - NEXTCLOUD_TRUSTED_CACERTS_DIR=/path/to/my/cacerts # CA certificates in this directory will be trusted by the OS of the nexcloud container (Useful e.g. for LDAPS) See See https://github.com/nextcloud/all-in-one#how-to-trust-user-defiend-certification-authorities-ca
      # - COLLABORA_SECCOMP_DISABLED=false # Setting this to true allows to disable Collabora's Seccomp feature. See https://github.com/nextcloud/all-in-one#how-to-disable-collaboras-seccomp-feature
      # - NEXTCLOUD_STARTUP_APPS=twofactor_totp deck tasks calendar contacts apporder # Allows to modify the Nextcloud apps that are installed on starting AIO the first time. See https://github.com/nextcloud/all-in-one#how-to-change-the-nextcloud-apps-that-are-installed-on-the-first-startup
      # - NEXTCLOUD_ADDITIONAL_APKS=imagemagick # This allows to add additional packages to the Nextcloud container permanently. Default is imagemagick but can be overwritten by modifying this value. See https://github.com/nextcloud/all-in-one#how-to-add-packets-permanently-to-the-nextcloud-container
      # - NEXTCLOUD_ADDITIONAL_PHP_EXTENSIONS=imagick # This allows to add additional php extensions to the Nextcloud container permanently. Default is imagick but can be overwritten by modifying this value. See https://github.com/nextcloud/all-in-one#how-to-add-php-extensions-permanently-to-the-nextcloud-container

  # # Optional: Caddy reverse proxy. See https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md
  # # You can find further examples here: https://github.com/nextcloud/all-in-one/discussions/588
  # caddy:
  #   image: caddy:alpine
  #   restart: always
  #   container_name: caddy
  #   volumes:
  #     - ./Caddyfile:/etc/caddy/Caddyfile
  #     - ./certs:/certs
  #     - ./config:/config
  #     - ./data:/data
  #     - ./sites:/srv
  #   network_mode: "host"
  
```

### piwigo
   [install guide](https://xmanyou.com/install-piwigo-with-docker-in-minutes/)

```
version: "3"
services:
  piwigo:
    image: lscr.io/linuxserver/piwigo
    network_mode: bridge
    ports:
      - 80:80
    links:
      - db

  db:
    image: linuxserver/mariadb
    network_mode: bridge
    environment:
      MYSQL_USER: "piwigo"
      MYSQL_PASSWORD: "piwigo"
      MYSQL_DATABASE: "piwigo"
      MYSQL_RANDOM_ROOT_PASSWORD: "true"

```

### kodi-headless
   - web UI
```
---
version: "2.1"
services:
  kodi:
    image: linuxserver/docker-kodi-headless
    container_name: kodi
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
    volumes:
      - ./config:/config/.kodi
    ports:
      - 8085:8080
      - 9090:9090
      - 9777:9777/udp
    restart: unless-stopped

```

```
version: "3"
services:
  kodi:
    image: linuxserver/kodi-headless
    network_mode: bridge
    ports:
      - 8096:8096
    links:
      - db

  db:
    image: linuxserver/mariadb
    network_mode: bridge
    environment:
      MYSQL_USER: "kodi"
      MYSQL_PASSWORD: "kodi"
      MYSQL_DATABASE: "kodi"
      MYSQL_RANDOM_ROOT_PASSWORD: "true"

```

### calibre-web

- [calibre-web docker](https://github.com/linuxserver/docker-calibre-web/)
- copy [metadata.db](https://github.com/kovidgoyal/calibre/blob/master/src/calibre/db/tests/metadata.db) to calibre-library
- login: defalut: admin, admin123
- chmod 777 metadata.db

```
---
version: "2.1"
services:
  calibre-web:
    image: lscr.io/linuxserver/calibre-web
    container_name: calibre-web
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=/etc/timezone:/etc/timezone:ro
      - DOCKER_MODS=linuxserver/calibre-web:calibre #optional
      - OAUTHLIB_RELAX_TOKEN_SCOPE=1 #optional
    volumes:
      - ./config:/config
      - ./library:/books
    ports:
      - 8083:8083
    restart: unless-stopped
```
   
1. portainer 
   - deploy: localhsot: works!
   - docker managerment

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


## tips & reference
https://jackstromberg.com/2021/07/how-to-add-buster-backports-to-a-raspberry-pi/
