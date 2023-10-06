#!/bin/bash


# Each and every action in linux will have a exit code
# 0 to 255 is the range of the codes 
# Among all,  0  represents action completed successfull .
# Anything in betwenn 1 to 255 represents either partial succes, parital failure , complete failure

# 0         : Global Success
# 1 - 125   : Some failure from the command 
# 125+      : System Failure



# Exit codes also plays a key role in debugging big scripts.

# Ex : If you're having a big script and if your script fails and it's really challenging to figure out the mistake as it makes us to watch over the entie script from the beginning.
# Instead, we can use exit codes everyWhere to find out where our script failes.
