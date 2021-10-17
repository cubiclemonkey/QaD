@echo off
:TOPTOP
TITLE QaD DayZ Log Sifter
echo.
echo  ### Select what logs to search through:
echo.
echo  A. All DayZ Console Logs
echo.
echo  B. Community Online Tools
echo.
echo  C. CodeLocks Logs
echo.
echo  D. DayZ Player Damage
echo.
REM Update the next line with the mod name and remove the "REM" from the start of that line.
echo  E. UPDATE MOD NAME
echo.
echo  X. Close this window
set reportsfolder=%userprofile%\Desktop\Reports\
IF NOT EXIST "%userprofile%\Desktop\Reports\" mkdir "%userprofile%\Desktop\Reports\"
echo.
set /p whatarewedoingboss= Select an option: 
echo.
IF /I %whatarewedoingboss%==A GOTO CONSOLE
IF /I %whatarewedoingboss%==B GOTO COT
IF /I %whatarewedoingboss%==C GOTO CODEL
IF /I %whatarewedoingboss%==D GOTO PLDMG
IF /I %whatarewedoingboss%==E GOTO CUST1
IF /I %whatarewedoingboss%==X GOTO EXITTH
echo.
echo  A, B, C, D, or E - those are your options. :(
echo.
PAUSE
CLS
GOTO TOPTOP
:CUST1
CLS
echo.
REM Update your chosen mod name here to reflect in the menu
echo  ## UPDATE MOD NAME
set searchedin=UPDATE MODE NAME
REM ### Update the folder location for your server logs
set workingfolder=UPDATE MOD FOLDER
echo.
set /p stringonea= Search for: 
echo.
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern '%stringonea%' > '%reportsfolder%\%searchedin%-%stringonea%.txt'"
echo Filtering by "%stringonea%" . . .
GOTO ENDING
:CONSOLE
CLS
echo.
echo  ## Console
set searchedin=console
REM ### Update the folder location for your server logs
set workingfolder=
echo.
set /p stringonea= Search for: 
echo.
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern '%stringonea%' > '%reportsfolder%\%searchedin%-%stringonea%.txt'"
echo Filtering by "%stringonea%" . . .
GOTO ENDING
:COT
CLS
echo.
echo  ## Community Online Tools
echo.
set searchedin=community
REM ### Update the folder location for your server logs
set workingfolder=
echo  # Paste SteamID for your desired player below
echo.
set /p stringoneb= SteamID: 
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern '%stringoneb%' > '%reportsfolder%\%searchedin%-%stringoneb%.txt'"
echo Filtering by "%stringoneb%" . . .
echo.
GOTO ENDING
:CODEL
CLS
echo.
echo  ## CodeLocks
echo.
set searchedin=codelocks
REM ### Update the folder location for your server logs
set workingfolder=C:\Servers\Dayz-New\servers\0\profiles\CodeLock\Logs\
echo  # Search by playername, action ('raiding', 'accessed', 'attached'), or SteamID
echo.
set /p stringonec= Paste or type string here: 
Powershell "Get-ChildItem -Path '%workingfolder%\*.log' -recurse | Select-String -Pattern '%stringonec%' > '%reportsfolder%\%searchedin%-%stringonec%.txt'"
echo Filtering by "%stringonec%" . . .
echo. 
GOTO ENDING
:PLDMG
CLS
echo.
echo  ## Player Damage
set searchedin=player-damage
REM ### Update the folder location for your server logs
set workingfolder=
echo  # Possible search strings:
echo.
echo  1. (DEAD) - To find where/when player died
echo  2. hit by player - To see where/when a player attacked another
echo  3. unconscious - To find where/when a player is unconscious
echo  4. ign to if that player was involved in PvP
echo.
set /p stringonea= Search for: 
echo.
Powershell "Get-ChildItem -Path '%workingfolder%\*.ADM' -recurse | Select-String -Pattern '%stringonea%' > '%reportsfolder%\%searchedin%-%stringonea%.txt'"
echo Filtering by "%stringonea%" . . .
GOTO ENDING
:ENDING
GOTO TOPTOP
:CLOSETH
EXIT
