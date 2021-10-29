# handybox 小工具集合：
## 特性
- 简化步骤；
- 为键盘党提高速度；
- popover式，随时弹出，不干扰主要工作；(类似通知栏，主程序隐藏)；

## 具体功能
1. CMD F1(s): 查找：字典，wikipedia (Dictd/ dict, 能否以智能方式制作字典源)
2. CMD F2(c): 计算器，下面出结果，和结果的记录
3. CMD F3(n): 记事本，org-mode的方式，集成canlendar，可同步到gkeep，可分享到sns
4. CMD F4(p): 截屏，基本模式，键盘即可选择（包括默认保存地址），鼠标只选框;或集成到note
5. CMD F5(t): twister客户端（SNS)典默认翻译，D，W，Maps)，删除S，D等更改目录
6. CMD F6(i): im 类似google talk 一样漂亮的前端

## 实现构想
1. Alfred
2. 做成类是Gnome Do一样的插件
3. 通过ruby+gtk，gnome extension
4. 深度集成各gnome apps（dictionary，note，提供统一界面和快捷方式）
- 如类似google now/keep的界面，显示gnome-dictionary，bijiben, calculator, find
5. 能否与通知栏结合？
