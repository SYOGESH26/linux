In this I explain about File permission and change owners

---------------------------------------------------
File Permission
---------------------------------------------------
1.Can set file permission in two ways

  * Numeric method:

    chmod 777 filename.txt
    
    It means all users,owners and groups can have read, write and execute permissions how,
 
    7=4+2+1,means

    4=read,
    2=write,
    1=execte.
 
    same way can set to all users,owners and groups 

  * Alphabatic method:

  chmod a=rwx filename.txt

  a=all,
  r=read,
  w=write,
  x=execute,
  u=user,
  o=owner,
  g=group.
 
  chmod o=rwx filename.txt (Only owner have the permissions) 

3.Change owner and Change group.

 * chown user1:user1 filename.txt (It changes both owner and group of the file)
 * chgrp user1 filename.txt (It changes group of the file)


