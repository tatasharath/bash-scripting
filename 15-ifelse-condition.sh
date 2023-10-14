#!/bin/bash

echo "demo on if and if-else and else-if usage"

ACTION=$1

if [ "$ACTION" == "start" ]; then
echo -e "\e[32m Starting my demo on if \e[0m"
exit 0

elif [ "$ACTION" == "stop" ]; then
echo -e "\e[31m Stopping my demo on if \e[0m"

elif [ "$ACTION" == "restart" ]; then
echo -e "\e[33m Restarting my demo on if \e[0m"

else
 echo -e "\e[31m contition is false \e[0m \n bash script name - $ACTION stop"
fi