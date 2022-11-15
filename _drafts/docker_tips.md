## docker tips

[docker samba](https://www.zdyn.net/docker/2021/07/12/docker-cifs.html)

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
      - /mnt/exthd/movies:/data/movies
      - /mnt/exthd/tvshows:/data/tvshows
      - /mnt/exthd/music_videos:/data/music_videos
      - /mnt/exthd/songsong/selected:/data/songsong_selected
      - /mnt/exthd/yinyin/selected:/data/yinyin_selected
      - /opt/vc/lib:/opt/vc/lib #optional
      - external_samba:/data/ext_smb_movies
   ports:
      - 8096:8096
      - 7359:7359/udp #optional
      - 1900:1900/udp #optional
    restart: unless-stopped

volumes:
  external_samba:
    driver_opts:
      type: "cifs"
      device: "//192.168.1.40/RaspiNAS/movies"
      o: "username=idlesong,password=Web225819,ro"



```