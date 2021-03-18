
To  :  Craig Castle

Copy:  Steve Wong

From:  James Wang

Subj:  Upgrade SUP to version 41.01

===========================================================

Craig,

    The two new SUPs are (CASGEN:37)NW2001.BND, NW2002.BND. Please schedule
for upgrading the two SUPs. The format of the the removable Disk
is different with the version 40. Followings are the steps you need to follow
in order to save the Disk data and format the Disk:

1. Pull out the removable Disk (Disk A).
2. Install a new Disk (Disk B). 
   Format the new Disk---Consult Datacraft on the FORMAT procedure
   (use Disk diagnostic)
   NOTE: FOR THIS ITEM, PRIME THE WRITE PROTECTION BOTTON FOR THE FIXED DISK!
3. Re-install the old removable Disk (A) into SUP node.
4. Erase Engine memory and boot from Disk.
5. Pull out the removable Disk (A) again.
6. Install the new removable Disk (B) one more time.
7. Use the Utility slot programme to re-format the removeable Disk (B) again.
8. Once done, erase Engine memory and put Engine in boot.
9. Load NW2001.BND, NW2002.BND from CASGEN:37.
10. Drink Foster!


Best regards,
James
 