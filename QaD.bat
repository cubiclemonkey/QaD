@echo off
:NOTTOP
REM #################### - VARIABLE SETTINGS - ####################
REM ### DayZ Server Folder
set dayzrootloc=C:\DayZ\server
IF /I %dayzrootloc%==NOTSET GOTO EDITPROMPT
:TOPTOP
CLS
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
echo  E. Car Cover
echo.
echo  F. Advanced Banking
echo.
echo  X. Close this window
set reportsfolder=%userprofile%\Desktop\Reports\
IF NOT EXIST "%userprofile%\Desktop\Reports\" mkdir "%userprofile%\Desktop\Reports\"
REM set ticketsfolder=%userprofile%\Desktop\Reports\Tickets\
REM IF NOT EXIST "%userprofile%\Desktop\Reports\Tickets\" mkdir "%userprofile%\Desktop\Reports\Tickets\"
REM set ticketsfolder=%userprofile%\Desktop\Reports\Tickets\
IF NOT EXIST "%Temp%\QaD\" mkdir "%Temp%\QaD\"
echo.
set /p whatarewedoingboss= Select an option: 
echo.
IF /I %whatarewedoingboss%==A GOTO CONSOLE
IF /I %whatarewedoingboss%==B GOTO COT
IF /I %whatarewedoingboss%==C GOTO CHATSER
IF /I %whatarewedoingboss%==D GOTO PLDMG
IF /I %whatarewedoingboss%==E GOTO CCOVER
IF /I %whatarewedoingboss%==F GOTO BTRANS
IF /I %whatarewedoingboss%==X GOTO EXITTH
echo.
echo  A, B, C, D, or E - those are your options. :(
echo.
PAUSE
CLS
GOTO TOPTOP
:CCOVER
CLS
echo.
echo  ## Car Cover
set searchedin=carcover
set customer-mod-folder=%dayzrootloc%\profiles\CarCover
echo.
echo  # Paste a SteamID, player name, vehicle, action (covered/uncovered) or date [DD.MM.YYYY]
echo.
set /p customer-mod-ser= Search for: 
echo.
Powershell "Get-ChildItem -Path '%customer-mod-folder%\*.log' -recurse | Select-String -Pattern '%customer-mod-ser%' | Format-Table Line -HideTableHeaders > '%reportsfolder%\%searchedin%-%customer-mod-ser%.txt'"
echo Filtering by "%customer-mod-ser%" . . .
GOTO ENDING
:BTRANS
CLS
echo.
echo  ## Advanced Banking
set searchedin=carcover
set customer-mod-folder=%dayzrootloc%\profiles\AdvancedBanking
echo.
echo  # Paste a SteamID, player name or action
echo.
set /p customer-mod-ser= Search for: 
echo.
Powershell "Get-ChildItem -Path '%customer-mod-folder%\*.log' -recurse | Select-String -Pattern '%customer-mod-ser%' | Format-Table Line -HideTableHeaders > '%reportsfolder%\%searchedin%-%customer-mod-ser%.txt'"
echo Filtering by "%customer-mod-ser%" . . .
GOTO ENDING
:CONSOLE
CLS
echo.
echo  ## Console
set searchedin=console
echo.
set /p console-player-log= Search for: 
echo.
Powershell "Get-ChildItem -Path '%dayzrootloc%\Logs\*.log' -recurse | Select-String -Pattern '%console-player-log%' > '%reportsfolder%\%searchedin%-%console-player-log%.txt'"
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
Powershell "Get-ChildItem -Path '%dayzrootloc%\profiles\CommunityOnlineTools\Logs\*.log' -recurse | Select-String -Pattern '%cotplayersearch%' > '%reportsfolder%\%searchedin%-%cotplayersearch%.txt'"
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
REM set workingfolder=
echo  # Search for word, phrase, or player
echo.
set /p ignchatsearch= Paste or type string here: 
Powershell "Get-ChildItem -Path '%dayzrootloc%\logs\*.ADM' -recurse | Select-String -Pattern 'Chat' | Format-Table Line -Autosize -HideTableHeaders > '%Temp%\QaD\%searchedin%-chatdump.txt'"
REM Select-String -pattern "chat" | Format-Table -Autosize LineNumber,Line -GroupBy Path -HideTableHeaders
echo Filtering by "%ignchatsearch%" . . .
Powershell "Get-ChildItem -Path '%Temp%\QaD\%searchedin%-chatdump.txt' | Select-String -Pattern '%ignchatsearch%' | Format-Table Line -Autosize -HideTableHeaders > '%reportsfolder%\%searchedin%-%ignchatsearch%.txt'"
IF EXIST "%Temp%\QaD\%searchedin%-chatdump.txt" DEL "%Temp%\QaD\%searchedin%-chatdump.txt"
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
Powershell "Get-ChildItem -Path '%dayzrootloc%\logs\*.ADM' -recurse | Select-String -Pattern 'hit by' | Format-Table Line -Autosize -HideTableHeaders > '%Temp%\QaD\%searchedin%-hitby.txt'"
echo Filtering by "%playerdamage%" . . .
Powershell "Get-ChildItem -Path '%Temp%\QaD\%searchedin%-hitby.txt' | Select-String -Pattern '%playerdamage%' | Format-Table Line -Autosize -HideTableHeaders > '%reportsfolder%\%searchedin%-%playerdamage%.txt'"
REM IF EXIST "%Temp%\QaD\%searchedin%-hitby.txt" DEL "%Temp%\QaD\%searchedin%-hitby.txt"
GOTO ENDING
:ENDING
GOTO TOPTOP
:CLOSETH
EXIT
:EDITPROMPT
echo.
echo #################### - VARIABLE SETTINGS - ####################
echo.
echo  You still need to input your dayz root folder!
echo.
echo  %dayzrootloc%
echo.
echo  Please edit this file and look for the banner to update this locations
echo.
PAUSE
EXIT
