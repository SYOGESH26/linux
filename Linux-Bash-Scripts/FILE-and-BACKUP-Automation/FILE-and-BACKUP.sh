#In this I explain how to take backups of file.
#Automayion file backups.
#--------------------------------
#!/bin/bash
#--------------------------------

#Backup any folder to /tmp

echo "What is the path of folder you want to take backup ?"
read source
destination=/tmp/backup.tar
tar -cvf $source $destination  #tar command is used to take backup of a file or folder.

#Compare two directories

dir1=~/LINUX
dir2=~/AWS
echo "Comparing two directories"
diff -qr "$dir1" "$dir2"

#Find duplicate files.

echo "find duplicate files in / filesystem"
find / -type f -exec md5sum{} + | sort | -uniq -d -w32 #This command helps to find duplicate files

#Upload files to cloud.

aws s3 cp ~/LINUX/userautomation s3://ind-2025/ --recursive #This command helps to copy file from local folder to cloud.

#Find File larger than 10MB

find / -type f +10M #This command helps to find files large than 10Mb in / filesystem.

#Detect recent files changes 

find / -type f -mtime +7 #This command help to find last seven days modified files.

#Auto delete files

find / -type f -mtime +7 -exec rm -rf {} \
