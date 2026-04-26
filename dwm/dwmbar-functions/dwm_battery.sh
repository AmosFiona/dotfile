#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
	CYCLES=$(cat /sys/class/power_supply/BAT0/cycle_count)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "🔌 %s%% %s ♻ %s"  "$CHARGE" "$STATUS" "$CYCLES"
		  else if [ "$STATUS" = "Discharging" ]; then # Discharging
            #printf "🔋 %s%% %s ♻ %s" "$CHARGE" "$STATUS" "$CYCLES"
            printf "🔋 %s%% \uf5e7 %s ♻ %s" "$CHARGE" "$STATUS" "$CYCLES"
		  else 	# Not Charging
            printf "🔋 %s%% %s ♻ %s" "$CHARGE" "$STATUS" "$CYCLES"
		  fi
        fi
    else
        printf "BAT %s%% %s ♻ %s" "$CHARGE" "$STATUS" "$CYCLES"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

