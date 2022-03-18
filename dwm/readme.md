
For dwm-autostart-20210120-cb3f58a.diff

The files listed above are looked up in the directories

```
Level_1 : "$XDG_DATA_HOME/dwm",      ---> /dwm
Level_2 : "$HOME/.local/share/dwm",  ---> /home/USER/.local/share/dwm
Level_3 : "$HOME/.dwm" respectively. ---> /home/USER/.dwm
```

The first existing directory is used, no matter if it actually contains any file.


touch the "autostart.sh" at $HOME/.local/share/dwm/

and put it:
```
#!/bin/bash

/bin/bash $HOME/.config/dwm/dwm-status.sh &
```


