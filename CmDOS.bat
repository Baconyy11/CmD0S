@echo off
cd locale
if not exist user.txt goto user
cd..
goto userset

:user
cls
echo CmDOS Setup
echo ================
echo What is your name?
set /p user= [cmdos@root]: 
cd locale
echo %user%>> user.txt
cd..
echo Type cmdos to load CmDOS!
exit

:userset
cd locale
set /p user=<user.txt
cd..
goto cmdos

:cmdos
set /p cmdos= [cmdos@%user%]:
if %cmdos% == echo goto echo
if %cmdos% == clear goto clear
if %cmdos% == ls goto ls
if %cmdos% == safemode goto safemode
if %cmdos% == reboot goto reboot
if %cmdos% == go goto go
if %cmdos% == help goto help
if %cmdos% == version goto version
if not exist %cmdos% goto selerror
%cmdos%

:selerror
echo Bad command or file name
goto cmdos

:go
set /p cmdos2=Enter directory name: 
REM Directly switch to directory without additional complexity
if exist "%cmdos2%" (
    cd "%cmdos2%"
    echo Now in %cd%
    goto cmdos
)
echo The system cannot find the path specified.
goto cmdos

:ls
dir /w
goto cmdos

:reboot
echo Rebooting...
reboot.bat

:clear
cls
goto cmdos

:echo
set /p cmdos1= [cmdos@%user%]:
echo %cmdos1%
goto cmdos

:safemode
exit

:help
echo echo - prints whatever you say -- you can write into files with it to
echo clear - clears your messy desktop
echo ls - see the files the machine is seeing
echo safemode - opens safe mode -- safe mode is a troubleshooting environment -- be sure to be careful with this, you have full power
echo reboot - reboots the environment -- make sure to type "go" then ".." if you are in a folder; repeat until the environment says "now in c:\"
echo go - make the machine go into any folder
echo help - displays the commands
echo version - displays the version
goto cmdos

:version
echo Version 1.0, codename "One"
goto cmdos