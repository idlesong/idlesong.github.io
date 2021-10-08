# My Docker Server notes

## Raspberry pi Server
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


## Docker & Docker-compose

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

## cockpit http://localhost:9090
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


## Docker Apps
1. calibre-web http://localhost:8083 works!
   - [calibre-web docker](https://github.com/linuxserver/docker-calibre-web/)
   - copy [metadata.db](https://github.com/kovidgoyal/calibre/blob/master/src/calibre/db/tests/metadata.db) to calibre-library
n   - login: defalut: admin, admin123
   - chmod 777
1. portainer 
   - deploy: localhsot: works!
   - docker managerment
1. samba 
   - deploy localhost \\localhost\share works
   - [samba docker](https://github.com/dperson/samba)
1. kodi
   - web UI
1. emby 
   - deploy: https://localhost:8096 works!
   - [linuxserver docker](https://docs.linuxserver.io/images/docker-emby)
1. nextcloud
   - official docker?
1. syncthing
   - 
1. piwigo
   [install guide](https://xmanyou.com/install-piwigo-with-docker-in-minutes/)
1. heimdall

## debug
1. check port & stop process
```
lsof -i:8000 #-i port number
netstat -tunlp | grep 8080 # port number
kill -9 PID #PID: process number
```

### docker-compose.yml examples
Emby
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
      - TZ=Europe/London
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

## tips & reference
Note:
command:  # -s "Share name; share path in docker; all workgroup visable; not read only(writeabl); forbidden guest; assign owner; assign super user; assign users with write rights"

https://jackstromberg.com/2021/07/how-to-add-buster-backports-to-a-raspberry-pi/