#! /bin/bash

# This file contains utility functions
# It takes parameter and gives the output
#

count_function()
{
    echo "Count function in utility is called"
    count_value=$(cat users.dat | cut -d ":" -f 1 | grep -w $uid | wc -l)
    
}