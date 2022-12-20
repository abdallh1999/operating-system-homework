#!/bin/bash

function createDataBase(){
    # echo $1
    filename=$1
    
    #touch "$filename"
    
    #cat > "$filename"
    echo "version 1 $(whoami)" >> "$filename"
    
    
}
function openDataBase(){
    #   echo $1
    filename=$1
    
    #touch "$filename"
    
    #cat > "$filename"
    #  echo "version 1 $(whoami)" >> "$filename"
    
    
}

function addRecord() #addRecord to the file (database)
{
    
    
    echo -n "Enter the key: "
    read KEY
    if  grep -q -w "^$KEY" "$filename" ; then # check if the record exists
        echo "sorry it is already exists"
    else                                     # if not exists add the record 
        echo -n "Enter the VALUE: "
        read VALUE
        eVALUE=`echo -n $VALUE | base64`  #encode the value with base64 and store it in eVALUE
        LIEN="${KEY} : ${eVALUE} "        #combine the key and the value in one line
        echo $LIEN  >> "$filename"        # add the line to dataBase
        
        
    fi
    
}
function deleteRecord() # delete the record from the file
{
    
    
    echo -n "Enter the key: "
    read KEY
    sed -i "/$KEY/d" "$filename"  #delete the whole line that has the key
    
    
}
function searchRecord(){
    
    echo -n "Enter the key: "
    read KEY
    # grep the get the whole line that has the key
    # then pipe to cut and cut will take the line value
    # and store the result to var output
    output=$(grep -i --text "$KEY" "$filename" | cut -d ":" -f2)
    # deocde the result
    text=`echo $output | base64 --decode`
    # print the result decoded
    echo $text
    
}
function updateRecord(){
    
    
    echo -n "Enter the key: "
    read KEY
    sed -i "/$KEY/d" "$filename" # delete the whole line
    # store the key and the value in the file
    # afte decode the value
    echo -n "Enter the VALUE: "
    read VALUE
    eVALUE=`echo -n $VALUE | base64`
    LIEN="${KEY} : ${eVALUE} "
    echo $LIEN  >> "$filename"
    
}

