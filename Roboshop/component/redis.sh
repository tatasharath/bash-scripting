
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
COMPONENT=redis
LOGFILE=/tmp/frontend.log

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring ${COMPONENT}.....\e[0m" 

echo  -n Configuring ${COMPONENT} repo :
curl -L https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/redis.repo -o /etc/yum.repos.d/${COMPONENT}.repo &>> ${LOGFILE}
stat

echo -n Installing ${COMPONENT} :
yum install redis-6.2.12 -y  &>> ${LOGFILE}
stat

fi


echo -n Enabling the ${COMPONENT} Visibility :
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/${COMPONENT}.conf
stat
echo -n Starting the ${COMPONENT} :
systemctl daemon-reload &>> ${LOGFILE}
systemctl enable ${COMPONENT} &>> ${LOGFILE}
systemctl start ${COMPONENT} &>> ${LOGFILE}
stat



echo -e "\e[35m ${COMPONENT} Installation is compleated \e[0m \n"








