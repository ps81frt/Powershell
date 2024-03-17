@echo off

:: (Run as Admin code starts)
REM  Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\icacls.exe" "%SYSTEMROOT%\system32\config\system"

REM If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Now Running As Administrative Privileges...
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
:: (Run as Admin code ends)
::=======================================
::=======================================


:: (Your code is start pour here:)
::===========================>

@echo off
color 1E
Title Cleanner
echo Ceci va arreter le service de mise a jours Windows "Fichier de mise a jour"
echo Etes vous sur de vouloir nettoyer et supprimer les fichiers ?
Pause
echo.
cls
taskkill /F /IM explorer.exe & start explorer
echo.
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression:  = 1%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo Dernier Nettoyage Date: %DATE% %TIME% >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 1) Fichier du dossier temporaire Windows actuels >>"C:\Users\Public\Desktop\Log.txt" 
Tree %windir%\Temp /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 1) Suppression des fichiers temporaire >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q %windir%\Temp\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q %windir%\Temp >>"C:\Users\Public\Desktop\Log.txt" 
md %windir%\Temp >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: == 2%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 2) Fichier temporaire local Local %Temp%  >>"C:\Users\Public\Desktop\Log.txt" 
Tree %USERPROFILE%\APPDATA\Local\Temp /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 2) Suppression du fichier  %Temp% local >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q %Temp%\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q %Temp% >>"C:\Users\Public\Desktop\Log.txt" 
md %Temp%\ >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: == 3%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 3) Fichier contenue dans Prefetch >>"C:\Users\Public\Desktop\Log.txt" 
Tree %windir%\Prefetch /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 3) Suppression de Prefetch >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q %windir%\Prefetch\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q %windir%\Prefetch >>"C:\Users\Public\Desktop\Log.txt" 
md %windir%\Prefetch >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: === 10%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 4) Fichiers du dossier temporaire des parametres locaux de l'utilisateur actuel >>"C:\Users\Public\Desktop\Log.txt" 
Tree %USERPROFILE%\APPDATA\Local\Temp /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 4) Suppression du dossier temporaire des parametres locaux de l'utilisateur >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q "%USERPROFILE%\Local Settings\Temp" >>"C:\Users\Public\Desktop\Log.txt" 
md "%USERPROFILE%\Local Settings\Temp" >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ==== 15%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 5) Dossier recent actuel à partir des fichiers Windows 10/11 uniquement >>"C:\Users\Public\Desktop\Log.txt" 
Tree "%APPDATA%\Microsoft\Windows\Recent" /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 5) Supprimer le dossier recent de Windows 10/11 uniquement >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent"\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q "%APPDATA%\Microsoft\Windows\Recent" >>"C:\Users\Public\Desktop\Log.txt" 
md "%APPDATA%\Microsoft\Windows\Recent" >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ===== 20%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 6) Actuel Recent Explor Dossier pour Windows 10/11 seulement fichiers >>"C:\Users\Public\Desktop\Log.txt" 
Tree "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations" /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 6) Suppression  Recent Explor Dossier pour Windows 10/11 seulement >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations"\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations" >>"C:\Users\Public\Desktop\Log.txt" 
md "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations" >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ====== 25%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 7) Actuel Recent Custom Explor Dossier pour Windows 10/11 seulement fichiers >>"C:\Users\Public\Desktop\Log.txt" 
Tree "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations" /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 7) Suppression  Recent Custom Explor Dossier pour Windows 10/11 seulement >>"C:\Users\Public\Desktop\Log.txt" 
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations"\*.* >>"C:\Users\Public\Desktop\Log.txt" 
rd /s /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations" >>"C:\Users\Public\Desktop\Log.txt" 
md "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations" >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ======= 30%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 8) Actuel Run Command History pour Registry fichiers >>"C:\Users\Public\Desktop\Log.txt" 
REG Query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 8) Suppression  Run Command History pour Registry >>"C:\Users\Public\Desktop\Log.txt" 
REG Query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU >>"C:\Users\Public\Desktop\Log.txt" 
REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ======== 35%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 9) Actuel Run Command History pour Registry fichiers >>"C:\Users\Public\Desktop\Log.txt" 
REG Query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 9) Suppression  Path History pour File Explorer Registry >>"C:\Users\Public\Desktop\Log.txt" 
REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ========= 40%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 10) Actuel Windows Prefetch Dossier fichiers >>"C:\Users\Public\Desktop\Log.txt" 
Tree %windir%\Prefetch /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 10) Suppression  Windows Prefetch Dossier >>"C:\Users\Public\Desktop\Log.txt" 
del C:\Windows\Prefetch\*.* /Q >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ========== 45%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 11) Actuel Windows .bak fichiers >>"C:\Users\Public\Desktop\Log.txt" 
Tree %windir%\Prefetch /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 11) Suppression  Windows .bak fichiers >>"C:\Users\Public\Desktop\Log.txt" 
del /s /q /f c:\*.bak >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez presque terminer...
echo ----------------------------------
echo Progression: =========== 50%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 12) Fichiers des telechargement actuels de Windows Update >>"C:\Users\Public\Desktop\Log.txt" 
Tree %windir%\softwaredistribution /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 12) Suppression  Fichiers des telechargement actuels de Windows Update >>"C:\Users\Public\Desktop\Log.txt" 
net stop wuauserv >>"C:\Users\Public\Desktop\Log.txt" 
rmdir %windir%\softwaredistribution  /s /q >>"C:\Users\Public\Desktop\Log.txt" 
net start wuauserv >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez svp...
echo ----------------------------------
echo Progression: ============ 55%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 13) Contenu de la Corbeille >>"C:\Users\Public\Desktop\Log.txt" 
Tree c:\$Recycle.bin /F /A >>"C:\Users\Public\Desktop\Log.txt" 
Tree d:\$Recycle.bin /F /A >>"C:\Users\Public\Desktop\Log.txt" 
Tree e:\$Recycle.bin /F /A >>"C:\Users\Public\Desktop\Log.txt" 
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo 13) Suppression  des Fichiers de la Corbeille >>"C:\Users\Public\Desktop\Log.txt" 
del c:\$Recycle.bin\*.* /f /s /q >>"C:\Users\Public\Desktop\Log.txt" 
del d:\$Recycle.bin\*.* /f /s /q >>"C:\Users\Public\Desktop\Log.txt" 
del e:\$Recycle.bin\*.* /f /s /q >>"C:\Users\Public\Desktop\Log.txt" 
call powershell.exe Clear-RecycleBin -force -ErrorAction:Ignore >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Patientez presque terminer...
echo ----------------------------------
echo Progression: ============== 60%%
echo =========================================================================================== >>"C:\Users\Public\Desktop\Log.txt" 
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement Please Wait Almost Done...
echo ----------------------------------
echo Progression: =============== 65%%
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement...
echo ----------------------------------
echo Progression: ================ 70%%
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement...
echo ----------------------------------
echo Progression: ================== 80%%
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement...
echo ----------------------------------
echo Progression: =================== 85%%
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement...
echo ----------------------------------
echo Progression: ==================== 90%%
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement...
echo ----------------------------------
echo Progression: ===================== 95%%
echo ----------------------------------
ping -n 1 localhost >nul
cls
echo.
echo.
echo Chargement...
echo ----------------------------------
echo Progression: ====================== 100%%
echo ----------------------------------
GOTO END
:END
cls
echo.
echo.
echo Nettoyage des fichiers terminer...
echo ----------------------------------
echo Progression: ====================== 100%%
echo.
echo.
Color 1A

echo ===========================================================================================
echo Dernier Nettoyage Date: %DATE% %TIME%
echo ===========================================================================================
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo ===========================================================================================%ESC%[1;31m
echo Suppression  Temp, Prefetch, Recent, Windows Update fichiers, Empty Recyclebin, Explor Dossier, Run Command, .bak%ESC%[1;32m
echo ===========================================================================================
echo Veuillez verifier ce fichier journal de l historique de suppression ou vous executez cette commande a partir d un dossier
echo ===========================================================================================%ESC%[1;31m
echo Ne supprimez pas ce dossier ni son contenu.
echo ====================================================================================================================
echo %windir%\installer
echo
echo
color b
echo Le fichier le del og se trouve dans C:\Users\Public\Desktop\Log.txt
echo
echo
echo
Pause