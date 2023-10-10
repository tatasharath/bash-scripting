#!/bin/bash 

echo '$$'    # $$ is going to print the PID of the current proces 
echo '$#'    # $# is going to print the number of arguments
echo '$?'    # $? is going to print the exit code of the last command.
echo '$*'    # $* is going to print the used arguments
echo '$@'   # $* is going to print the used arguments

# Single Quotes will suppress the power of a special variable
# Whenever you have any special variables, prefer to avoid single quotes and go with double quotes