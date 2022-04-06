#!/bin/sh

# Change the line below according to your hardware
# 充电状态下的OLED亮度，执行后强制修改为0,然后可以更改数值为12,AMDGPU驱动引入actul值的BUG
BRIGHTNESS_FILE="/var/lib/systemd/backlight/pci-0000:04:00.0:backlight:amdgpu_bl0"
#BRIGHTNESS_FILE="/sys/class/backlight/amdgpu_bl1/actual_brightness"
BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")
BRIGHTNESS=$(($BRIGHTNESS*255/65535))
BRIGHTNESS=${BRIGHTNESS/.*} # truncating to int, just in case
echo $BRIGHTNESS > "$BRIGHTNESS_FILE"


#电池状态下的OLED亮度，执行后强制修改为0,然后可以更改数值为12
BRIGHTNESS_FILE="/var/lib/systemd/backlight/pci-0000:04:00.0:backlight:amdgpu_bl1"
#BRIGHTNESS_FILE="/sys/class/backlight/amdgpu_bl1/actual_brightness"
BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")
BRIGHTNESS=$(($BRIGHTNESS*255/65535))
BRIGHTNESS=${BRIGHTNESS/.*} # truncating to int, just in case
echo $BRIGHTNESS > "$BRIGHTNESS_FILE"

# Backlight level from systemd's perspective (change if needed)
#readonly SYSTEMD_BACKLIGHT_FILE='/var/lib/systemd/backlight/pci-0000:04:00.0:backlight:amdgpu_bl0'

# Backlight level from AMDGPU driver
#readonly AMDGPU_BACKLIGHT_FILE='/sys/class/backlight/amdgpu_bl1/brightness'

# Read current value from the driver and apply it to systemd
#readonly AMDGPU_BACKLIGHT_VALUE=$(cat "$AMDGPU_BACKLIGHT_FILE")
#echo "$AMDGPU_BACKLIGHT_VALUE" > "$SYSTEMD_BACKLIGHT_FILE"
