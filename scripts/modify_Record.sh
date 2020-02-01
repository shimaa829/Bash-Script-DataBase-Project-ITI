#!/bin/bash

tableName=$table_name

#cat $tableName | awk 'BEGIN{OFS=":"}{print $0}' $tableName

#cat $tableName

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

modifyRecord()
{
 #printf "\nNote: the roecord you want to modify on it will be removed and i ask you to enter all values of this row again\n"
 printf "\nEnter the pk value of the record you want to modify:\n"
 read pk_value 

 #Search to check if the selected pk_value exists
 typeset -i pk_field_number=$pk+1
 if [[ $(sed '1,9d' $tableName | cut -d " " -f $pk_field_number | grep -x $pk_value | sed '1!d') =  $pk_value ]]
				   then 
                                     
                                       
                                       
                                       #printf "\nEnter the index number of field which you want to modify\n"
                                       #read number_of_field 
                                          
                                       #printf "\nEnter the new value you want to insert in the field\n"
                                       #read new_value
                                       
                                       
                                       #where $pk = $pk_value set $number_of_field = new_value
                                       
                                       #awk 'BEGIN{FS=" "};{if($pk == $pk_value) $number_of_field=$new_value }' $tableName | >> new.txt 
                                       #mv new ft
                                        

                                      #####################

                                       no_of_record=$(cut -d " " -f $pk_field_number $tableName | grep -xn $pk_value | cut -d: -f 1)
                                       sed "$no_of_record"d $tableName > new_file
                                       cat new_file > $tableName
				       rm new_file

                                      
                                       
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
                                       
                                       
                                         


                                   else
                                       
                                         echo "The pk_value isn't exist,,please try again"
                                         modifyRecord

                                    fi 



 }

 modifyRecord












#Create modify record function

#modifyRecord()
#{
 #   echo "modify"
    
    #Display all records of table and ask user to determine the record that he want to update
    # awk -F 'BEGIN{OFS=":"}{print valid;}' $tableName

    #echo $row
    #Prints the contents of table; excepting all but the second line; to the standard output ( only the second line gets printed)
    #read pk <<< `sed '1!d' $table_name`
    #read -a arr_Of_dataTypes <<< `sed '2!d' $table_name`
    #read -a arr_Of_Columns  <<< `sed '3!d' $table_name`

    


#}

#modifyRecord
