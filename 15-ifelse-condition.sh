#!/bin/bash

echo "demo on if and if-else and else-if usage"

ACTION=$1

if [ "$ACTION" == "start" ]; then
echo -e "\e[32m starting my demo on if \e[0m"
exit 0
fi