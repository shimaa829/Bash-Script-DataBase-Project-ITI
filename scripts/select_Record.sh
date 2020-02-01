#!/bin/bash


tableName=$table_name

#'2!d' ==> Prints the contents of Table; excepting all but the second line; to the standard output ( only the second line gets printed)
read pk <<< `sed '2!d' $tableName`
read -a arr_Of_dataTypes <<< `sed '5!d' $tableName`
read -a arr_Of_Columns  <<< `sed '9!d' $tableName`

printf "\nThe index of primary key column of the table is:\n $pk\n"
 
echo "The data types of each column   [Note : (1) => int ,, (2) => string] " 
echo ${arr_Of_dataTypes[@]}
echo " "

source ~/Bash-Script-DataBase-Project-ITI/scripts/printTable.sh
sed '1,8d' $tableName > temp_file

#calling printTable function
printTable ' ' "$(cat temp_file)"

selectRecord()
{
      #printf "\nNote: the roecord you want to modify on it will be removed and i ask you to enter all values of this row again\n"
      printf "\nEnter the pk value of the record you want to display:\n"
      read pk_value 

      #Search to check if the selected pk_value exists
      typeset -i pk_field_number=$pk+1
      if [[ $(sed '1,9d' $tableName | cut -d " " -f $pk_field_number | grep -x $pk_value | sed '1!d') =  $pk_value ]]
      then 
                                          
            no_of_record=$(cut -d " " -f $pk_field_number $tableName | grep -xn $pk_value | cut -d: -f 1)
            sed -n "$no_of_record"p $tableName > new_file
            printTable ' ' "$(cat new_file)"
            rm new_file


      else
                                          
            echo "The pk_value isn't exist,,please try again"
            selectRecord
      fi 

 }

 selectRecord

