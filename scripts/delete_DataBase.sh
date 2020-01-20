#!/bin/bash

path_of_dataBase=~/dataBase_Engin

echo "Enter the name of dataBase ?"
read name



#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
   echo "Your DataBase Engin isn't initialized ,, please choose the first option:"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else

  

   # cd "$path_of_dataBase"
   pwd
  
    #check if the dataBase_name Directory exist
    if [ -d "$name" ]
    then
    
        rm -r "$name"

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

        fi

    fi

fi

