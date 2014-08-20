# handybox 小工具集合：
## 特性
- 简化步骤；
- 为键盘党提高速度；
- popover式，随时弹出，不干扰主要工作；(类似通知栏)；

## 具体功能
1. 查找：字典，wikipedia (Dictd/ dict, 能否以智能方式制作字典源)
2. 计算器
3. 记事本，org-mode的方式，集成canlendar 
4. 剪贴板优化：能预先识别剪贴板内容
5. tips/cheatsheet
6. sns post
6. 简化的command工具，实现ruby console一样的小工具; 实现一个折叠的；

## 实现构想
1. Alfred
2. 做成类是Gnome Do一样的插件
3. 通过ruby+gtk，gnome extension
4. 深度集成各gnome apps（dictionary，note，提供统一界面和快捷方式）
- 如类似google keep的界面，显示gnome-dictionary，bijiben, calculator, find
