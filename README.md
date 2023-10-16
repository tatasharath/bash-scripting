# Bash-Scripting
...
This repository contains all the basics needs to learn BASH SCRIPTING and the major goal is to automate the entire configuration managment procedure Involved as apart of the set-up.
...


### How to Push the code to git hub ?
On your VS Code open the folder ( by using file option on your VS Code or code folderName on your treminal)


...
    
 $ git add .               // This will let git know to start tracking all the files

   $ git commit -m "Updated the readme file"

   $ git push                // This will push the code to the repository on GitHub

...

### How to open a folder on VS Code with Command

...
   $ code folderName
...
This is a repository created to publish all the Bash Basich and project automation

* This repo is created to share all the linux basics
* Along with Linux Bash Syntax
* Then we will Automate the infrastructure provisioning
* And then congiguration Managment.

This is a repository created to publish all the Bash Bascis and project automation

This repo is created to share all the linux basics
Along with Linux Bash Syntax
Then we will automate the infrastructure provisioning
And then Configuration Management.
Following are the shell scripting topics which we discuss as a part of our project
1. SheBang Notation and Comments
2. Printing
3. Variables
    - Local Variables.
    - Environment Variables.
    - Command Substitution.
4. Inputs
    - Special Variables
    - Prompts
5. Functions
6. Redirectors & Quotes & Exit status 
7. Conditions
8. Loops
9. Basis of SED Command
10. Commands

### Expressions are categorized in to three
1. Numbers
2. Strings
3. Files

Operators on numbers:
-eq , -ne , -gt, -ge, -lt, -le

[ 1 -eq 1 ] 
[ 1 -ne 1 ]

Operators on Strings:


    = , == , !=

    [ abc = abc ]

    -z , -n 

    [ -z "$var" ] -> This is true if var is not having any data
    [ -n "$var" ] _> This is true if var is having any data

    -z and -n are inverse proportional options


Operators on files:
    Lot of operators are available and you can check them using man pages of bash 

    [ -f file ] -> True of file exists and file is a regular file 

    [ -d xyz ]  -> True if file exists and it is a directory

    ### Explore the file types, There are 7 types on files in Linux.


COMMENT

ACTION=$1
 
if [ -z "$ACTION" ]; then 
    echo Argument is needed, Either start/stop
    
else 
    echo Thanks

fi  -->




# In Bash Scripting, even if the instruction x-fails, it just goes with the execution of other commands in sequence.
# That's the default behavior of BASH.
# If you don't want the script to proceeding further in case of any failure, you can use "set -e" in the beginning of the script.




###  How to keep our Roboshop Project Automation Code DRY ?  How can we eliminate the repititive code  

1) Best Possible Approach is define functions and call them on whenever you need.
2) The caviet here is, by default if you define a function inf x.sh , you can only call that function with in that file only.
3) To over the above challenge, what we can do is, we can define functions in a common.sh file and call all the needed functions from the common file.

a)  For nodejs components, let's create a function for nodejs and declare all the action in this and call it when you're using any nodejS   components.

b)  For python components, let's create a function for python and declare all the action in this and call it when you're using any python   components.

c)  For java components, let's create a function for java and declare all the action in this and call it when you're using any java components.

d)  For angularjs components, let's create a function for angularjs and declare all the action in this and call it when you're using any angularjs components.

