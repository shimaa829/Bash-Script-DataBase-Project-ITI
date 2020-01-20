#!/bin/bash

path_of_dataBase="/home/$USER/dataBaseEngin"

echo "Enter the name of dataBase?"
read dataBase_name 


#open dataBase

open_dataBase(){
    
        cd "/home/$USER/dataBaseEngin/$dataBase_name"

        select choise in "Create Table" "Delete Table" "modify on Table"
          do

          case $choise in 

               "Create Table")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/create_Table.sh  $dataBase_name;;

               "Delete Table")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/delete_Table.sh;;
                         
          
              "modify on Table")

                              source ~/Bash-Script-DataBase-Project-ITI/modify_on_Table.sh;;
                         
                              * )
                              echo exit;;
          esac
          
          done

}







#check if the dataBase_name Directory exist

if [ -d "$path_of_dataBase/$dataBase_name" ]
then
     
      
       #calling the fuction
       open_dataBase
   
  
else   
 

    echo "this dataBase_name isn't exist" 
      
    echo "do you want create a new database? yes / no"

    read answer
    if [ $answer = "yes" ]
    then
       source ~/Bash-Script-DataBase-Project-ITI/create_DataBase.sh
    else
       source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
    fi
    
fi


#calling the fuction
open_dataBase