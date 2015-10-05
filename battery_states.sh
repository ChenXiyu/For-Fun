#!/bin/bash

declare -i full
declare -i now
declare -i battery_now

full=`cat /sys/class/power_supply/BAT0/energy_full`
now=`cat /sys/class/power_supply/BAT0/energy_now`
battery_now=now*100/full

echo "$battery_now %"
exit 0
