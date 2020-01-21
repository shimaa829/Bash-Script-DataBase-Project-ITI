#!/bin/bash


path_of_dataBase="~/dataBase_Engin"


# create table

 create_table(){

     
     #create table to user
     touch "$dataBase_name/$table_name" 
    
     #Ask user to enter the columns of the table
     echo "Enter columns names sperated with a space"
     read -a arr-Of-Columns
     
     echo "Your table is created"

   
}


userChoise(){

        select choise in  "Create another table" "modify on table" "Go back to dataBase_Engin" 
          do

          case $choise in 

               "Create another table" )
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/create_Table.sh;;   
                              

               "modify on table")
                              
                             source ~/Bash-Script-DataBase-Project-ITI/scripts/modify_on_DataBase.sh;;
                         
   
               "Go back to dataBase_Engin" )

                             source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh;;
                         
                       * )
                              echo exit
                            #  break;
                              ;;
                 esac
          
          done

}



#Check if the DataBase Engin is initialized

if [[ ! -d ~/dataBase_Engin ]]
then
   
    echo "Your DataBase Engin isn't initialized ,, please choose the first option:"
    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
    

else
    
     
     cd ~/dataBase_Engin
     #declare -A arr-dataBase
     arr_dataBases=($(ls))

     #check if there are dataBases exist
     if [[ ${#arr_dataBases[@]} > 0 ]]
     then
         
       #Display all DataBases
       ls

       echo "Enter the name of dataBase ?"
       read dataBase_name 

               #check if the dataBase_name Directory exist
               if [[ -d "$dataBase_name" ]]
               then
                    
               
                    echo "Enter the name of table ?"
                    read table_name 

                    #Check the validation of the table name
                    if [[ $table_name =~ ^[a-zA-Z]+$ ]]
                    then 
                              #check if the table-name already exist
                              if [ -f "$dataBase_name/$table_name" ]
                              then
                                   
                                   echo "This table_name is  already exist"
                                   echo "do you want create another table or modify on this dataBase"

                                   #calling userChoise function
                                   userChoise 
                              
                              
                              else   
                                   
                                   #calling  create_table function
                                   create_table
                                   
                                   #calling userChoise function
                                   userChoise 


                              fi

                    else
                          echo "the table name must be string only ,,please try again"
                    fi          

               else

               echo "this dataBase_name isn't exist"

               echo "If you want to go back the main menu write : yes / no" 

               read answer

               if [[ $answer="yes" ]]
               then
                    
                         source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

               else
                    
                         echo "You must go back to choose any option"
               fi


               fi

     else
        
        echo "This DataBase Engin is empty ,, please create database first"
        source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

     fi

fi