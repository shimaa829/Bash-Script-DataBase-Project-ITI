#!/bin/bash

path_of_dataBase=~/dataBase_Engin


#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    echo "Your DataBase Engin isn't initialized ,, please choose the first option:"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else

    cd ~/dataBase_Engin

    arr_dataBases=($(ls))

    #check if there are dataBases exist
    if [[ ${#arr_dataBases[@]} > 0 ]]
    then
         
        #Display all DataBases
        ls

        echo "Enter the dataBase_name of dataBase ?"
        read dataBase_name

        #check if the dataBase_dataBase_name Directory exist
        if [ -d "$dataBase_name" ]
        then
        
            rm -r "$dataBase_name"

            echo "your DataBase is deleted"

        else
            
            echo "this dataBase isn't exist"

            echo  "Go back to menu? yes / no" 

            read answer

            if [ $answer = "yes" ]
            then

                source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
                
            else
                echo "Please select dataBase option"
                source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

            fi

        fi

    else
        
        echo "This DataBase Engin is empty ,, please create database first"
        source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

    fi

fi

