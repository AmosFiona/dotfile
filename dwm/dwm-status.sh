#!/bin/bash

picom -b &

/bin/bash $HOME/.config/dwm/wp-autochange.sh &


















while true
do
	/bin/bash $HOME/.config/dwm/dwm-status-refresh.sh
	sleep 1
done
