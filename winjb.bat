@echo off
title Windows Jailbreaker -> by JBDev

:menu
chcp 65001
REM This supports ASCII art.
cls
echo [38;5;214m            ██╗    ██╗██╗███╗   ██╗     ██╗██████╗ 
echo [38;5;215m            ██║    ██║██║████╗  ██║     ██║██╔══██╗
echo [38;5;216m            ██║ █╗ ██║██║██╔██╗ ██║     ██║██████╔╝
echo [38;5;217m            ██║███╗██║██║██║╚██╗██║██   ██║██╔══██╗
echo [38;5;218m            ╚███╔███╔╝██║██║ ╚████║╚█████╔╝██████╔╝
echo [38;5;219m             ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚════╝ ╚═════╝ 

echo [38;5;39m         Please choose an option for the jailbreaker:

echo [38;5;57m 1) Enable verbose boot
echo [38;5;57m 2) Customize theme
echo [38;5;57m 3) Floating taskbar
echo [38;5;57m 4) Exit script
set /p choice=Enter your choice: 

if "%choice%" == "1" goto vb 
if "%choice%" == "2" goto getC
if "%choice%" == "3" goto ftb
if "%choice%" == "4" goto eexit

REM Handle invalid input
echo Invalid choice! Please try again.
pause
goto menu

:vb
cls
echo Enabling verbose boot...
bcdedit /set {current} bootlog Yes
bcdedit /set {current} verboseboot Yes
echo Verbose boot enabled.
pause
goto menu

:getC
cls
echo Choose a theme:
echo 1) Light theme
echo 2) Dark theme
set /p theme=Enter your choice: 

if "%theme%" == "1" goto light
if "%theme%" == "2" goto dark

REM Handle invalid input
echo Invalid choice! Returning to the menu.
pause
goto menu

:ftb
cls
echo Centering Taskbar...
REM Set Taskbar alignment to the center
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 1 /f >nul
echo Taskbar has been centered. Please restart Explorer.
pause
goto restart_explorer

:eexit
cls
echo Exiting script. Goodbye!
pause
exit

:light
echo Switching to Light Theme...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f >nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f >nul
echo Light Theme applied.
pause
goto menu

:dark
echo Switching to Dark Theme...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
echo Dark Theme applied.
pause
goto menu

:restart_explorer
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo Taskbar settings applied!
pause
goto menu
