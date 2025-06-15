#In this folder I explain about user management.

1.Create users from file.
 
  Commands used :

  * while IFS= read -r username
  * do
  * sudo useradd -m -e 2025-06-16 $username
  * done < users.txt

  Terms : 

  * sudo useradd -m -e 2025-06-16 $username create user with expiry date.

2.Delete and Lock users.

  commands used :

  * inactive=10
  * lock =5
  * users=$(awk -F: '$3 < 1000 {print $1} /etc/passwd)
  * for user in $users
  * do
  *   last=$(lastlog -u $user | awk 'NR==2{print $4,$5,$6}')
  *   lastlog=$(date -d "$last" +%s)
  *   todaylog=$(date +%s)
  *   diff=$(( (todaylog - lastlog) / 86400))
  *   if (( diff >= inactive ))
  *   then
  *       echo "delete user :$user" 
  *       sudo userdel -r "$user"
  *   elif (( diff >= lock ))
  *   then 
  *       echo "lock user : $user"
  *       sudo usermod -L $user
  *   else 
  *       echo "user are log in daily."
  *   fi
  * done

    Terms:

  * inactive,lock,users,last,lastlog,todaylog and diff are "variables" used to store data. 
  * userdel -r $user this command is used to delete user.
  * usermod -L $user this command is used to lock user.

3.Create users with command line arguments.

  commands used :

  * useradd -m $1
  * passwd $1
  * sudo chage -E 2025-06-17 $1
  * sudo passwd -e $1
  * sudo usermod -aG sudo $1

  Terms:

  * useradd -m $1 this command is used create user.
  * passwd $1 this command is used to set password.
  * sudo chage -E 2025-06-17 $1 this command to set expiry date of the user.
  * sudo passwd -e $1 this command is force user to change password at next login.
  * sudo usermod -aG sudo $1 this command is used to add user to group with deleting user from other groups.

4.Create user with read command.

  * read username
  * sudo useradd -m -g sudo -e 2025-06-30 $username
  * sudo chage -W 3 $username
  * sudo chage -M 10 $username
  * sudo chage -m 5 $username

  Terms:

  * sudo useradd -m -g sudo -e 2025-06-30 $username this command is used create user with expiry date and also user to sudo group.
  * read this command helps to store username in username variable. 
