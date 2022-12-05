::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBVbXgWKAHi1E6cf7dTp6vqIsXEtRu01fYzPjODDDuUH+knlbNt+zkZpl94eDx5kTgCkZAo3vTgW+2OQPvupoArzY0ad41k2GmZxu0rTgyUoXMNizJdN2iOxnA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBVbXgWKAHi1E6cf7dTp6vqIsXEtRu01fYzPjODDDuUH+knlbNt+zkZpl94eDx5kSwGufCk9pWtRilSJIsCVvTPUWkyI8k4iJ0F7kG3cgyo/ZcEmn9sGsw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Project64 Netplay Updater
:choice
set /P c=Are you sure you want to continue[Y/N]?
if /I "%c%" EQU "Y" goto :Start
if /I "%c%" EQU "N" goto :Exit
goto :Exit

:Start
cd ../../
TASKKILL /IM "Project64-Netplay.exe" /F
"Plugin/Updater/wget.exe" https://github.com/Project64Netplay/win32-Binaries/archive/refs/heads/main.zip
"Plugin/Updater/7z.exe" x main.zip
cd Config
move Project64.cfg ..\
cd ..\
cd Plugin
cd GFX
move GlideN64.ini ..\..\
cd ..\
cd Input
move netplay_input_plugin.ini ..\..\
move NRage.ini ..\..\
cd ..\..\
rmdir Config /s /q
rmdir Plugin/Audio /s /q
rmdir Plugin/GFX /s /q
rmdir Plugin/Input /s /q
rmdir Plugin/RSP /s /q
rmdir Save /s /q
cd win32-Binaries-main
move Config ..\
move Plugin\Audio ..\Plugin
move Plugin\GFX ..\Plugin
move Plugin\Input ..\Plugin
move Plugin\RSP ..\Plugin
move Save ..\
move "Project64-Netplay.exe" ..\
cd ..\
rmdir win32-Binaries-main /s /q
DEL main.zip
move GlideN64.ini Plugin\GFX
move NRage.ini Plugin\Input
move Project64.cfg Config
move netplay_input_plugin.ini Plugin\Input
start Project64-Netplay
:Exit
EXIT
