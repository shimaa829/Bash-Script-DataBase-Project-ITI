#!/bin/bash

   select choise in "initialize_dataBase_Engin" "Create DataBase" "Delete DataBase" "OPen DataBase" "View DataBases" "Create Table" "Table Modifications" "Delete DataBase Engin" "Exit the program" 
          do

          case $choise in 
              
              "initialize_dataBase_Engin" )
                     
                             source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase_Engin.sh;;#done
                    
              "Create DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/create_DataBase.sh;;#done

              "Delete DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/scripts/delete_DataBase.sh;;#done
                         
          
              "OPen DataBase")

                              source ~/Bash-Script-DataBase-Project-ITI/scripts/open_DataBase.sh;;

               "View DataBases")

                              source ~/Bash-Script-DataBase-Project-ITI/scripts/view_DataBases.sh;;#done

               "Create Table")

                               source ~/Bash-Script-DataBase-Project-ITI/scripts/create_Table.sh;;#done 

               "Table Modifications" )

                              source ~/Bash-Script-DataBase-Project-ITI/scripts/modify_on_Table.sh;;#insert new record script done

               "Delete DataBase Engin")

                              source ~/Bash-Script-DataBase-Project-ITI/scripts/delete_DataBase_Engin.sh  #done  
                              break;
                              ;;                          

               "Exit the program" )
                             
                              exit ;;
                         
                              * )
                              echo "\n Please select option \n";;

          esac
          
          done








