#!/bin/bash

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")


SEP1="["
SEP2="]"
IDENTIFIER="unicode"


dwm_date(){
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "📆 %s" "$(date "+%Y年%m月%d日 %H:%M")"
	    #date '+%Y年%m月%d日 %H:%M'
    else
        printf "DAT %s" "$(date "+%a %d-%m-%y %T")"
    fi
}



. "$DIR/dwmbar-functions/dwm_battery.sh"
. "$DIR/dwmbar-functions/dwm_alsa.sh"
. "$DIR/dwmbar-functions/dwm_resources.sh"


upperbar=""
upperbar="$upperbar$(dwm_resources)"
upperbar="$upperbar$(dwm_battery)"
upperbar="$upperbar$(dwm_alsa)"
upperbar="$upperbar$(dwm_date) "

xsetroot -name "$upperbar"
