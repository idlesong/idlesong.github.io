---
layout: post
title:  "Host Blog Over IPFS"
categories: tech
tags: [ipfs, blog]
---
## Host blog over IPFS
1. blog powered by jekyll
```
>jekyll build
# => The current folder will be generated into ./_site
```

1. install IPFS(js-ipfs)
```
> npm install ipfs --global
> jsipfs --help
Commands:
  bitswap               A set of commands to manipulate the bitswap agent.
  block                 Manipulate raw IPFS blocks.
  bootstrap             Show or edit the list of bootstrap peers.
  commands              List all available commands
  config <key> [value]  Get and set IPFS config values
  daemon                Start a long-running daemon process
# ...
```

1. Start local ipfs node
```
>jsipfs init
>jsipfs daemon
```
check http://localhost:5002/webui
1. Add blog to ipfs node
```
>ipfs add -r _site
added QmZsfVcdi6Q6TqFioQDgzGWxjdwft8da6mcGy8HjamV87p _site
```
$SITE_HASH:  QmZsfVcdi6Q6TqFioQDgzGWxjdwft8da6mcGy8HjamV87p

1. visit the blog
 - check http://localhost:9090/ipfs/$SITE_HASH
 - check http://gateway.ipfs.io/ipfs/$SITE_HASH
 - [idlesong's blog](http://gateway.ipfs.io/ipfs/QmZsfVcdi6Q6TqFioQDgzGWxjdwft8da6mcGy8HjamV87p)
 - [tutorials](http://127.0.0.1:9090/ipfs/QmdPtC3T7Kcu9iJg6hYzLBWR5XCDcYMY7HV685E3kH3EcS/2015/09/15/hosting-a-website-on-ipfs/index.html)  


### notes
#### js-ipfs different with go-ipfs
- default repo location: ~/.jsipfs (can be changed with env variable IPFS_PATH)
- default swarm port: 4002
- default API port: 5002
- default Bootstrap is off, to enable it set IPFS_BOOTSTRAP=1

#### web extension
- http://localhost:5002/webui/ should be http://localhost:5002/webui

## reference
- [blog powered by jekll](https://jekyllrb.com/)
- [js-ipfs](https://github.com/ipfs/js-ipfs)
- [ipfs getting started](https://ipfs.io/docs/getting-started/)
- [Hexo+IPFS搭建个人免服务器独立博客](http://esgbox.com/20170413.html)
- [Beaker dat](https://lifent.xyz/)
