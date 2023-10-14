#!/bin/bash

echo "demo on if and if-else and else-if usage"

ACTION=$1

if[ "$ACTION" == "start"];
echo -e "\e[31m stopping payment \e[0m"
exit 0
