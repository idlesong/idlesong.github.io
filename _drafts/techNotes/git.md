#git
## cheat sheet

#### 创建新仓库
- git init

#### 检出仓库
- git clone /path/to/repository
- git clone username@host:/path/to/repository
- git clone

#### 添加与提交
- git status
- git add <filename> / git add -u
- git add .
- git commit -m "commit info"
- git push origin master

#### 丢弃本地代码,到服务器获取最新版本,并将本地主分支指向他
- git fetch origin
- git reset --hard origin/master