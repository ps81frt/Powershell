@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check pour les permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> Si erreurs, vous n etes pas administrateur.
if '%errorlevel%' NEQ '0' (
    echo Requiert les droit Administrateur...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin

echo   -----------------------------
echo        RESET WINDOWS UPDATE 
echo   -----------------------------

net stop bits
net stop wuauserv
net stop cryptsvc

Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"

Ren %Systemroot%\SoftwareDistribution\DataStore DataStore.bak
Ren %Systemroot%\SoftwareDistribution\Download Download.bak
Ren %Systemroot%\System32\catroot2 catroot2.bak

sc.exe sdset bits D:(A;CI;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)

cd /d %windir%\system32

regsvr32.exe atl.dll
regsvr32.exe urlmon.dll
regsvr32.exe mshtml.dll
regsvr32.exe shdocvw.dll
regsvr32.exe browseui.dll
regsvr32.exe jscript.dll
regsvr32.exe vbscript.dll
regsvr32.exe scrrun.dll
regsvr32.exe msxml.dll
regsvr32.exe msxml3.dll
regsvr32.exe msxml6.dll
regsvr32.exe actxprxy.dll
regsvr32.exe softpub.dll
regsvr32.exe wintrust.dll
regsvr32.exe dssenh.dll
regsvr32.exe rsaenh.dll
regsvr32.exe gpkcsp.dll
regsvr32.exe sccbase.dll
regsvr32.exe slbcsp.dll
regsvr32.exe cryptdlg.dll
regsvr32.exe oleaut32.dll
regsvr32.exe ole32.dll
regsvr32.exe shell32.dll
regsvr32.exe initpki.dll
regsvr32.exe wuapi.dll
regsvr32.exe wuaueng.dll
regsvr32.exe wuaueng1.dll
regsvr32.exe wucltui.dll
regsvr32.exe wups.dll
regsvr32.exe wups2.dll
regsvr32.exe wuweb.dll
regsvr32.exe qmgr.dll
regsvr32.exe qmgrprxy.dll
regsvr32.exe wucltux.dll
regsvr32.exe muweb.dll
regsvr32.exe wuwebv.dll

netsh winsock reset

net start bits
net start wuauserv   
net start cryptsvc

bitsadmin.exe /reset /allusers

echo   -----------------------------
echo            TERMINER
echo   -----------------------------