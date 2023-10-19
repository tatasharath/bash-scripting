#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -eq 0 ] ; then 

echo -e "\e[32m Configuring frontend.....\e[0m" 

echo -n "Installing Frontend :"

yum install nginx -y &>> /tmp/frontend.log

# echo $?
USER=$? 

elif [ USER == $? ]; then
-e "\e[32m Successful installed \e[0m"
# echo "Successful installed"

else
echo -e "\e[31m Not Installed \e[0m"

echo -e "\e[33m To excute the command user should be a root user or a sudo \e[0m \n \t Example: sudo bash wrapper.sh"
exit 1

fi


# if [ $USER_ID -ne 0 ] ; then    
#     echo -e "\e[31m Script is expected to executed by the root user or with a sudo privilege \e[0m \n \t Example: \n\t\t sudo bash wrapper.sh frontend"
#     exit 1
# fi
# echo -e "\e[32m Configuring frontend.....\e[0m" 

# echo -n "Installing Frontend :"

# yum install nginx -y &>> /tmp/frontend.log

# if [ $? -eq 0 ]; then

# echo "Successful installed"

# else
# echo -e "\e[31m Not Installed \e[0m"

# fi