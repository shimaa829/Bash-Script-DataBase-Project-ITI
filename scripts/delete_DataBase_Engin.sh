#!/bin/bash


#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    echo "Your DataBase Engin isn't initialized ,, to initialize new engin choose the first option:"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else
   
    # Go to home
    cd 

    # Remove dataBase engin
    rm -r dataBase_Engin

    echo "dataBase_Engin removed successfully"

fi
