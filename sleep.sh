#!bin/bash

BOOT_MIN=$(uptime -s | cut -d ":" -f 2)
BOOT_SEC=$(uptime -s | cut -d ":" -f 3)

DELAY=$(bc <<< $BOOT_MIN%10*60+$BOOT_SEC)

sleep $DELAY
