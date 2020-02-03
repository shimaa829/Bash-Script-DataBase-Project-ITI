#!/bin/bash

path_of_dataBase=~/dataBase_Engin


#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    printf "\nYour DataBase Engin isn't initialized ,, please choose the first option:\n"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else

    cd ~/dataBase_Engin

    arr_dataBases=($(ls))

    #check if there are dataBases exist
    if [[ ${#arr_dataBases[@]} > 0 ]]
    then
        
       printf "\nAll available DataBases:\n"

       #Display all DataBases
       for i in $(ls -d *); 
       do
         echo ${i}; 
       done

        printf "\nEnter the dataBase_name of dataBase ?\n"
        read dataBase_name

        #check if the dataBase_dataBase_name Directory exist
        if [ -d "$dataBase_name" ]
        then
        
            rm -r "$dataBase_name"

            printf "\nYour DataBase is deleted\n"

        else
            
            printf "\nThis dataBase isn't exist\n"

            printf  "Go back to menu\n" 

            source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

        fi

    else
        
        printf "\nThis DataBase Engin is empty ,, please create database first"
        source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

    fi

fi

