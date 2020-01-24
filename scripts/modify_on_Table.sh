#!/bin/bash



userChoise(){

            select modify_option in "Insert_record" "Modify_record" "Delete_record" "Display_table" "Delete_table" 
            do
            
            case $modify_option in

                  "Insert_record")

                        echo "insert record";;
                  
                  "Modify_record")

                        echo "update record";;

                  "Delete_record")

                        echo "Remove record";;

                  "Display_table")

                        echo " display all data";;

                  "Delete_table")
                        
                        source ~/Bash-Script-DataBase-Project-ITI/scripts/delete_Table.sh;;
                        
                        *)

                        echo "Go back to main menu"
                        source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
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
                              #calling the function
                              userChoise

                        else
                              
                              echo "This table name isn't exist ,, if you want to delete another table choose this option again"
                              source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh

                              
                        fi

                  else
                  
                  echo "This dataBase is empty ,, if you want to create table in this dataBase choose #6 form menu:"
                  source ~/Bash-Script-DataBase-Project-ITI/dataBase_Options.sh
                  
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