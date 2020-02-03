#!/bin/bash

source ~/Bash-Script-DataBase-Project-ITI/scripts/get_variables.sh

source ~/Bash-Script-DataBase-Project-ITI/scripts/printTable.sh
sed '1,8d' $table_name > temp_file

#calling printTable function
printTable ' ' "$(cat temp_file)"

selectRecord()
{    
      sed -n "9"p $table_name > new_file 

      printf "\nEnter the pk values of all records you want to display ,, each value separated by space and press enter after finish :\n"
      read -a pk_value 

      #Search to check if the selected pk_value exists
      typeset -i pk_field_number=$pk+1
      
      typeset -i i=0
      while [[ $i -lt ${#pk_value[@]} ]]
      do
            if [[ $(sed '1,9d' $table_name | cut -d " " -f $pk_field_number | grep -x ${pk_value[i]} | sed '1!d') =  ${pk_value[i]} ]]
            then 
                                              
                  no_of_record=$(cut -d " " -f $pk_field_number $table_name | grep -xn ${pk_value[i]}| cut -d: -f 1)
                  sed -n "$no_of_record"p $table_name >> new_file

            else
                                                
                  printf "\nThe pk_value isn't exist,,please try again\n"

                  #Calling selectRecord function itself [Recursion]
                  selectRecord
            fi 
            i=$i+1
      done
        
      printTable ' ' "$(cat new_file)"
      rm new_file


 }

#Calling selectRecord function
 selectRecord

