
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
COMPONENT=catalogue
LOGFILE=/tmp/frontend.log
APPUSER=roboshop

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring ${COMPONENT}.....\e[0m" 

echo  -n Configuring ${COMPONENT} repo :
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
stat

echo -n Installing NodeJS :
yum install nodejs -y  &>> ${LOGFILE}
stat

fi

echo -n Creating Application User Account :
useradd roboshop
stat

# echo -n Downloading ${COMPONENT} Schema :
# curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
# stat

# echo -n Extracting ${COMPONENT} Schema :
# cd /tmp
# unzip -o ${COMPONENT}.zip &>> ${LOGFILE}
# stat

# echo -n Injecting ${COMPONENT} Schema :
# cd ${COMPONENT}-main
# mongo < catalogue.js &>> ${LOGFILE}
# mongo < users.js &>> ${LOGFILE}
# stat

# echo -e "\e[35m ${COMPONENT} Installation is compleated \e[0m \n"








