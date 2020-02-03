#!/bin/bash

path_of_dataBase=~/dataBase_Engin

# create dataBase function

 create_dataBase(){


     #create database to user
     mkdir "$dataBase_name"

     printf "\nYour dataBase is created \n"
     
}


userChoise(){

        select choise in  "Create another DataBase" "OPen DataBase" "Go back to main menu" 
          do

          case $choise in 

               "Create another DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase.sh;;   
                              

               "OPen DataBase")
                              
                            source ~/Bash-Script-DataBase-Project-ITI/scripts/open_DataBase.sh;;
                         
   
               "Go back to main menu" )

                          source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
                          ;;
                         
                       * )
                              printf "\n Please select dataBase option \n";;
          esac
          
          done

}



#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
     printf "\nYour DataBase Engin isn't initialized ,, please choose the first option:\n"
     source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

else
    
     
     printf "\nEnter the name of dataBase ?\n"
     read dataBase_name 

     cd "$path_of_dataBase"
     #check if the dataBase_name Directory exist
     if [ -d "$dataBase_name" ]
     then
         
          printf "\nThis dataBase_name is already exist\n"
          printf "If you want create another dataBase or open this dataBase choose one option :\n"

          #calling userChoise function
          userChoise 
     
     
     else   
     
          #calling  create_dataBase function
          create_dataBase
     
          #calling userChoise function
          userChoise 


     fi



fi
