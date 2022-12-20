#!/bin/bash
function backUp (){



#1. Create a directory to store the backups:

#mkdir ~/backupss

#2. Create a bash script to perform the backup:

  echo -n "Enter the file name: "
    read filename       


# Create a timestamp for the backup
TIMESTAMP=$(date +%Y-%m-%d)

mkdir ~/backupss/$TIMESTAMP
tar -czvf $filename.txt.tar.gz "$filename.txt"
# Set the source and destination directories
SOURCE=$filename.txt.tar.gz
DESTINATION="/home/abdallh/backupss/$TIMESTAMP"

# Create the backup
cp  $SOURCE $DESTINATION


}
function restore (){

  echo -n "Enter the file name: "
    read filename                        
    echo -n "Enter the time stamp: "
    read timestamp

SOURCE="/home/abdallh/backupss/$timestamp/$filename.txt.tar.gz"

DESTINATION="/home/abdallh/Downloads/forth year/operating system/$filename.txt.tar.gz"
rm "$filename.txt"
tar xvzf $filename.txt.tar.gz
echo "done -------------"

#1. Create a directory to store the backups:

#mkdir ~/backupss

#2. Create a bash script to perform the backup:




# Create a timestamp for the backup
#TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

#mkdir ~/backupss/$TIMESTAMP
#tar -czvf $1.tar.gz $1
# Set the source and destination directories
#SOURCE=$1.tar.gz
#DESTINATION="/home/abdallh/backupss/$TIMESTAMP"

# Create the backup
#cp  $SOURCE $DESTINATION


}


#3. Set up a cron job to run the script at a specified interval


# Set a cron job to run at a specific interval

# Set the interval (in minutes)
INTERVAL=60

# Set the command to be executed
COMMAND="echo 'This is a cron job running every $INTERVAL minutes'"

# Add the cron job to crontab
(crontab -l ; echo "*/$INTERVAL * * * * $COMMAND") | crontab -