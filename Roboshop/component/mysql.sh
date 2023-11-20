#!/bin/bash 

COMPONENT=mysql

source components/common.sh

echo -e "\e[35m Configuring ${COMPONENT} ......! \e[0m \n"

echo -n "Configuring ${COMPONENT} repo :"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/stans-robot-project/mysql/main/mysql.repo
stat

echo -n "Installing ${COMPONENT}  :"
yum install mysql-community-server -y     &>>  ${LOGFILE}
stat