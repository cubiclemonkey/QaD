@echo off
:TOPTOP
TITLE Quick ^& Durty LogSifter
echo.
echo  ### Select a folder to search through
echo.
echo  A. C:\Servers\Dayz-New\servers\0\logs
echo.
echo  B. C:\Servers\Dayz-New\servers\0\profiles\CommunityOnlineTools\Logs
echo.
echo  C. C:\Servers\Dayz-New\servers\0\profiles\CodeLock\Logs\
echo.
echo  D. C:\Servers\Dayz-New\servers\0\logs (Player Damage Only)
set reportsfolder=%userprofile%\Desktop\Reports\
IF NOT EXIST "%userprofile%\Desktop\Reports\" mkdir "%userprofile%\Desktop\Reports\"
echo.
set /p whatarewedoingboss= Select an option: 
echo.
IF /I %whatarewedoingboss%==A GOTO CONSOLE
IF /I %whatarewedoingboss%==B GOTO COT
IF /I %whatarewedoingboss%==C GOTO CODEL
IF /I %whatarewedoingboss%==D GOTO PLDMG
echo.
echo  A, B, C, or D - those are your options. :/
echo.
PAUSE
CLS
GOTO TOPTOP
:CONSOLE
CLS
echo.
echo  ### Console
set searchedin=console
REM ### Update the folder location for your server logs
set workingfolder=C:\Servers\Dayz-New\servers\0\logs
echo.
set /p stringonea= Search for: 
echo.
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern "%stringonea%" > '%reportsfolder%\%searchedin%-%stringonea%.txt'"
echo Filtering by "%stringonea%" . . .
GOTO ENDING
:COT
CLS
echo.
echo  ### CommunityTools
echo.
set searchedin=community
REM ### Update the folder location for your server logs
set workingfolder=C:\Servers\Dayz-New\servers\0\profiles\CommunityOnlineTools\Logs
echo  # Paste SteamID for your desired player below
echo.
set /p stringoneb= SteamID: 
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern "%stringoneb%" > '%reportsfolder%\%searchedin%-%stringoneb%.txt'"
echo Filtering by "%stringoneb%" . . .
echo.
GOTO ENDING
:CODEL
CLS
echo.
echo  ### CodeLocks
echo.
set searchedin=codelocks
REM ### Update the folder location for your server logs
set workingfolder=C:\Servers\Dayz-New\servers\0\profiles\CodeLock\Logs\
echo  # Search by playername, action ('raiding', 'accessed', 'attached'), or SteamID
echo.
set /p stringonec= Paste or type string here: 
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern "%stringonec%" > '%reportsfolder%\%searchedin%-%stringonec%.txt'"
echo Filtering by "%stringonec%" . . .
echo. 
GOTO ENDING
:PLDMG
CLS
echo.
echo  ### Player Damage
set searchedin=player-damage
REM ### Update the folder location for your server logs
set workingfolder=C:\Servers\Dayz-New\servers\0\logs
echo  # Possible search strings:
echo.
echo  1. (DEAD) - To find where/when player died
echo  2. hit by playername - To see where/when a player attacked another
echo  3. unconscious - To find where/when a player is unconscious
echo.
set /p stringonea= Search for: 
echo.
Powershell "Get-ChildItem -Path '%workingfolder%\*.ADM' -recurse | Select-String -Pattern '%stringonea%' > '%reportsfolder%\%searchedin%-%stringonea%.txt'"
echo Filtering by "%stringonea%" . . .
GOTO ENDING
:ENDING
