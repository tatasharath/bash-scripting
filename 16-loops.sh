#!/bin/bash


# Loops are used to executed something for certain number of times 


# There are 2 major types of loops ; 
#     1) For loop       ( When you know something to be executed n number of time, we use for loop)
#     2) While loop     ( When you don't know something to be executed n number of times, we use while loop)


# For loop syntax 

for var in 10 20 30 40 50 60 ; do 
 echo "variable value is $var"

done

# while loop syntax

while [ condition ];
do
    # statements
    # commands
done  

#example

sarath=10
while [$sarath -lt 15] ; do

echo $sarath

((sarath++))
done
