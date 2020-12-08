---
layout: post
title:  "react-native(ignite) on Debian10"
categories: linux
tags: [Debian, Linux, react-native]
---
## react-native(ignite) on Debian 10

### [react-native getting started on android ](https://facebook.github.io/react-native/docs/getting-started.html)

1. [install node/npm](https://nodejs.org/en/download/package-manager/)
```
curl -sSL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```
1. install react-native-cli && ignite(reactotron)
```
$ npm install -g react-native-cli
$ npm install -g ignite-cli
```
 - Reactotron(download, unzip, run reactotron; install dependencies if nessary)
1. create react-native project with ignite
```
$ ignite new PizzaApp
```

1. react-native run
```
$ npm start
# run avd from android studio, or use a command as below ?
$ ~/Android/Sdk/tools/emulator -avd Nexus_5X_API_23 -netdelay none -netspeed full
$ react-native run-android
```


1. reference and tips
 - [react-native getting started on android ](https://facebook.github.io/react-native/docs/getting-started.html)
 - GFW may cause many strange iusses, such as use curl.
 - mirros: [react-native.cn](https://reactnative.cn/docs/0.51/getting-started.html); [android.cn](https://developer.android.google.cn/)
 - [android emulator: instead kvm?](https://stackoverflow.com/questions/34266247/could-not-launch-qemu-windows-x86-64-qemu-system-i386-exe-no-such-file-or-d/34348073#34348073)
