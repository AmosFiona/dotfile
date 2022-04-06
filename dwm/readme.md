For dwm-autostart-20210120-cb3f58a.diff

The files listed above are looked up in the directories

```
Level_1 : "$XDG_DATA_HOME/dwm",      ---> /dwm
Level_2 : "$HOME/.local/share/dwm",  ---> /home/USERNAME/.local/share/dwm
Level_3 : "$HOME/.dwm" respectively. ---> /home/USERNAME/.dwm
```

The first existing directory is used, no matter if it actually contains any file.

touch the "autostart.sh" at $HOME/.local/share/dwm/

and put it:

```
#!/bin/sh

/bin/sh $HOME/.config/dwm/dwm-status.sh &
```

另外，如果运行 startx 进入 dwm 后又立马退出的崩溃，通过查看 EE 会发现提示调用一个软盘没有权限
一般情况下是 dwm-bar 崩溃了，例如台式机没有屏幕亮度这块内容，优先把 bar 屏蔽掉尝试运行 startx
