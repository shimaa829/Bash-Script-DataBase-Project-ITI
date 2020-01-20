#!/bin/bash


user_OPtions(){

        select choise in "initialize_dataBase_Engin" "Create DataBase" "Delete DataBase" "OPen DataBase" "View DataBases" "Create Table" "Dalete Table" "Table Modification" "Delete DataBase Engin" "Exit the program" 
          do

          case $choise in 
              
               "initialize_dataBase_Engin" )
                     
                             source ~/Bash-Script-DataBase-Project-ITI/create_DataBase_Engin.sh;;
                    
               "Create DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/create_DataBase.sh;;

               "Delete DataBase")
                              
                              source ~/Bash-Script-DataBase-Project-ITI/delete_DataBase.sh;;
                         
          
              "OPen DataBase")

                              source ~/Bash-Script-DataBase-Project-ITI/open_DataBase.sh;;

               "View DataBases")
                              source ~/Bash-Script-DataBase-Project-ITI/view_DataBases.sh;;

               "Create Table")
                      echo initialize;;

               "Dalete Table")
                          echo initialize;;
               "Table Modification" )
                            echo initialize;;

               "Delete DataBase Engin")
                             echo initialize;;

               "Exit the program" )
                                 echo initialize;;
                         
                              * )
                              echo "\n Please select option \n";;
          esac
          
          done

}





 #calling user_option function
  user_OPtions







