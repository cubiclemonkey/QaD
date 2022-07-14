# quad
Quick &amp; Dirty - DayZ Server Log Search

This is the first public version of this collection of scripts. It does require some editing! Don't just plop it in and expect it to work.

I've commented in the file on what needs to be updated. Please read through the file!

This does rely on Powershell in the background! You may need to change your Powershell Execution Policy. (Powershell "Set-ExecutionPolicy RemoteSigned")

When you run this batch file it will look for a 'Reports' folder on your desktop and create it if it can't be found. That's where the results of your searches will be in .txt format.

<<<<<<< HEAD
I've had more than a few questions about why this is written in batch/powershell.

My main goal is giving Admins something that will work out of the box.

Nothing to install, no extra packages needed -- nothing superfluous.

Just a simple log search and you can poke at it if you want to. 
=======
The best place to keep this file is on your Desktop. Once the folder locations are set it will know where to go to find what you're looking for.

<code>
REM ### DayZ Server Folder
  
set dayzrootloc=NOTSET
</code>

Paste the top level folder of your DayZ server after the '='

Example:
<code>
  set dayzrootloc=C:\DayZ\server
</code>

The next version will not require editing the file.
>>>>>>> 8f5e53d4fc10e2a136dc875c41f6027ce90c3f6e
