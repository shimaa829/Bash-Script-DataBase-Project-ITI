#!/bin/bash


user_OPtions(){

        select choise in "initialize_dataBase_Engin" "Create DataBase" "Delete DataBase" "OPen DataBase" "View DataBases" "Create Table" "Delete Table" "Table Modification" "Delete DataBase Engin" "Exit the program" 
          do

          case $choise in 
              
               "initialize_dataBase_Engin" )
                     
                             source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase_Engin.sh;;
                    
               "Create DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase.sh;;

               "Delete DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/delete_DataBase.sh;;
                         
          
              "OPen DataBase")

                              source ~/Bash-Script-DataBase-Project-ITI/scripts/open_DataBase.sh;;

               "View DataBases")
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/view_DataBases.sh;;

               "Create Table")
                               source ~/Bash-Script-DataBase-Project-ITI/scripts/create_Table.sh;;

               "Delete Table")
                              echo "delete table";;
               "Table Modification" )
                              echo "modify table";;

               "Delete DataBase Engin")
                              echo "delete DataBase Engin";;

               "Exit the program" )
                              echo "exit program";;
                         
                              * )
                              echo "\n Please select option \n";;
          esac
          
          done

}





 #calling user_option function
  user_OPtions







