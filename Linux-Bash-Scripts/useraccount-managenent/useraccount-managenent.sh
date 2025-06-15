#Create users from file

while IFS= read -r username;
do
	echo "creating user:$username"
	sudo useradd -m -e 2025-06-16 "$username" #This command is used to create user with expiry date.

done < users.txt

#--------------------------------------------------
#Delete and Lock users

inactive=5
lock=3
user_list=$(awk -F: '$3 > 1000 {print $1}' /etc/passwd ) #This command shortlist users above UID 1000.
for users in $user_list #for loop
do
	last=$(lastlog -u $users | awk 'NR==2{print $4,$5,$6}') #This command shows last login of the user.
	lastlog=$(date -d "$last" +%s) #This command shows last login of user in seconds.
	todaylog=$(date +%s)
	diff=$(( (todaylog - lastlog) / 86400))
	if (( diff >= inactive ))
	then 
		echo "delete users in $users"
		sudo userdel -r "$users" #This command is used to delete user from the OS.
	elif (( diff >= lock ))
	then 
		echo "lock users in $users"
		sudo usermod -L "$users" #This command is used to lock user.
	else 
		echo "users in daily "$users" "
	fi

done

#------------------------------------------------------
#Create users with command line arguments

echo "creating users with command line arguments"
sudo useradd -m $1  #This command is used to create user with command line arguments.
sudo passwd $1 #This command is used to create password of the user.
sudo chage -E 2025-06-17 $1 #This command is used set expiry date of the user.
sudo passwd -e $1 #This command is used force password change of the user next login.
sudo usermod -aG sudo $1 #This command is used to add user to sudo group.

#------------------------------------------------------
#Create user with read command

echo "Creating users with read command"
echo "what is username"
read username
sudo useradd -m -g sudo -e 2025-06-30 $username
sudo chage -M 10 $username 
sudo chage -m 5 $username
sudo chage -W 3 $username 
