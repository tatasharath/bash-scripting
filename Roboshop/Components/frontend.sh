#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring frontend.....\e[0m" 

echo -n "Installing Frontend:"

yum install nginx -y &>> /tmp/frontend.log

if [ $? -eq 0 ] ; then

echo -e "\e[32m Successful installed \e[0m"

else
echo -e "\e[31m Installation is not successful \e[0m"
fi

fi

echo -n "Starting nginx:"

systemctl enable nginx

systemctl start nginx

if [ $? -eq 0 ] ; then
echo -e "\e[32m Successfully started \e[0m"
else
echo -e "\e[31m nginx not started \e[0m"
fi

