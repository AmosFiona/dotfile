#!/bin/bash

# Wallpaper files
LIST=(
  "[A]strophotography" 	"$HOME/Pictures/Wallpaper/Astrophotography"
  "[B]eauty"  	       	"$HOME/Pictures/Wallpaper/Beauty"
  "[H]umanity" 			"$HOME/Pictures/Wallpaper/Humanity"
  "[L]andscape" 		"$HOME/Pictures/Wallpaper/Landscape"
  "[N]udeArt" 			"$HOME/Pictures/Wallpaper/NudeArt"
  "[P]ortrait" 			"$HOME/Pictures/Wallpaper/Portrait"
  "[S]till" 			"$HOME/Pictures/Wallpaper/Still"
  "[U]rbanNight" 		"$HOME/Pictures/Wallpaper/UrbanNight"
  "[O]ther" 			"$HOME/Pictures/Wallpaper/Other"
  )
# 防止重复运行
PIDFILE="/tmp/wp-dwm.pid"
if [ -f "$PIDFILE" ]; then
  PID=$(cat "PIDFILE")
  if ps -p "$PID" >/dev/null 2>&1; then
	exit 0
  fi
  rm -f "$PIDFILE"
fi
# 终端菜单选择
echo "======== select Wallpaper ========"
idx=1
i=0
while [ $i -lt ${#LIST[@]} ]
do
  name="${LIST[$i]}"
  path="${LIST[$i+1]}"
  #printf "%s.%s -> %s\n" "$idx" "$name"  "$path"
  echo "$idx.$name -> $path"
  idx=$((idx+1))
  i=$((i+2))
done
echo "====================================="
read -p "input number or pre,eg(A/N/B...):" sel
# check sel
SEL_DIR=""
idx=1
i=0
while [ $i -lt ${#LIST[@]} ]
do
  name="${LIST[$i]}"
  path="${LIST[$i+1]}"
  # 匹配数字编号
  if [ "$sel" = "$idx" ]; then
	SEL_DIR="$path"
	break
  fi
  # 匹配字母
  #if [[ $name =~ \[([a-zA-Z])\] ]]; then
  if  echo "$name" | grep -qE '\[([a-zA-Z])\]'; then
	key=$(echo "$name" | sed -E 's/^\[([a-zA-Z])\].*$/\1/')
	if [ "${sel^^}" = "$key" ]; then
	  SEL_DIR="$path"
	  break
	fi
  fi
  idx=$((idx++))
  i=$((i+2))
done
# Checking input
if [ -z "$SEL_DIR" ] || [ ! -d "$SEL_DIR" ]; then
  echo " Failed select or No Files exits"
  exit 0
fi
# Checking pictures exists or not
pic_num=$(find "$SEL_DIR" -maxdepth 1 -type f \
-iname "*.jpg" -o -iname "*jpeg" -o -iname "*.png" -o -iname "*.webp" | wc -l )
if [ "$pic_num" -eq 0 ]; then
  echo "There is no any pictures "
  exit 0
fi
# start dwm
echo $$ > "$PIDFILE"
trap 'rm -f "$PIDFILE"' EXIT
#nohup bash -c"
#while true; do
#  feh --bg-fill --randomize "$SEL_DIR"
#  sleep 60
#done
#" >/dev/null 2>&1 &
(
while true; do
  feh --bg-fill --randomize "$SEL_DIR"
  sleep 60
done
  ) &
echo " Wallpaper starting and do  startx for dwm..."
# read -rs -n 1
sleep 1
