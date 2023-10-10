#!/bin/bash

#there are four types of commands available:

# 1) binary         (/bin /sbin)
# 2) aliases        (aliases are shortcuts alies net = "netstat -tulpn" )
# 3) shell build in comands
# 4) Functions      # functions are nothing but a set of commands that can be writted in a sequence and can be called n number of times as per requirement



# how to declear a function?

# f(){
# echo sarath    
# }

# # This is how you call a function
# f


# sample(){
#     echo Hai from sarath
#     echo function is compleated
# }

# sample

# echo cample call is compleated

# sample

stat (){
    echo number sessions open $(who | wc -l)
    echo todays date is $(date +%F)
}

stat

sleep 1

stat

sleep 2

stat

sleep 3

stat
