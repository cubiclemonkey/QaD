# QaD
Quick &amp; Durty - DayZ Server Logfile String Search

This is the first public version of this collection of scripts. It does require some editing! Don't just plop it in and expect it to work.

I've commented in the file on what needs to be updated. Please read through the file!

This does rely on Powershell in the background! You may need to change your Powershell Execution Policy. (Powershell "Set-ExecutionPolicy RemoteSigned")

When you run this batch file it will look for a 'Reports' folder on your desktop and create it if it can't be found. That's where the results of your searches will be in .txt format.

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
