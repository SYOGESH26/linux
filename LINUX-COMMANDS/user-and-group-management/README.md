In this I explain user and group managements commands 

------------------------------------------------
User Management Commands:-
------------------------------------------------

1.To create user in the OS use following command:-
 
  * useradd user1 (It creates user)
  * useradd -m user1 (It creates user with home directory)
  * useradd -m -g group user1 (It creates user with home and user to the sudo group)
  * useradd -m -e 2025-6-30 user1 (It creates user with home directory with expiry data)

2.To view users use following command:

  * cat /etc/passwd (It lists all users with UID members)
  * users (It lists all user)

3.Password policy of the user:

  * sudo chage -M 10 user1 (Max days to change password)
  * sudo chage -m 5 user1 (Min days to change password)
  * sudo chage -W 7 user1 (Warms user to change password)
  * sudo passwd -e user1 (Force password change user in next login)

4.To lock and unlock users.

  * sudo usermod -L user1 (It locks user from all sides)
  * sudo usermod -U user1 (It unlocks user)
  * sudo passwd -l user1 (It locks user,but can enter with ssh)
  * sudo passwd -u user1 (It unlocks user)

5.Add user to groups.

  * sudo usermod -aG sudo user1 (It adds user to sudo group without removing from other groups)
  * sudo usermod -G sudo user1 (It adds user to sudo group but removes from other groups)

6.Change name of the user.

  * sudo usermod -l user2 user1

7.To know about the user.

  * finger username (It gives info the user1 but,we need to install finger)

8.To delete user

  * userdel user1 (It removes user)
  * userdel -r user1 (It removes user along directory)

------------------------------------------------
Group Management Commands:

1.To view all groups

  * /etc/group (It helps to view groups with GID)
  * getent groupname group (To know details of specific group)
  * groups 
  * id username (To get details from specific user)

2.To create and rename group

  * groupadd group1 (It creates group)
  * groupmod -n group2 group1 (Rename group)

3.To delete group

  * groupdel groupname

4.To edit groupfile.

  * vi /etc/group (It edits groups)
  * vigr (Shortcut fot vi /etc/group)

