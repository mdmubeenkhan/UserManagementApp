#! /bin/bash

# This is a sample usermanagement shell script
# This is developed as part of practice
# Use at your own risk
# This is the v1.0
#

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
    
    count=$(cat users.dat | cut -d ":" -f 1 | grep -w $uid | wc -l)

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




