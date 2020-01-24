#!/bin/bash

#check if dataBase_Engin exist

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

        echo "Enter the dataBase_name of dataBase which you want to delete table from it :"
        read dataBase_name

        #check if the dataBase_dataBase_name Directory exist
        if [[ -d "$dataBase_name" ]]
        then
        
            cd $dataBase_name
            arr_tables=($(ls))

            #check if there are tables exist
            if [[ ${#arr_tables[@]} > 0 ]]
            then

                #Display all tables
                ls

                echo "Enter the table_name of table ?"
                read table_name

                #check if the table_name is exist
                if [[ -f $table_name ]]
                then

                    rm $table_name
                    echo "your table is deleted"

                else
                   
                    echo "This table name isn't exist ,, if you want to delete another table choose this option again"
                    source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

                    
                fi

            else
                
                echo "This dataBase is empty ,, if you want to create table in this dataBase choose #6 form menu:"
                 source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
             
            fi
        else
            
            echo "this dataBase isn't exist"

            echo  "Go back to menu? yes / no" 

            read answer

            if [ $answer = "yes" ]
            then

                source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
                
            else

                echo "Please select dataBase option"
                source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

            fi

        fi

    else
        
        echo "This DataBase Engin is empty ,, please create database first"
        source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

    fi

fi