#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m to excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"

exit 1
fi



echo -e "\e[32m Configuring frontend.....\e[0m" 

echo "Installing Frontend :"


yum unstall nginx -y &>> /tmp/frontend.log

