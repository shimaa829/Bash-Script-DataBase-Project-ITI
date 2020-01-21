#!/bin/bash

path_of_dataBase="~/dataBase_Engin"


echo "Enter the name of dataBase ?"
read dataBase_name 

# create dataBase function

 create_dataBase(){


     #create database to user
     mkdir "$dataBase_name"

     echo "Your dataBase is created"
     
}


userChoise(){

        select choise in  "Create another DataBase" "OPen DataBase" "Go back to main menu" 
          do

          case $choise in 

               "Create another DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/create_DataBase.sh;;   
                              

               "OPen DataBase")
                              
                            source ~/Bash-Script-DataBase-Project-ITI/open_DataBase.sh;;
                         
   
               "Go back to main menu" )

                          source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
                          ;;
                         
                       * )
                              echo "\n Please select dataBase option \n";;
          esac
          
          done

}



#Check if the DataBase Engin is initialized

if [ ! -d ~/dataBase_Engin ]
then
   
    echo "Your DataBase Engin isn't initialized ,, please choose the first option:"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
    

else
    
     #check if the dataBase_name Directory exist
     if [ -d "$dataBase_name" ]
     then
         
          echo "This dataBase_name is already exist"
          echo "If you want create another dataBase or open this dataBase choose one option :"

          #calling userChoise function
          userChoise 
     
     
     else   
     
          #calling  create_dataBase function
          create_dataBase
     
          #calling userChoise function
          userChoise 


     fi



fi
