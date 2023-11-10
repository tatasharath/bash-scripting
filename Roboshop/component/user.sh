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
COMPONENT=user
LOGFILE=/tmp/frontend.log
APPUSER=roboshop

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring ${COMPONENT}.....\e[0m" 

echo  -n Configuring ${COMPONENT} repo :
curl --silent --location https://rpm.nodesource.com/setup_16.x | bash - &>> ${LOGFILE}
stat

echo -n Installing NodeJS :
yum install nodejs -y  &>> ${LOGFILE}
stat
fi

id ${APPUSER} &>> ${LOGFILE}

if [ $? -ne 0 ] ; then
echo -n "Creating Application User Account"
useradd roboshop
stat
fi

echo -n Downloading ${COMPONENT} :
curl -s -L -o /tmp/${COMPONENT}.zip https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip
stat

echo -n Copying the ${COMPONENT} to ${APPUSER} home directory :
cd /home/${APPUSER}/

rm -rf ${COMPONENT} &>> ${LOGFILE}
unzip -o /tmp/${COMPONENT}.zip &>> ${LOGFILE}
stat

echo -n Changing the ownership :
mv ${COMPONENT}-main ${COMPONENT}
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/
stat

echo -n Generating the ${COMPONENT} Artifacts:

cd /home/${APPUSER}/${COMPONENT}/
npm install     &>> ${LOGFILE}
stat

echo -n "Configuring the ${COMPONENT} system file:"
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/MONGO_ENDPOINT/mongodb.roboshop.internal/' /home/${APPUSER}/${COMPONENT}/systemd.service
mv /home/${APPUSER}/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
stat

echo -n Starting the ${COMPONENT} Service:
systemctl daemon-reload &>> ${LOGFILE}
systemctl start ${COMPONENT}    &>> ${LOGFILE}
systemctl restart ${COMPONENT}  &>> ${LOGFILE}
stat

echo -e "\e[33m ${COMPONENT} Installation Completed \e[0m \n"









