@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
cd %~dp0

:: Creates a VBS file called usermessage
> usermessage.vbs ECHO WScript.Echo InputBox( "Desired Username", "Username", "" )
::Sets UserNameVar to the input from the user.
FOR /F "tokens=*" %%A IN ('CSCRIPT.EXE //NoLogo usermessage.vbs') DO SET UserNameVar=%%A
::Removes the created vbs file
DEL usermessage.vbs

::Replaces the current xlive.ini with one that contains the set username
for /f "delims=" %%a in (xlive.ini) do (
    SET s=%%a
    SET s=!s:YourName=%UserNameVar%!
    echo !s!>>text.ini
    
)
:: Deletes the original xlive.ini
del xlive.ini
:: Renames the temp ini to xlive.ini
rename text.ini xlive.ini

IF EXIST "C:\Program Files (x86)\Microsoft Games\Viva Pinata\Viva Pinata.exe" GOTO INSTALLED

::Prompts user to browse for a folder.
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Browse to your Viva Pinata Install',0,17).self.path""

::Sets the folder variable equal to the selected folder
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
GOTO COPYFILES

:INSTALLED
set "folder=C:\Program Files (x86)\Microsoft Games\Viva Pinata\"

:COPYFILES
setlocal enabledelayedexpansion
::Copy the xlive.dll and .ini to the install folder
copy "%~dp0\xlive.dll" "!folder!"
copy "%~dp0\xlive.ini" "!folder!"
endlocal