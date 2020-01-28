#!/bin/bash

tableName=$table_name

#Create modify record function

modifyRecord()
{
    echo "modify"
    
    #Display all records of table and ask user to determine the record that he want to update
     awk -F 'BEGIN{OFS=":"}{print valid;}' $tableName

    #echo $row
    #Prints the contents of table; excepting all but the second line; to the standard output ( only the second line gets printed)
    #read pk <<< `sed '1!d' $table_name`

    #read -a arr_Of_dataTypes <<< `sed '2!d' $table_name`

    #read -a arr_Of_Columns  <<< `sed '3!d' $table_name`

    


}

modifyRecord
