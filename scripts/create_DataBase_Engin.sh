#!/bin/bash


#check if the dataBase server Directory exist

if [ -d ~/dataBase_Engin ]
then
     echo "\nAlready DataBase Engin is initialized\n"
     cd ~/dataBase_Engin
  
else

     mkdir ~/dataBase_Engin
     export PATH=$PATH:~dataBase_Engin

     echo "\nyour DataBase Engin initialize\n"
     cd ~/dataBase_Engin
  
fi

echo "\nTo create DataBase press 1 \n To go back to main menu press 2 :\n"

 select choise in  "Create DataBase" "Go back to main menu"
                      
          do

               case $choise in 
                    
                         "Create DataBase")
                                   
                                   source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase.sh;;
                         
                         "Go back to main menu")

                                   source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh;;
                         *)
                         
                         echo "\n Please select dataBase option \n";;


               esac
          done