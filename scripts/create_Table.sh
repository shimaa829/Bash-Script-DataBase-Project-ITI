#!/bin/bash

path_of_dataBase="~/dataBase_Engin"


# create table

 create_table(){

     
     #create table to user
     touch $table_name 
    
     #Ask user to enter the fields of the table
     echo "Enter columns names sperated with a space"
     read -a arr_Of_Columns
     
     #Number of colums
     length_of_arr="${#arr_Of_Columns[@]}"
     
     #declar array of data type 
     typeset -a arr_dataType[$length_of_arr]

     typeset -i i=0
     while [ $i -lt $length_of_arr ]
     do

        echo "for ${arr_Of_Columns[$i]} field determin the dataType of this field: "
        
        #choose the data type of fields
        select data_type in int string 
        do
          case $data_type in

               int)
                    arr_dataType[$i]=int
                    break;
                    ;;
               
               string)
                    arr_dataType[$i]=string
                    break;
                    ;;
               *)
                    echo "please enter the data_type of field"
                    ;;

          esac
        done
        
        i=$i+1
     done
     
     #echo ${arr_dataType[@]} >> $table_name
     
     echo ${arr_Of_Columns[@]} >> $table_name

     echo "Your table is created"

   
}


userChoise(){

        select choise in  "Create another table" "Update on table" "Go back to main Menu" 
          do

          case $choise in 

               "Create another table" )
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/create_Table.sh;;   
                              

               "Update on table")
                              
                             source ~/Bash-Script-DataBase-Project-ITI/scripts/modify_on_DataBase.sh;;
                         
   
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
   
     echo "Your DataBase Engin isn't initialized ,, please choose the first option:"
     source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
    

else
    
     
     cd ~/dataBase_Engin
   
     arr_dataBases=($(ls))

     #check if there are dataBases exist
     if [[ ${#arr_dataBases[@]} > 0 ]]
     then
         
       #Display all DataBases
       ls

       echo "Enter the name of dataBase ?"
       read dataBase_name 

       pwd
               #check if the dataBase_name Directory exist
               if [[ -d $dataBase_name ]]
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
                                   cd $dataBase_name
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