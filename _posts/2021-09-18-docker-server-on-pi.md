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
      TZ: 'EST5EDT'
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
      - /mnt:/mnt:z
      - /mnt2:/mnt2:z
    command: '-s "Mount;/mnt" -s "Bobs Volume;/mnt2;yes;no;no;bob" -u "bob;bobspasswd" -p'

networks:
  default:
```

Note:
command:  # -s "Share name; share path in docker; all workgroup visable; not read only(writeabl); forbidden guest; assign owner; assign super user; assign users with write rights"

https://jackstromberg.com/2021/07/how-to-add-buster-backports-to-a-raspberry-pi/
