#!/bin/sh

picom -b &

/bin/sh $HOME/.config/dwm/wp-autochange.sh &
/bin/sh $HOME/.config/dwm/fcitx5.sh &














while true
do
	/bin/sh $HOME/.config/dwm/dwm-status.sh
	sleep 1
done
