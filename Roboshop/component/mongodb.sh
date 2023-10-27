
#!/bin/bash


stat(){
    if [ $? -eq 0 ] ; then
echo -e "\e[32m Success \e[0m"
else
echo -e "\e[31m Failure \e[0m"
fi

}

USER_ID=$(id -u)
COMPONENT=mongodb
LOGFILE=/tmp/frontend.log

if [ $USER_ID -ne 0 ] ; then 

echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

elif [ $USER_ID -eq 0 ] ; then

echo -e "\e[33m Configuring ${COMPONENT}.....\e[0m" 

echo  -n Configuring ${COMPONENT} repo :
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat

echo -n Installing ${COMPONENT} :
yum install -y mongodb-org  &>> ${LOGFILE}
stat

fi

echo -n Enabling the ${COMPONENT} Visibility :
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
stat
echo -n Starting the ${COMPONENT} :
systemctl enable mongod &>> ${LOGFILE}
systemctl start mongod &>> ${LOGFILE}
stat

echo -n Downloading ${COMPONENT} Schema :
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat

echo -n Extracting ${COMPONENT} Schema :
cd /tmp
unzip ${COMPONENT}.zip &>> ${LOGFILE}
stat

echo -n Injecting ${COMPONENT} Schema :
cd ${COMPONENT}-main
mongo < catalogue.js &>> ${LOGFILE}
mongo < users.js &>> ${LOGFILE}
stat

echo -e "\e[35m ${COMPONENT} Installation is compleated \e[0m \n"



# echo -n "Installing nginx:"

# yum install nginx -y &>> ${LOGFILE}

# stat


# fi

# echo -n "Starting nginx:"

# systemctl enable nginx

# systemctl start nginx

# stat

# if [ $? -eq 0 ] ; then
# echo -e "\e[32m Successfully started \e[0m"
# else
# echo -e "\e[31m nginx not started \e[0m"
# fi

# echo -n Downloading the ${COMPONENT} component :
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# stat

# echo -n Clean up of ${COMPONENT} : 

# cd /usr/share/nginx/html

# rm -rf * &>> ${LOGFILE}
# stat

# echo  -n Extracting ${COMPONENT} :

# unzip /tmp/${COMPONENT}.zip  &>> ${LOGFILE}

# echo -n Sorting the ${COMPONENT} files
# mv ${COMPONENT}-main/* .    
# mv static/* .             
# rm -rf frontend-main README.md 
# mv localhost.conf /etc/nginx/default.d/roboshop.conf
# stat

# echo -n Restarting ${COMPONENT}:
# systemctl daemon-reload &>> ${LOGFILE}
# systemctl restart nginx &>> ${LOGFILE}
# stat




