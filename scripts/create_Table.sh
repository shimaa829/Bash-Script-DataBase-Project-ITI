#!/bin/bash

path_of_dataBase="~/dataBase_Engin"

# create table function

 create_table(){

     
     #create table to user
     touch "$table_name" 
    
     #Ask user to enter the fields of the table
     printf "\nEnter columns names sperated with a space\n"
     read -a arr_Of_Columns
     
     #Number of colums
     length_of_arr="${#arr_Of_Columns[@]}"
     
     #declar array of data type 
     typeset -a arr_dataType[$length_of_arr]

     typeset -i i=0
     while [[ $i -lt $length_of_arr ]]
     do

        printf "\nfor ${arr_Of_Columns[$i]} field determin the dataType of this field: "
        
        #choose the data type of fields
        select data_type in int string 
        do
          case $data_type in

               int)
                    arr_dataType[$i]=1
                    break;
                    ;;
               
               string)
                    arr_dataType[$i]=2
                    break;
                    ;;
               *)
                    printf "\n!!please enter the data_type of field!!\n"
                    ;;

          esac
        done
        
        i=$i+1
     done
     

     #function to ask user to determine the primary Key of the table
     getPk(){
          #create a while loop to continue ask user to enter pk until enter avalid pk name then break
          while [ true ]
          do
          
          #Display all columns of table to user
          printf "Your table columns are :\n"
          echo "${arr_Of_Columns[@]}"

          printf "\nEnter your PK column index number\n"
          read pk
               
               #Check validation of pk index number
               if [[ $pk =~ ^[0-9]+$ ]]
               then
                    
                    if [[ $pk -lt $length_of_arr ]]
                    then
          
                              echo " The index of Your primary key column  is:" >> $table_name   #line_1
                              echo $pk >> $table_name    #line_2
                              break;
                         
                    fi
               else 
                    printf "\n$pk  index column is not exist ,, try again please!\n"

                    #Calling getPk function [Recursion]
                    getPk
               fi
               

          done
     }

     #Calling getPK function
     getPk

     echo " " >> $table_name #line_3
     echo "The data types of each column " >> $table_name #line_4
     echo ${arr_dataType[@]} >> $table_name #line_5
     echo "Note : (1) => int ,, (2) => string " >> $table_name #line_6
     echo " " >> $table_name   #line_7
     echo " " >> $table_name #line_8 
     echo ${arr_Of_Columns[@]} >> $table_name     #line_9

     printf "\nYour table is created successfully\n\n"

   
}

# userChoise function
userChoise(){

        select choise in  "Create another table" "Update on table" "Go back to main Menu" 
          do

          case $choise in 

               "Create another table" )
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/create_Table.sh;;   
                              

               "Update on table")
                              
                             source ~/Bash-Script-DataBase-Project-ITI/scripts/modify_on_Table.sh;;
                         
   
               "Go back to main Menu" )

                             source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh;;
                         
                       * )
                              echo exit
                             break;
                              ;;
                 esac
          
          done

}



#Check if the DataBase Engin is initialized

if [[ ! -d ~/dataBase_Engin ]]
then
   
     printf "\nYour DataBase Engin isn't initialized ,, please choose the first option:"
     source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
    

else
    
     
     cd ~/dataBase_Engin
   
     arr_dataBases=($(ls))

     #check if there are dataBases exist
     if [[ ${#arr_dataBases[@]} > 0 ]]
     then

       printf "\nAll available dataBases :\n"

       #Display all DataBases
       for i in $(ls -d *); 
       do
         echo ${i}; 
       done

       printf "\nEnter the name of dataBase ?\n"
       read dataBase_name 
       printf "\n"
      
               #check if the dataBase_name Directory exist
               if [[ -d $dataBase_name ]]
               then
                    
               
                    printf "\nEnter the name of table ?\n"
                    read table_name 

                    #Check the validation of the table name
                    if [[ $table_name =~ ^[a-zA-Z]+$ ]]
                    then 
                              #check if the table-name already exist
                              if [ -f "$dataBase_name/$table_name" ]
                              then
                                   
                                   printf "\nThis table_name is  already exist"
                                   printf "\nDo you want create another table or modify on this dataBase?\n"

                                   #calling userChoise function
                                   userChoise 
                              
                              
                              else   
                                   cd $dataBase_name
                                   #calling  create_table function
                                   create_table
                                   
                                   #calling userChoise function
                                   userChoise 


                              fi

                    else
                          printf "\nthe table name must be string only ,,please try again\n"
                    fi          

               else
                    
                    printf "\nThis dataBase-name isn't exist\n"

                    printf  "Go back to menu\n" 

                    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh


               fi

     else
        
          printf "\nThis DataBase Engin is empty ,, please create database first"
          source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

     fi

fi
