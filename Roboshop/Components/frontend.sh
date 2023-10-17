#!/bin/bash

USER_ID=$(id -u)

if
[USER_ID -ne 0]; then 

echo -e "[/31m to excute the command user should be a root user or a sudo /n /t Example: sudo bash wrapper.sh [0m"

exit 1
fi


# echo "Configuring frontend"

# yum unstall nginx -y

