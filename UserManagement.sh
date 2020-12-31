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
            echo 'Thanks for using this application'
            exit 0
            ;;
        
        *)
            echo 'WRONG CHOICE, Try Again'
    esac
done




