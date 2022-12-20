#!/bin/bash

SCRIPT_PATH='DataBase.sh'
source "$SCRIPT_PATH"
SCRIPT_PATH1='comp.sh'
source "$SCRIPT_PATH1"

fileName=$1   #first arg
fileTxt="$1.txt" #assign frist_arg.txt to var

if [ "$1" == "--create" ]; then  # check if the first arg is --create

      fileTxt="$2.txt"          #assign the 2nd_arg.txt to var becuase the first
                                # is --create and the second is the file name

      if [[ ! -e "$(pwd)/${fileTxt}" ]]; then  #chech if the file does not exists
      touch "${fileTxt}"                       #create the file (dataBase)
      fi
  createDataBase $fileTxt                     # then call the fun createDataBase

else   
      openDataBase $fileTxt                  #else the file exists and open the file
fi
while true
do
    echo "Q1 ($fileTxt):"
    echo "Would you like to:"
    echo "1) Add new record"
    echo "2) Delete a record" 
    echo "3) Search for a record"
    echo "4) Update a record"
    echo "5) Quit"
  #  echo "6) backup"
  #  echo "7) restore"

    

    echo -n ">> "
    read case

    case "$case" in
        1) addRecord;;
        2) deleteRecord;;
        3) searchRecord;;
	    4) updateRecord;;
	    5) break;;
       # 6)backUp  ;;
       # 7)restore ;;

    esac
done

echo "Quit"
