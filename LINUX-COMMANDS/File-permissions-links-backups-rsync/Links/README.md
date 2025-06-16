In this I explain about links

Links are two types:-

* Hardlink
* Softlink
--------------------------------
Hardlink
--------------------------------
* Hardlink are help to create backup of the file
 
  ln originalname hardlinkname

  * Hardlink cannot delete until we delete last file.
  * It shares same inode and space.
  * If we modify one file automatically modified file also changes.

* For deleting Hardlink use following command:

  rm filename.txt

-----------------------------
Softlink
-----------------------------
* Softlink is used just for shortcut of the file.

  ln -s originalname hardlinkname

  * softlinks used just for shortcut.
  * softlinks before filename see 'l' indicate, It is a link.
  * If we delete original file softlink is just wastelink.
  * We cannot open file 

* For deleting Softlink use following command:

  rm filename.txt
