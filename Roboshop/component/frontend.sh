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
COMPONENT=frontend
LOGFILE=/tmp/frontend.log

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring ${COMPONENT}.....\e[0m" 

echo -n "Installing nginx:"

yum install nginx -y &>> ${LOGFILE}

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

echo -n Downloading the ${COMPONENT} component :
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

stat

echo -n Clean up of ${COMPONENT} : 

cd /usr/share/nginx/html

rm -rf * &>> ${LOGFILE}
stat

echo  -n Extracting ${COMPONENT} :

unzip /tmp/${COMPONENT}.zip  &>> ${LOGFILE}

echo -n Sorting the ${COMPONENT} files
mv ${COMPONENT}-main/* .    
mv static/* .             
rm -rf frontend-main README.md 
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat

echo -n "Updating the Backend Components in revers proxy file:"

for component in catalogue user cart shipping payment ; do
    sed -i -e "/${component}/s/localhost/${component}.roboshop.internal/" /etc/nginx/default.d/roboshop.conf
done

echo -n Restarting ${COMPONENT}:
systemctl daemon-reload &>> ${LOGFILE}
systemctl restart nginx &>> ${LOGFILE}
stat





