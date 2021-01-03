#! /bin/bash

# This is a sample usermanagement shell script
# This is developed as part of practice
# Use at your own risk
# This is the v1.0
#

# importing functions
. ./utility.sh


echo 'Welcom to User Management Application'
echo '......................................'
echo

add_user()
{
    if [ ! -e users.dat ]; then        
        touch users.dat
    fi
    echo
    echo 'Please provide details to add user'
    read -p 'First name : ' fname
    read -p 'Last name : ' lname
    read -p 'User id : ' uid
  
    count_function users.dat $uid
    count=$count_value
    echo "Count value is = $count"
    if [ $count -ne 0 ]; then
        echo
        echo "User id : $uid is already present and cannot be added."
        echo
        return 1
    fi

    read -s -p "Password : " pwd
    echo
    read -s -p "Retype password : " cpwd
    echo

    if [ $pwd != $cpwd ]; then
        echo
        echo
        echo "Passwords are not matching."
        echo
        return 2
    fi

    read -p "Zip code : " zipcode
    echo "$uid:$pwd:$fname:$lname:$zipcode" >> users.dat
    echo
    echo "User added successfully."
    echo
}

search_user()
{
    available='No'
    read -p "Enter user id : " uid
    count_function users.dat $uid
    count=$count_value

    if [ $count -eq 0 ]; then
        echo
        echo "User id : $uid does not exists. "
        echo "Try again..."
        echo
        return 3
    fi

    read -p "Enter password : " pwd
    count=$(cat users.dat | grep -w $uid | cut -d ":" -f 2 | grep -w $pwd | wc -l)
    
    if [ $count -eq 0 ]; then
        echo "Invalid password"
        echo "Try again..."
        echo
        return 4
    fi

    while read line
    do
        fuid=$( echo $line | cut -d ":" -f 1)
        fpwd=$( echo $line | cut -d ":" -f 2)

        if [ $uid = $fuid -a $pwd = $fpwd ]; then
            available="Yes"
            echo
            echo "The complete user info is : "
            echo "User id : $( echo $line | cut -d ":" -f 1 )"
            echo "Password : $( echo $line | cut -d ":" -f 2 )"
            echo "First name : $( echo $line | cut -d ":" -f 3 )"
            echo "Last name : $( echo $line | cut -d ":" -f 4 )"
            echo
            break
            
        fi
    done < users.dat
}

change_password()
{
    available="No"
    read -p "Enter user id : " uid
    count=$(cat users.dat | cut -d ":" -f 1 | grep -w $uid | wc -l)
    if [ $count -eq 0 ]; then
        echo "User id : $uid does not exists, Cannot change password."
        return 3
    fi

    read -p "Enter password : " pwd
    count=$(cat users.dat | grep -w $uid | cut -d ":" -f 2 | grep -w $pwd | wc -l)
    if [ $count -eq 0 ]; then
        echo "Invalid password, Cannot change password."
        return 4
    fi
    
    while read line
    do
        fuid=$( echo $line | cut -d ":" -f 1)
        fpwd=$( echo $line | cut -d ":" -f 2)

        if [ $uid = $fuid -a $pwd = $fpwd ]; then
            available="Yes"
            grep -v $line users.dat > temp.dat
            record=$line
            break            
        fi
    done < users.dat

    mv temp.dat users.dat

    read -p "Enter new password : " npwd
    uid=$( echo $record | cut -d ":" -f 1 )
    fname=$( echo $record | cut -d ":" -f 2 )
    lname=$( echo $record | cut -d ":" -f 3 )
    zipcode=$( echo $record | cut -d ":" -f 4 )

    echo "$uid:$npwd:$fname:$lname:$zipcode" >> users.dat
    echo "Password updated successfully"
}

show_all_user()
{
    echo "All users information :"
    echo ".........................."
    cat users.dat
    echo    
}

user_count()
{
    echo
    count=$( cat users.dat | wc -l)
    echo "The total number of users : $count."
    echo
}

while true
do
    echo '1. Add user'
    echo '2. Search user'
    echo '3. Change password'
    echo '4. Delete user'
    echo '5. Show all user'
    echo '6. User count'
    echo '7. Exit application'
    echo

    read -p 'Which operation? [1|2|3|4|5|6|7] : ' choice

    case $choice in
        1)
            add_user
            ;;
        
        2)
            search_user
            ;;
        
        3)
            change_password
            ;;
        
        4)
            delete_user
            ;;
        
        5)
            show_all_user
            ;;
        
        6)
            user_count
            ;;

        7)
            echo
            echo 'Thanks for using this application'
            echo
            exit 0
            ;;
        
        *)
            echo 'WRONG CHOICE, Try Again'
            echo
            echo '--------Please Try Again...--------------'
            echo
    esac
done




