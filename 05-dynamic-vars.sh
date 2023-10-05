#!/bin/bash

DATE="$(date +%F)"

echo -e "Todays date is \e[34m $DATE \e[0m"
SESSIONS_COUNT="$(who | wc -l)"
echo -e "Total Number of Active Sessions \e[32m $SESSIONS_COUNT \e[0m"
