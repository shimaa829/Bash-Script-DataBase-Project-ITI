#!/bin/bash


source ~/Bash-Script-DataBase-Project-ITI/scripts/get_variables.sh

#Display the content of table
source ~/Bash-Script-DataBase-Project-ITI/scripts/printTable.sh
sed '1,8d' $table_name > temp_file

#calling printTable function
printTable ' ' "$(cat temp_file)"

modifyRecord()
{
                printf "\nNote: the roecord you want to modify on it will be removed and i ask you to enter all values of this row again with modified value\n"
                printf "\nEnter the pk value of the record you want to modify:\n"
                read pk_value 

                #Search to check if the selected pk_value exists
                typeset -i pk_field_number=$pk+1
                if [[ $(sed '1,9d' $table_name | cut -d " " -f $pk_field_number | grep -x $pk_value | sed '1!d') =  $pk_value ]]
                then 
                
                        no_of_record=$(cut -d " " -f $pk_field_number $table_name | grep -xn $pk_value | cut -d: -f 1)
                        sed "$no_of_record"d $table_name > new_file
                        cat new_file > $table_name
                        rm new_file

                        #Ask user to insert the modified record again
                        insertRecord()
                                {
                                        #Number of columns
                                        length_of_arr="${#arr_Of_Columns[@]}"


                                        printf "\nInsert the values of the record that you want to modify on it again with modified value,, please enter the values of fields with a valid data types\n"
                                        read -a values_of_modified_record


                                        #check the validation of each value (data type && pk)
                                        typeset -i i=0
                                        while [[ $i -lt $length_of_arr ]]
                                        do
                                        #case of integer data type
                                        if [[ ${arr_Of_dataTypes[i]} == 1 ]]  
                                        then
                                                
                                                if ! [[ ${values_of_modified_record[i]} =~ ^[0-9]+$  ]]  
                                                then

                                                        printf  "\nThe value of ${arr_Of_Columns[i]} must be int ,,please try again"

                                                        #function calls itself [Recursion]
                                                        insertRecord
                                                        
                                                else
                                                                
                                                        #check if the column of this value is pk
                                                        if [[ $i == $pk ]]
                                                        then

                                                                #search for pk value if it exits already or no
                                                                typeset -i pk_field_number=$i+1

                                                                # -d(delimeter) ==> the delimeter between each field of the record ,, 
                                                                # -f(field) ==> the field of pk we want to extract it to search in it to check if the value already exist or no
                                                                if [[ $(sed '1,9d' $table_name | cut -d " " -f $pk_field_number | grep -x ${values_of_modified_record[i]} | sed '1!d') =  ${values_of_modified_record[i]} ]]
                                                                then 
                                                                        printf "\nPrimary key value is already exist please try again\n"
                                                                        i=$i-1

                                                                        #function calls itself [Recursion]       
                                                                        insertRecord
                                                                fi
                                                                
                                                        fi
                                        
                                                fi

                                        #case of string data type
                                        elif [[ ${arr_Of_dataTypes[i]} == 2 ]]   
                                        then
                                                if ! [[ ${values_of_modified_record[i]} =~ ^[a-zA-Z]+$  ]]
                                                then

                                                        printf  "\nThe value of ${arr_Of_Columns[i]} must be string,,please try again\n"

                                                        #function calls itself [Recursion]
                                                        insertRecord 
                                                
                                                else
                                                        #check if the column of this value is pk
                                                        if [[ $i == $pk ]]
                                                        then

                                                                
                                                                #search for pk value if it exits already or no
                                                                typeset -i pk_field_number=$i+1
                                                                if [[ $(sed '1,9d' $table_name | cut -d " " -f $pk_field_number | grep -x ${values_of_modified_record[i]} | sed '1!d') =  ${values_of_modified_record[i]} ]]
                                                                then 
                                                                        printf "\nPrimary key value is already exist please try again\n"
                                                                        i=$i-1
                                                                        
                                                                        #function calls itself [Recursion]
                                                                        insertRecord
                                                                fi
                                                                
                                                        fi

                                                fi

                                        else
                                        
                                                printf "\nPlease insert the values again,,\n"
                                                #function calls itself [Recursion]
                                                insertRecord
                                        fi

                                        i=$i+1
                                        done

                                }

                                insertRecord

                                echo  "${values_of_modified_record[@]}" >> $table_name
                                printf "\nThe record is modified and added successfully\n"
                  
                else
                                                
                        printf "\nThe pk_value isn't exist,,please try again\n"
                        #function calls itself [Recursion]
                        modifyRecord

                fi 



 }

#Calling modifyRecord function
 modifyRecord

