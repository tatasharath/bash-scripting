#!/bin/bash 

# Each and every color you see on terminal will have a color code and we need to use that code baesd on our need.

# Colors       Foreground          Background
# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46

# Syntax To Print Color Text Is :
# Ex : 
# echo -e "\e[COLORCODEm  Your Msg To Be Printed In Color \e[0m"
echo -e "\e[31m My name is Sarath \e[0m"

# To print something with background + foreGround color , here is the syntax: 
# Ex : 
#   echo -e "\e[backGrouCode;foreGroudCodem your Message \e[0m"

echo -e "\e[43;30m my wife name is chakrini \e[0m"

echo -e "\e[33m I am printing YELLOW Color  \e[0m"
echo -e "\e[32m I am printing GREEN Color   \e[0m"
echo -e "\e[34m I am printing BLUE Color    \e[0m"
echo -e "\e[35m I am printing Magneta Color \e[0m"

# Background + Foreground Color
echo -e "\e[43;34m I am printing both the colors \e[0m"