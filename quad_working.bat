@echo off
:TOPTOP
TITLE quad
echo.
echo   _____ _____ _____ ____  
echo  ^|     ^|  ^|  ^|  _  ^|    \ 
echo  ^|  ^|  ^|  ^|  ^|     ^|  ^|  ^|
echo  ^|__  _^|_____^|__^|__^|____/ 
echo     ^|__^|           
echo.
IF EXIST .quad GOTO WMENU
REM IF %correctfolder%==false GOTO FOLDERFALSE
SET FILESFOUND=E
IF EXIST "%cd%\start.bat" echo  Checking for 'start.bat' - Found it!
IF NOT EXIST "%cd%\start.bat" echo  Checking for 'start.bat' - Not Found!
IF NOT EXIST "%cd%\start.bat" set FILESFOUND=D
echo.
IF EXIST "%cd%\logs\" echo  Checking for 'logs' - Found it!
IF NOT EXIST "%cd%\logs\" echo  Checking for 'logs' folder - Not Found!
IF NOT EXIST "%cd%\logs\" set FILESFOUND=C
echo.
IF EXIST "%cd%\profiles\" echo  Checking for 'profiles' - Found it!
IF NOT EXIST "%cd%\profiles\" echo  Checking for 'profiles' - Not Found!
IF NOT EXIST "%cd%\profiles\" set FILESFOUND=B
echo.
IF EXIST "%cd%\mpmissions\" echo  Checking for 'mpmissions' - Found it!
IF NOT EXIST "%cd%\mpmissions\" echo  Checking for 'mpmissions' - Not Found!
IF NOT EXIST "%cd%\mpmissions\" set FILESFOUND=A
IF /I %FILESFOUND%==D GOTO FOLDERFALSE
echo.
echo  # Quad thinks your root server folder is %cd% #
echo.
echo  # Enter 'Y' if this is correct:
echo.
set /p confirmfolder= : 
IF /I %confirmfolder%==Y GOTO FOLDERTRUE
IF /I %confirmfolder%==N GOTO FOLDERSETUP
:FOLDERTRUE
CLS
echo.
echo   _____ _____ _____ ____  
echo  ^|     ^|  ^|  ^|  _  ^|    \ 
echo  ^|  ^|  ^|  ^|  ^|     ^|  ^|  ^|
echo  ^|__  _^|_____^|__^|__^|____/ 
echo     ^|__^|           
echo.
mkdir .quad
attrib +h .quad /s /d
echo %cd% > .quad/rootdir.dat
echo %cd%\logs\ > .quad/logsdir.dat
echo %cd%\profiles\ > .quad/profiledir.dat
REM copy %cd%\start.bat ".quad/startbat.ini"
echo  # Log searches are output to text files in a separate folder.
echo.
echo  # Where do you want them to go?
echo.
set /p reportsfolder= : 
echo %reportsfolder% > .quad/reportsdir.dat
IF NOT EXIST "%reportsfolder%" mkdir "%reportsfolder%"
echo.
GOTO WMENU
:FOLDERFALSE
CLS
echo.
echo   _____ _____ _____ ____  
echo  ^|     ^|  ^|  ^|  _  ^|    \ 
echo  ^|  ^|  ^|  ^|  ^|     ^|  ^|  ^|
echo  ^|__  _^|_____^|__^|__^|____/ 
echo     ^|__^|           
echo.
echo  # It does not look like you have run this from your
echo  # server root folder.
echo.
echo  # Do you want to run this in a test mode?
echo.

echo.
pause
:FOLDERSETUP
CLS
echo.
echo   _____ _____ _____ ____  
echo  ^|     ^|  ^|  ^|  _  ^|    \ 
echo  ^|  ^|  ^|  ^|  ^|     ^|  ^|  ^|
echo  ^|__  _^|_____^|__^|__^|____/ 
echo     ^|__^|           
echo.
:WMENU
CLS
echo.
echo   _____ _____ _____ ____  
echo  ^|     ^|  ^|  ^|  _  ^|    \ 
echo  ^|  ^|  ^|  ^|  ^|     ^|  ^|  ^|
echo  ^|__  _^|_____^|__^|__^|____/ 
echo     ^|__^|           
echo.
>>>>>>> 8f5e53d4fc10e2a136dc875c41f6027ce90c3f6e
