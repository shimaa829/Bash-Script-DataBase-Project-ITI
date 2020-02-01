#!/bin/bash

tableName=$table_name

#'2!d' ==> Prints the contents of Table; excepting all but the second line; to the standard output ( only the second line gets printed)
read pk <<< `sed '2!d' $tableName`
read -a arr_Of_dataTypes <<< `sed '5!d' $tableName`
read -a arr_Of_Columns  <<< `sed '9!d' $tableName`

echo "The index of primary key column of the table is: $pk"
echo " " 
echo "The data types of each column   [Note : (1) => int ,, (2) => string] " 
echo ${arr_Of_dataTypes[@]}
echo " "
echo "Columns and records of table :" 
echo ${arr_Of_Columns[@]}
echo " "


insertRecord()
{

        #Number of columns
        length_of_arr="${#arr_Of_Columns[@]}"


        echo "Insert the values of new record ,, please enter the values of fields with a valid data types"
        read -a values_Of_new_record


        #check the validation of each value (data type && pk)
        typeset -i i=0
        while [[ $i -lt $length_of_arr ]]
        do
            #case of integer data type
            if [[ ${arr_Of_dataTypes[i]} == 1 ]]  
            then
                
                    if ! [[ ${values_Of_new_record[i]} =~ ^[0-9]+$  ]]  
                    then

                            echo  "the value of ${arr_Of_Columns[i]} must be int ,,please try again"
                            insertRecord
                          
                     else
		                
                            #check if the column of this value is pk
		            if [[ $i == $pk ]]
		            then

		                  #`awk '{print $i , ${values_Of_new_record[i]} $tableName`

                                  #`awk '{if ( $i == ${values_Of_new_record[i]} ) print "Primary key value is exist please try again"}' $tableName`
                                  #search for pk value if it exits already or no
				  typeset -i pk_field_number=$i+1
                                  # -d(delimeter) ==> the delimeter between each field of the record ,, 
                                  # -f(field) ==> the field of pk we want to extract it to search in it to check if the value already exist or no
			          if [[ $(sed '1,9d' $tableName | cut -d " " -f $pk_field_number | grep -x ${values_Of_new_record[i]} | sed '1!d') =  ${values_Of_new_record[i]} ]]
				  then 
                                        printf "\nPrimary key value is already exist please try again\n"
                                        i=$i-1
                                                
                                        insertRecord
                                  fi
		                 
		            fi
        
                    fi

             #case of string data type
            elif [[ ${arr_Of_dataTypes[i]} == 2 ]]   
            then
                    if ! [[ ${values_Of_new_record[i]} =~ ^[a-zA-Z]+$  ]]
                    then

                        echo  "the value of ${arr_Of_Columns[i]} must be string,,please try again"
                        insertRecord 
                 
                    else
                            #check if the column of this value is pk
		            if [[ $i == $pk ]]
		            then

		                  #`awk '{if ( $i == ${values_Of_new_record[i]} ) print "Primary key value is exist please try again"}' $tableName`
		                   #search for pk value if it exits already or no
				   typeset -i pk_field_number=$i+1
			           if [[ $(sed '1,9d' $tableName | cut -d " " -f $pk_field_number | grep -x ${values_Of_new_record[i]} | sed '1!d') =  ${values_Of_new_record[i]} ]]
				   then 
                                        printf "\nPrimary key value is already exist please try again\n"
                                        i=$i-1
                                        insertRecord
                                   fi
		                 
		            fi

                    fi

            else
            
                    echo "please insert the values again,,"
                    insertRecord
            fi

        i=$i+1
        done

}

insertRecord

echo  "${values_Of_new_record[@]}" >> $table_name
echo "new record is added successfully"

