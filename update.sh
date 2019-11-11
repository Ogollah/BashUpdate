#!/bin/bash

check_exist_status(){
    if[ $? -eq 0 ]
    then

            echo
            echo "Success"
            echo

    else
            echo
            echo "[Error] Process failed!"
            echo

            read -p "The last command exited with an error. exit script? (Y/N) " answer

        if [ "$answer" == "Y" ]
        then
            exit 1
        fi
    fi
}

update(){
    sudo apt-get update;
    check_exist_status

    sudo apt-get upgrade -y;
    check_exist_status

}

cleaning(){
    sudo apt-get autoremove -y;
    check_exist_status
    sudo apt-get autoclean -y;
    check_exist_status
    sudo updatedb;
    check_exist_status

}

out(){
    echo
    echo "--------------------"
    echo "-- Update Coplete!--"
    echo "--------------------"
    echo
    exit

}

update
cleaning
out
