#!/bin/bash

DATE="$(date +%F)"

echo "Todays date is $DATE"
SESSIONS_COUNT="$(who | wc -l)"
echo "Total Number of Active Sessions $SESSIONS_COUNT"
