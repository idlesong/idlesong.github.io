## Gnome Damme Lies 改进
### gnome rust
### gedit with rust

### celebro app/ Alfred app
1. quick search & quick look(webview)
1. gnome shell search extension? [SearchProvider](https://developer.gnome.org/SearchProvider/)
1. wikipedia dictionary extension.
1. search provoider for web applications
  - wikipedia
  - dictionary(youdao?)
  - cheatsheet: git? ruby? linux commands
1. notes/todo    
1. bring celebro plugins to gnome extensions?
  - devdocs
  - define
  - youdao
  - emoj

**如果按照github的思路改造应该不错**：

#### 图形化git在Damne Lies的应用（毕竟翻译的人不是开发者）：
1. clone就是自己玩
2. pull request相当于认领任务
3. 合并进分支相当于commit

#### 升级功能：
0. poedit 在线实现，并能离线编辑（类似github的简化）
1. 术语表 自动检查；菜单单词的多分支统一；

在线翻译，每个人都可以显示最后的效果。
主分支，其他分支都可以接受别人的更改，也能看到别人在修改。

可以很容易形成社区化：自己翻译的随时能看到效果；同一主题的随时能看到共同翻译的人；交流互动更容易；
随时提交作为自己的repo，关键不会有挫败感；

#### note
- gimp的在线手册要做到Ruby rails一样简洁
- ××××为什么每版都要从头再翻译一遍，有没有办法重复利用？如gimp2.2的中文翻译。似乎发PO，对比以前PO，
在线列出差异，然后之翻译有差异的部分，是否可行？节省时间，毕竟还有太多的软件没有翻译。
- 另外把整个Manul放在github上供人自行修改岂不更好？把不同语言的翻译的PO剥离出来。

## Gnome Software Center 改进
- 软件能否和软件的社区结合：比如Wiki，Q&A，Online Documents；
- 又或者使用Wikipedia的介绍（有Wikipedia介绍可以作为一个评价指标）

## Gtk ruby
- 整合一个类似rails一样的教程网站

## gnome 畅想
- GirFFI 能否改进成类似rails的框架（MVC），这样就不需要IDE了 -> rust
- Gnome JavaScript/CSS，有没可能搞个Browser式的调试工具

## gnome software
- 评论中的 关键字，留言者如果未标注label，其他人可以标注并通知原评论者，可按label显示
- 自动装机工具：各种应用，特别是Software中有 -> editor's choice app
- 类似7zip之类的还没有GUI，如何简洁地添加一个GUI，有什么机制可以快速地将经典命令行转为GUI

## gnome software web(apps dictionary) -> flathub
gnome-webkit theme
git - pps

## 控制台VTE
- 各个Command Line按Google Now一样的显示，点击可展开，替代tab式显示，并显示Icon图标。
- 将自动启动的一些服务加在里面。
