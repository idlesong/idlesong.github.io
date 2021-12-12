## Install Gnome41 on Debian 41

### Gnome41

[How to Install GNOME 41 Desktop Unstable on Debian 11 Bullseye](https://www.linuxcapable.com/how-to-install-gnome-41-desktop-unstable-on-debian-11-bullseye/)

 install Intel WIFI drivers with LAN: iwlwifi 

adding a line to your /etc/apt/sources.list like this:
`deb http://ftp.de.debian.org/debian sid main non-free`

```
sudo apt update
sudo apt install iwlwifi
```

### Rime(Chinese input)

1. Setup Chinese Language first

```
$ sudo vi /etc/locale.gen
# undo comment zh.CN.UTF-8 UTF-8
$ sudo /usr/sbin/locale-gen
# gnome-settings/Region & Language, select 汉语
```
2. install & config ibus-rime
install ibus-rime sudo apt install ibus-rime
settings -> keyboard -> input sources: add Chinese(Rime)
run `ibus-setup` -> IBus Preference -> input method: Add Chinese(Rime) # can ignore?

3. change back to English
gnome-settings/Region & Language, select English
tips: ctrl+`

