# My Docker Server notes

## Docker & Docker-compose

```
nano docker-compose.yml
docker-compose up -d
docker-compose down
docker-compose logs
```

## Docker Apps
1. calibre-web localhost:8083 works!
   - [calibre-web docker](https://github.com/linuxserver/docker-calibre-web/)
   - copy [metadata.db](https://github.com/kovidgoyal/calibre/blob/master/src/calibre/db/tests/metadata.db) to calibre-library
   - login: defalut: admin, admin123
   - chmod 777
1. portainer localhsot: works!
1. samba localhost \\localhost\share works
   - [samba docker](https://github.com/dperson/samba)
1. kodi
   - web UI
1. emby localhost:8096 works!
   - linuxserver docker
   
1. nextcloud
   - official docker?

## debug
1. check port & stop process
```
lsof -i:8000 #-i port number
netstat -tunlp | grep 8080 # port number
kill -9 PID #PID: process number
```
