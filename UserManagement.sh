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
    esac
done




