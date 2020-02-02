#!/bin/bash

source ~/Bash-Script-DataBase-Project-ITI/scripts/get_variables.sh
    
 source ~/Bash-Script-DataBase-Project-ITI/scripts/printTable.sh
 sed '1,8d' $table_name > temp_file
 printTable ' ' "$(cat temp_file)"



removeRecord()
{
	#printf "\nNote: the roecord you want to modify on it will be removed and i ask you to enter all values of this row again\n"
	printf "\nEnter the pk value of the record you want to remove:\n"
	read pk_value 

	#Search to check if the selected pk_value exists
	typeset -i pk_field_number=$pk+1
	if [[ $(sed '1,9d' $table_name | cut -d " " -f $pk_field_number | grep -x $pk_value | sed '1!d') =  $pk_value ]]
	then 
                                     
        number_of_record=$(cut -d " " -f $pk_field_number $table_name | grep -xn $pk_value | cut -d: -f 1)
		sed "$number_of_record"d $table_name > temp_file
		cat temp_file > $table_name
		rm temp_file
		
		printf "\nThe record which his Primary key  value is $pk_Value has been deleted\n"
                           
	else
                                 
		echo "The pk_value isn't exist,,please try again"

        removeRecord

    fi

}

removeRecord
