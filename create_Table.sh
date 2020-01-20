#!/bin/bash


path_of_table="/home/$USER/dataBaseEngin/$1"

# Note: '$1 is the name of dataBase'

echo "Enter the name of table ?"
read table_name 


# create table

 create_table(){
 
     #create create to user
     touch "$path_of_table/$table_name" 

     echo "Your table is created"

     
     
}


userChoise(){

        select choise in  "Create another table" "modify on table" "Go back to dataBase_Engin" 
          do

          case $choise in 

               "Create another table" )
                              
                              source ~/Bash-Script-DataBase-Project-ITI/create_Table.sh;;   
                              

               "modify on table")
                              
                             source ~/Bash-Script-DataBase-Project-ITI/modify_on_DataBase.sh;;
                         
   
               "Go back to dataBase_Engin" )

                             source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh;;
                         
                       * )
                              echo exit;;
          esac
          
          done

}

#check if the dataBase_name Directory exist

if [ -f "$path_of_table/$table_name" ]
then
     
     
     echo "this dataBase_name is exist"
     echo "do you want create another table or modify on this dataBase"

     #calling
     userChoise 
   
  
else   
 
     #calling function
     create_table
    
     #calling
     userChoise 


fi

