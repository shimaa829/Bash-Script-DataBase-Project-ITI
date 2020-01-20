#!/bin/bash

#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    echo "Your DataBase Engin isn't initialized ,, please choose the first option:"
    source ~/Bash-Script-DataBase-Project-ITI/user_selection.sh

else
    
     cd ~/dataBase_Engin
     ls
     
     echo "If you want to go back the menu write : yes / no" 

     read answer

     if [ $answer="yes" ]
     then
       
       source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

     else
        
        echo "You must go back to choose any option"
     fi

fi
