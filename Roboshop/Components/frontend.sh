#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -eq 0 ] ; then 

echo -e "\e[32m Configuring frontend.....\e[0m" 

echo "Installing Frontend :"

yum install nginx -y &>> /tmp/frontend.log

elif [ $? -eq 0 ]; then

echo "successful installed"

else
echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m to excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1
fi

# if


# echo -e "\e[32m Configuring frontend.....\e[0m" 

# echo "Installing Frontend :"


# yum install nginx -y &>> /tmp/frontend.log

