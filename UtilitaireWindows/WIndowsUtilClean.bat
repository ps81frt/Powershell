@echo off
mode con cols=122 lines=40
chcp 65001
cls

REM  --> Check des permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> Si erreur vous n'etes pas admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

echo Windows Utility par ps81frt
goto int

:int
echo Chargement de la configuration, Patientez ...
cls
set VER=2.0.0
set dir=%temp%
timeout 1 /nul
goto menu

:menu
cls
																									     
echo                    [40;31m ╔╗╔╗╔╗╔══╗╔═╗ ╔╗╔═══╗╔═══╗╔╗╔╗╔╗╔═══╗ [40;34m   ╔╗ ╔╗╔════╗╔══╗╔╗   ╔══╗╔════╗╔╗  ╔╗  
echo                    [40;31m ║║║║║║╚╣╠╝║║╚╗║║╚╗╔╗║║╔═╗║║║║║║║║╔═╗║ [40;34m   ║║ ║║║╔╗╔╗║╚╣╠╝║║   ╚╣╠╝║╔╗╔╗║║╚╗╔╝║  
echo                    [40;31m ║║║║║║ ║║ ║╔╗╚╝║ ║║║║║║ ║║║║║║║║║╚══╗ [40;34m   ║║ ║║╚╝║║╚╝ ║║ ║║    ║║ ╚╝║║╚╝╚╗╚╝╔╝  
echo                    [40;31m ║╚╝╚╝║ ║║ ║║╚╗║║ ║║║║║║ ║║║╚╝╚╝║╚══╗║ [40;34m   ║║ ║║  ║║   ║║ ║║ ╔╗ ║║   ║║   ╚╗╔╝   
echo                    [40;31m ╚╗╔╗╔╝╔╣╠╗║║ ║║║╔╝╚╝║║╚═╝║╚╗╔╗╔╝║╚═╝║ [40;34m   ║╚═╝║ ╔╝╚╗ ╔╣╠╗║╚═╝║╔╣╠╗ ╔╝╚╗   ║║    
echo                    [40;31m  ╚╝╚╝ ╚══╝╚╝ ╚═╝╚═══╝╚═══╝ ╚╝╚╝ ╚═══╝ [40;34m   ╚═══╝ ╚══╝ ╚══╝╚═══╝╚══╝ ╚══╝   ╚╝    
echo.
echo.
echo                                          [40;33m ╔═════════════════════════════════╗
echo                                          [40;33m ║ Utilitaire de Nettoyage Windows ║                                              
echo                                          [40;33m ╚═════════════════════════════════╝    
echo.
echo.
title Lanceur Windows Cleaner %ver% par ps81frt  
echo.
echo  [40;32m Appuyez sur un bouton de 1 à 5 - chacun de ces boutons a sa propre fonction comme decrit ci-dessous :
echo. 
echo ══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo  1 - Nettoyage et Suppression en profondeur des Fichier Temporaires
echo.
echo  2 -[40;31m Nettoyage Complet et Suppression des Fichier Temporaires et Donnees Profil Navigateur (RESET) !!!!!!!!!! [40;32m
echo.
echo  3 - Scanne le Systeme et repare l image de Windows (SFC + DISM)
echo.
echo  4 - Vide le cache de Windows Update
echo.
echo  5 - Ouvrir CMD
echo.
echo  6 - Ouvrir Powershell
echo.
echo  7 - Redemarrer l'ordinateur
echo.
echo  9 - Quitter

choice /c 123456789 /n

if %errorlevel%==1 goto clear-init
if %errorlevel%==2 goto clear-init2
if %errorlevel%==3 goto Reparation
if %errorlevel%==4 goto CacheWUpdate
if %errorlevel%==5 goto cmdbat
if %errorlevel%==6 goto powershell2
if %errorlevel%==7 goto redemarrer
if %errorlevel%==0 goto End



:END
cls
exit

:Reparation
cls
sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
cls
echo Windows Reparer avec Succes!
echo                                        [40;33m ╔═════════════════════════════════════╗
echo                                        [40;33m ║   Appuyer sur ENTRER pour continuer.║
echo                                        [40;33m ╚═════════════════════════════════════╝
pause >nul
goto menu

:clear-init
cls
echo Check des Fichiers Temporaires...
cd %temp%
if exist * goto clear-warning
if not exist * goto good-to-go

:clear-warning
cls
echo.
echo Votre PC a besoin d'un nettoyage en profondeur ! Selectionnez une option ci-dessous pour continuer.
echo.
echo Appuyez sur 1 pour effacer les donnees et recuperer de l'espace disque. (Ce processus prend plusieurs minutes, veuillez être patient)
echo Appuyez sur 2 pour arrêter les operations en cours et quitter le programme.
choice /c 12 /n
if %errorlevel%==1 goto clear
if %errorlevel%==2 goto menu

:clear
rem Suppressions des Fichiers Temporaires

RMDIR "%tmp%" /S /Q >nul 2>nul
del /s /f /q %temp%\*.* >nul 2>nul

:: Utiliser pour supprimer les anciens fichiers laisses apres la mise a niveau d'une version Windows

echo                                           [40;33m ╔═══════════════════════════════╗
echo                                           [40;33m ║    Nettoyage, Patientez...    ║
echo                                           [40;33m ╚═══════════════════════════════╝
cleanmgr.exe /autoclean
del /s /f /q %windir%\temp\*.* >nul 2>nul

echo [Nettoyage] et Optimisation en cours...
timeout /t 2 /nobreak >nul
echo.

echo [Nettoyage] Fichiers Temporaires && color c
timeout /t 2 /nobreak >nul
echo.

del /s /f /q %WinDir%\Temp\*.* >nul 2>nul
del /s /f /q %WinDir%\Prefetch\*.* >nul 2>nul
del /s /f /q %Temp%\*.* >nul 2>nul
del /s /f /q %AppData%\Temp\*.* >nul 2>nul
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.* >nul 2>nul
rd /s /q %WinDir%\Temp >nul 2>nul
rd /s /q %WinDir%\Prefetch >nul 2>nul
rd /s /q %Temp% >nul 2>nul
rd /s /q %AppData%\Temp >nul 2>nul
rd /s /q %HomePath%\AppData\LocalLow\Temp >nul 2>nul
md %WinDir%\Temp >nul 2>nul
md %WinDir%\Prefetch >nul 2>nul
md %Temp% >nul 2>nul
md %AppData%\Temp >nul 2>nul
md %HomePath%\AppData\LocalLow\Temp >nul 2>nul

del /s /f /q %windir%\temp\*.* >nul 2>nul
del /s /f /q %windir%\Prefetch\*.* >nul 2>nul
del /s /f /q %LOCALAPPDATA%\Microsoft\Windows\Caches\*.* >nul 2>nul
del /s /f /q %windir%\SoftwareDistribution\Download\*.* >nul 2>nul
del /s /f /q %programdata%\Microsoft\Windows\WER\Temp\*.* >nul 2>nul
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.* >nul 2>nul
rd /s /f /q %windir%\history 2>nul >nul
rd /s /f /q %windir%\cookies 2>nul >nul


echo [Nettoyage] Fichier de Logs && color b 
timeout /t 2 /nobreak >nul
echo.

REM Delete Log Files
del /s /f /q %windir%\Logs\CBS\CbsPersist*.log >nul 2>nul
del /s /f /q %windir%\Logs\MoSetup\*.log >nul 2>nul
del /s /f /q %windir%\Panther\*.log >nul 2>nul
del /s /f /q %windir%\logs\*.log >nul 2>nul
del /s /f /q %localappdata%\Microsoft\Windows\WebCache\*.log >nul 2>nul
rd /s /f /q %localappdata%\Microsoft\Windows\INetCache\*.log >nul 2>nul


echo [Nettoyage] Fichiers de pilotes restants && color 9
timeout /t 2 /nobreak >nul
echo.

rem Delete Fichiers de pilotes restants (Pas necessaire car deja installe)
del /s /f /q %SYSTEMDRIVE%\AMD\*.* >nul 2>nul
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.* >nul 2>nul
del /s /f /q %SYSTEMDRIVE%\INTEL\*.* >nul 2>nul


echo [Nettoyage] Windows Defender Cache/Logs && color 3
timeout /t 2 /nobreak >nul
echo.

del "%ProgramData%\Microsoft\Windows Defender\Network Inspection System\Support\*.log" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\CacheManager" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\ReportLatency\Latency" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Service\*.log" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\MetaStore" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Support" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Quick" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Resource" /F /Q /S >nul 2>nul

echo [Nettoyage] Cache du resolveur DNS Patientez .... && color 2
timeout /t 2 /nobreak >nul
echo.

REM Nettoyer le cache du resolveur DNS (un redemarrage peut être necessaire)
ipconfig /release >nul 2>nul
ipconfig /renew >nul 2>nul
ipconfig /flushdns >nul 2>nul
nbtstat -R >nul 2>nul
nbtstat -RR >nul 2>nul
netsh int ipv4 reset >nul 2>nul
netsh int ipv6 reset >nul 2>nul
netsh int reset all >nul 2>nul
netsh winsock reset >nul 2>nul
netsh winsock reset all >nul 2>nul
netsh int ip reset >nul 2>nul
netsh int ip reset all >nul 2>nul
echo Nettoyage terminer avec Succes!
echo                                        [40;33m ╔═════════════════════════════════════╗
echo                                        [40;33m ║   Appuyer sur ENTRER pour continuer.║
echo                                        [40;33m ╚═════════════════════════════════════╝
pause >nul
echo.
goto menu

:clear-error
echo Malheureusement nous n avons pas pu supprimer tous les fichiers temporaires (certains sont en cours de suppression).
echo Vous pouvez ouvrir manuellement les dossiers temporaires et essayer de supprimer les fichiers restants.
echo.
echo Appuyer sur 1 pour recommencer.
echo Appuyer sur 2 pour revenir au menu.
choice /c 12 /n
if %errorlevel%==1 goto clear
if %errorlevel%==2 goto menu

if exist * goto clear-error
if not exist * goto clear-complete

:clear-complete
cls
echo Pret! Votre ordinateur a ete debarrasse des donnees temporaires inutiles !
pause
goto menu

:good-to-go
cls
echo Votre PC n a besoin d aucun nettoyage. Votre PC est pret à fonctionner !
pause
pause
goto menu

:CacheWUpdate
cls
echo Arret des services Windows Update
net stop wuauserv >nul 2>nul
net stop cryptSvc >nul 2>nul
net stop bits >nul 2>nul
net stop msiserver >nul 2>nul
net stop dosvc >nul 2>nul
C:
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old >nul 2>nul
ren C:\Windows\System32\catroot2 Catroot2.old >nul 2>nul
echo Demarrage des Services Windows Update
net start dosvc >nul 2>nul
net start msiserver >nul 2>nul
net start bits >nul 2>nul
net start cryptsvc >nul 2>nul
net start wuauserv >nul 2>nul
echo Cache Windows Update vider avec Succes!
echo                                        [40;33m ╔═════════════════════════════════════╗
echo                                        [40;33m ║   Appuyer sur ENTRER pour continuer.║
echo                                        [40;33m ╚═════════════════════════════════════╝
pause /nul
echo.
goto menu

:clear-init2
cls
echo Check des Fichiers Temporaires et des Navigateur...
cd %temp%
if exist * goto clear-warning2
if not exist * goto good-to-go

:clear-warning2
cls
echo.
echo Nettoyage en profondeur des Navigateur (Suppression des profil) et fichiers temporaire ! Selectionnez une option ci-dessous pour continuer.
echo.
echo Appuyez sur 1 pour effacer les fichiers Temporaires, Corbeille et Donnees des Navigateur
echo Appuyez sur 2 pour arrêter les operations en cours et quitter le programme.
choice /c 12 /n
if %errorlevel%==1 goto clear2
if %errorlevel%==2 goto menu

:clear2
rem Suppressions des Fichiers Temporaires et Profils Navigateur
color a
echo   -----------------------------
echo        Suppresion Cookies
echo   -----------------------------

@echo off
REM --> Suppression Profil Firefox

taskkill /im "firefox.exe"

set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles

del /q /s /f "%DataDir%"

rd /s /q "%DataDir%"

for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

@echo off
REM --> Suppression Profil Chrome

set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

del /q /s /f "%ChromeDir%"

rd /s /q "%ChromeDir%"

REM --> Suppression historique de chrome

taskkill.exe /F /IM chrome.exe
del /q /s /f "c:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\History"

REM --> Suppression historique de Edge s'execute 3 fois la merde edge pour delete

taskkill.exe /F /IM msedge.exe
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\History"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\History-journal"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Network\Cookies"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Network-Journal"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Visited Links"

del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\History"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\History-journal"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Network\Cookies"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Network-Journal"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Visited Links"

del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\History"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\History-journal"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Network\Cookies"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Network-Journal"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Visited Links"

net session >nul 2>&1
if %errorlevel% == 0 (
    @RD /S /Q "C:\Windows\Temp"
    @RD /S /Q "C:\Windows\Prefetch"
    @RD /S /Q "%userprofile%\AppData\Local\Temp"
    @RD /S /Q "C:\$Recycle.Bin"

del /s /f /q %WinDir%\Temp\*.*
del /s /f /q %WinDir%\Prefetch\*.*
del /s /f /q %Temp%\*.*
del /s /f /q %AppData%\Temp\*.*
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
rd /s /q %WinDir%\Temp
rd /s /q %WinDir%\Prefetch
rd /s /q %Temp%
rd /s /q %AppData%\Temp
rd /s /q %HomePath%\AppData\LocalLow\Temp
cls
md %WinDir%\Temp
md %WinDir%\Prefetch
md %Temp%
md %AppData%\Temp
md %HomePath%\AppData\LocalLow\Temp
echo [Nettoyage] Fichiers et Navigateur && color 2
timeout /t 2 /nobreak >nul
echo.
cls
echo Nettoyage terminer avec Succes!
echo.
pause /nul
goto menu


:cmdbat
cd %windir%\system32\cmd.exe
start cmd.exe
goto menu

:powershell2
cd %windir%\system32\WindowsPowerShell\powershell.exe
start powershell.exe
goto menu

:redemarrer
start shutdown.exe /r /t 2
exit


