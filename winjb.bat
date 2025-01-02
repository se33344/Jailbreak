@echo off

title Windows jailbreaker -> by JBDev

:menu
chcp 65001
REM this supports ascii art
cls
echo [38;5;214m            ██╗    ██╗██╗███╗   ██╗     ██╗██████╗ 
echo [38;5;215m            ██║    ██║██║████╗  ██║     ██║██╔══██╗
echo [38;5;216m            ██║ █╗ ██║██║██╔██╗ ██║     ██║██████╔╝
echo [38;5;217m            ██║███╗██║██║██║╚██╗██║██   ██║██╔══██╗
echo [38;5;218m            ╚███╔███╔╝██║██║ ╚████║╚█████╔╝██████╔╝
echo [38;5;219m             ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚════╝ ╚═════╝ 

echo [38;5;39m         Please choose an option for the jailbreaker

echo [38;5;57m 1) Enable verbose boot
echo [38;5;57m 2) Customize theme
echo [38;5;57m 3) Floating taskbar
echo [38;5;57m 4) Exit script
set /p choice=

if "%choice%" == "1" goto vb 
if "%choice%" == "2" goto getC
if "%choice%" == "3" goto ftb
if "%choice%" == "4" goto eexit

:vb
cls
bcdedit /set {current} bootlog Yes
bcdedit /set {current} verboseboot Yes


:getC
cls
echo 1) Light theme
echo 2) Dark theme
set /p theme=

if "%theme%" == "1" goto light
if "%theme%" == "2" goto dark

:ftb
echo Centering Taskbar...
REM Set Taskbar alignment to the center
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 1 /f >nul
echo Taskbar has been centered. Please restart Explorer.
pause
goto restart_explorer
echo aa

:eexit
exit

:light
echo Switching to Light Theme...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f >nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f >nul
echo Light Theme applied.
pause

:dark
echo Switching to Dark Theme...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
echo Dark Theme applied.
pause


:restart_explorer
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo Taskbar settings applied!
pause