---
layout: post
title:  "Nextcloud & Samba over Raspberry Pi"
categories: tech_life
tags: [yunohost, tech_life, raspberrypi]
---
## install nextcloud & samba in raspberry pi

[mount usb drive(NTFS) with user www-data](https://pimylifeup.com/raspberry-pi-mount-usb-drive/)

```
sudo mkdir /media/extdisk
ls -l /dev/disk/by-uuid
id -u www-data
id -g www-data
sudo nano /etc/fstab ## UUID=1610029410027ACF /media/extdisk auto nofail,uid=33,gid=33,noatime 0 0
sudo umount /dev/sda1
sudo mount -a
sudo reboot
```

[install nextcloud & move Nextcloud's data directory to usb drive](https://pimylifeup.com/raspberry-pi-nextcloud-server/)
```
## /var/www/html/nextcloud/config/config.php
'datadirectory' => '/media/extdisk/nextcloud/data',
'check_data_directory_permissions' => false,
```

```
sudo mv -v /var/www/html/nextcloud/data /media/extdisk/nextcloud/data
```

[install samba](https://pimylifeup.com/raspberry-pi-samba/)
[How to connect to Linux Samba shares from Windows 10](https://www.techrepublic.com/article/how-to-connect-to-linux-samba-shares-from-windows-10/)
