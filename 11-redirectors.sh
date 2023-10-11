#!/bin/bash

# Redirectors are of 2 types in bash 
#     1) Input Redirector   ( Means take input from the file )        :    <   ( Ex : sudo mysql </tmp/studentapp.sql )
#     2) Output Redirector  ( Means routing the output to a file )    :    > or 1>    >>  ( >> appends the latest output to the existing content)

# Outputs 
#     1) Standard Output                       > or >> or 1> 
#     2) Standard Error                        2> or 2>>
#     3) Standard Output and Standard Error    &> or &>>


# ls -ltr    >  output.txt   # Redirects the output to  output.txt
# ls -ltr    >> output.txt   # Redirects and appends the output to  output.txt
# ls -ltr    2> output.txt   # Redirects the error only to  output.txt
# ls -ltr    &> output.txt   # Redirects the output or error output.txt



exit 1 


echo Hai