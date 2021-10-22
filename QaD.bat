@echo off
:NOTTOP
REM #################### - VARIABLE SETTINGS - ####################
REM ### DayZ Server Folder
set consoleloc=NOTSET
REM ### Community Online Tools Folder
set cotloc=NOTSET

IF /I %consoleloc%==NOTSET GOTO EDITPROMPT
IF /I %cotloc%==NOTSET GOTO EDITPROMPT
:TOPTOP
TITLE QaD DayZ Log Sifter
echo.
echo  ### Select what logs to search through:
echo.
echo  A. All DayZ Console Logs
echo.
echo  B. Community Online Tools
echo.
echo  C. Game Chat Search
echo.
echo  D. DayZ Player Damage
echo.
REM Update the next line with the mod name
echo  E. UPDATE MOD NAME
echo.
echo  X. Close this window
set reportsfolder=%userprofile%\Desktop\Reports\
IF NOT EXIST "%userprofile%\Desktop\Reports\" mkdir "%userprofile%\Desktop\Reports\"
REM set ticketsfolder=%userprofile%\Desktop\Reports\Tickets\
REM IF NOT EXIST "%userprofile%\Desktop\Reports\Tickets\" mkdir "%userprofile%\Desktop\Reports\Tickets\"
echo.
set /p whatarewedoingboss= Select an option: 
echo.
IF /I %whatarewedoingboss%==A GOTO CONSOLE
IF /I %whatarewedoingboss%==B GOTO COT
IF /I %whatarewedoingboss%==C GOTO CHATSER
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
set customer-mod-folder=UPDATE MOD FOLDER
echo.
set /p customer-mod-ser= Search for: 
echo.
Powershell "Get-ChildItem -Path '%customer-mod-folder%\*.log' -recurse | Select-String -Pattern '%customer-mod-ser%' > '%reportsfolder%\%searchedin%-%customer-mod-ser%.txt'"
echo Filtering by "%customer-mod-ser%" . . .
GOTO ENDING
:CONSOLE
CLS
echo.
echo  ## Console
set searchedin=console
REM ### Update the folder location for your server logs
REM set workingfolder=
echo.
set /p console-player-log= Search for: 
echo.
Powershell "Get-ChildItem -Path '%consoleloc%\logs\*.log' -recurse | Select-String -Pattern '%console-player-log%' > '%reportsfolder%\%searchedin%-%console-player-log%.txt'"
echo Filtering by "%console-player-log%" . . .
GOTO ENDING
:COT
CLS
echo.
echo  ## Community Online Tools (COT)
echo.
set searchedin=cot
REM ### Update the folder location for your server logs
REM set workingfolder=
echo  # Paste SteamID for your desired player below
echo.
set /p cotplayersearch= SteamID: 
Powershell "Get-ChildItem -Path '%cotloc%\profiles\CommunityOnlineTools\Logs\*.log' -recurse | Select-String -Pattern '%cotplayersearch%' > '%reportsfolder%\%searchedin%-%cotplayersearch%.txt'"
echo Filtering by "%cotplayersearch%" . . .
echo.
GOTO ENDING
:CHATSER
CLS
echo.
echo  ## Game Chat Search
echo.
set searchedin=gamechat
REM ### Update the folder location for your server logs
REM set workingfolder=C:\Servers\Dayz-New\servers\0\profiles\CodeLock\Logs\
echo  # Search for word, phrase, or player
echo.
set /p ignchatsearch= Paste or type string here: 
Powershell "Get-ChildItem -Path '%consoleloc%\logs\*.ADM' -recurse | Select-String -Pattern 'Chat' | Format-Table -Autosize LineNumber,Line -GroupBy Path -HideTableHeaders > '%reportsfolder%\%searchedin%-chatdump.txt'"
REM Select-String -pattern "chat" | Format-Table -Autosize LineNumber,Line -GroupBy Path -HideTableHeaders
echo Filtering by "%ignchatsearch%" . . .
Powershell "Get-ChildItem -Path '%reportsfolder%\%searchedin%-chatdump.txt' | Select-String -Pattern '%ignchatsearch%' | Format-Table Line -Autosize -HideTableHeaders > '%reportsfolder%\%searchedin%-%ignchatsearch%.txt'"
REM del "%reportsfolder%\Chat"
echo. 
GOTO ENDING
:PLDMG
CLS
echo.
echo  ## Player Damage
set searchedin=player-damage
REM ### Update the folder location for your server logs
echo  # Possible search strings:
echo.
echo  1. (DEAD) - To find where/when player died
echo  2. hit by player - To see where/when a player attacked another
echo  3. unconscious - To find where/when a player is unconscious
echo  4. ign to if that player was involved in PvP
echo.
set /p playerdamage= Search for: 
echo.
Powershell "Get-ChildItem -Path '%consoleloc%\logs\*.ADM' -recurse | Select-String -Pattern '%playerdamage%' > '%reportsfolder%\%searchedin%-%playerdamage%.txt'"
echo Filtering by "%playerdamage%" . . .
GOTO ENDING
:ENDING
GOTO TOPTOP
:CLOSETH
EXIT
:EDITPROMPT
echo.
echo #################### - VARIABLE SETTINGS - ####################
echo.
echo  Your folder locations are not all set correctly!
echo.
echo  %consoleloc%
echo.
echo  %cotloc%
echo.
echo  Please edit this file and look for the banner to update those locations
echo.
PAUSE
EXIT
