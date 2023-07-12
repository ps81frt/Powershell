mode 33, 10
@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
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
color a
echo   -----------------------------
echo        Suppresion Cookies
echo   -----------------------------

::@echo off

::taskkill /im "firefox.exe"

::set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles

::del /q /s /f "%DataDir%"

::rd /s /q "%DataDir%"

::for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

::@echo off

::set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

::del /q /s /f "%ChromeDir%"

::rd /s /q "%ChromeDir%"

net session >nul 2>&1
if %errorLevel% == 0 (
    @RD /S /Q "C:\Windows\Temp"
    @RD /S /Q "C:\Windows\Prefetch"
    @RD /S /Q "%userprofile%\AppData\Local\Temp"
	@RD /S /Q "C:\$Recycle.Bin"


cls
echo   -----------------------------
echo        Nettoyage terminer
echo   -----------------------------
ping localhost -n 3 >nul
    exit
) ELSE (
   echo Demarrer le programme en tant que Administrateur ...
   PAUSE
   EXIT
)
