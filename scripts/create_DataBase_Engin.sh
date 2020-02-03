#!/bin/bash


#check if the dataBase server Directory exist

if [ -d ~/dataBase_Engin ]
then
     printf "\nAlready DataBase Engin is initialized\n"
     cd ~/dataBase_Engin
  
else

     mkdir ~/dataBase_Engin
     export PATH=$PATH:~dataBase_Engin

     printf "\nyour DataBase Engin initialize\n"
     cd ~/dataBase_Engin
  
fi

printf "\nTo create DataBase press 1 \nTo go back to main menu press 2 :\n\n"

 select choise in  "Create DataBase" "Go back to main menu"
                      
          do

               case $choise in 
                    
                         "Create DataBase")
                                   
                                   source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase.sh;;
                         
                         "Go back to main menu")

                                   source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh;;
                         *)
                         
                         printf "\n Please select dataBase option \n";;


               esac
          done