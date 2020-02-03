#!/bin/bash

#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    printf "\nYour DataBase Engin isn't initialized ,, please choose the first option:\n"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else
    
     cd ~/dataBase_Engin
     printf "\nAll DataBases are : \n"

     #List all Databases
     for i in $(ls -d *); 
     do
      echo ${i}; 
     done
     
     
     printf "\nGo back to the main menu to select another option\n" 
 
     source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh


fi
