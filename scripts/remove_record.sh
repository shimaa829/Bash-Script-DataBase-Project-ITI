#!/usr/bin/bash 

tableName=$table_name

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

 removeRecord()
    {
    printf "\nEnter the pk value of the record you want to remove:\n"
    read pk_value 

    #Search to check if the selected pk_value exists
    typeset -i pk_field_number=$pk+1
     if [[ $(sed '1,9d' $tableName | cut -d " " -f $pk_field_number | grep -x $pk_value | sed '1!d') =  $pk_value ]]
				        then 
                        no_of_record=$(cut -d " " -f $pk_field_number $tableName | grep -xn $pk_value | cut -d: -f 1)
                        sed "$no_of_record"d $tableName > new_file
                        cat new_file > $tableName
	    			    rm new_file
    fi                   
    }
removeRecord