#!/bin/bash

echo "deom on if and if-els and else-if usage"

ACTION=$1

if[ "$ACTION" == "start"]; then
echo -e '\e[31m stopping payment \e[0m"

exit 0