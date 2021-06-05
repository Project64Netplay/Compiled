@echo off
title Project 64 Netplay Updater
:choice
set /P c=Are you sure you want to continue[Y/N]?
if /I "%c%" EQU "Y" goto :Start
if /I "%c%" EQU "N" goto :Exit
goto :Exit

:Start
TASKKILL /IM Project64.exe /F
"Plugin/Updater/wget.exe https://github.com/Project64Netplay/Compiled/archive/refs/heads/main.zip
"Plugin/Updater/7z.exe" x Compiled-main.zip
cd Config
move Project64.cfg ..\
move NRage.ini ..\
cd ..\
cd Plugin
cd GFX
move GlideN64.ini ..\..\
cd ..\..\
rmdir Config /s
rmdir Extras /s
rmdir Plugin /s
rmdir Save /s
cd Compiled-main
move Config ..\
move Extras ..\
move Plugin ..\
move Save ..\
move Project64.exe ..\
move README.md ..\
move Replace.bat ..\
cd ..\
rmdir Compiled-main /s
DEL master.zip
move GlideN64.ini Plugin\GFX
move NRage.ini Config
move Project64.cfg Config
start Project64.exe

:Exit
EXIT