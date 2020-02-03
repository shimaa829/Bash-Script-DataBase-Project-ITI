#!/bin/bash


#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    printf "\nYour DataBase Engin isn't initialized ,, to initialize new engin choose the first option:\n"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else
   
    # Go to home
    cd 

    # Remove dataBase engin
    rm -r dataBase_Engin

    printf "\nDataBase_Engin removed successfully\n"

fi
