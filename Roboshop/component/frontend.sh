#!/bin/bash
set -e

stat(){
    if [ $? -eq 0 ] ; then
echo -e "\e[32m Success \e[0m"
else
echo -e "\e[31m Failure \e[0m"
fi

}

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring frontend.....\e[0m" 

echo -n "Installing Frontend:"

yum install nginx -y &>> /tmp/frontend.log

stat


fi

echo -n "Starting nginx:"

systemctl enable nginx

systemctl start nginx

stat

if [ $? -eq 0 ] ; then
echo -e "\e[32m Successfully started \e[0m"
else
echo -e "\e[31m nginx not started \e[0m"
fi

echo -n Downloading the frontend component :
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

stat

echo -n Clean up of frontend : 

cd /usr/share/nginx/html

rm -rf * &>> /tmp/frontend.log
stat

echo  -n Extracting Frontend :

unzip /tmp/frontend.zip  &>> /tmp/frontend.log

stat

echo -n Sorting the frontend files
mv frontend-main/* .
mv static/*
rm -rf static README.md &>> /tmp/frontend.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat

echo -n Restating Frontend:
systemctl daemon-reload &>> /tmp/frontend.log
systemctl restart nginx &>> /tmp/frontend.log
stat




