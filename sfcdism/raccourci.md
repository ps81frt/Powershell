Registry Script:
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\SFCScannow]
"Icon"="cmd.exe"
"MUIVerb"="SFC /Scannow"
"Position"="Bottom"
"SubCommands"=""

[HKEY_CLASSES_ROOT\DesktopBackground\shell\SFCScannow\shell\01Scannow]
"HasLUAShield"=""
"MUIVerb"="Run SFC /Scannow"

[HKEY_CLASSES_ROOT\DesktopBackground\shell\SFCScannow\shell\01Scannow\command]
@="PowerShell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/s,/k, sfc.exe /scannow' -Verb runAs\""

[HKEY_CLASSES_ROOT\DesktopBackground\shell\SFCScannow\shell\02ViewLog]
"MUIVerb"="View log for SFC"

[HKEY_CLASSES_ROOT\DesktopBackground\shell\SFCScannow\shell\02ViewLog\command]
@="PowerShell (Select-String [SR] $env:windir\\Logs\\CBS\\CBS.log -s).Line >\"$env:userprofile\\Desktop\\SFC_LOG.txt\""

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DISM

    C:\Windows\Logs\CBS\CBS.log
    C:\Windows\Logs\DISM\dism.log

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Registry Script:

Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\DismContextMenu]
"Icon"="WmiPrvSE.exe"
"MUIVerb"="Repair Windows Image"
"Position"="Bottom"
"SubCommands"=""

[HKEY_CLASSES_ROOT\DesktopBackground\shell\DismContextMenu\shell\CheckHealth]
"HasLUAShield"=""
"MUIVerb"="Check Health of Windows Image"

[HKEY_CLASSES_ROOT\DesktopBackground\shell\DismContextMenu\shell\CheckHealth\command]
@="PowerShell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/s,/k, Dism /Online /Cleanup-Image /CheckHealth' -Verb runAs\""

[HKEY_CLASSES_ROOT\DesktopBackground\shell\DismContextMenu\shell\RestoreHealth]
"HasLUAShield"=""
"MUIVerb"="Repair Windows Image"

[HKEY_CLASSES_ROOT\DesktopBackground\shell\DismContextMenu\shell\RestoreHealth\command]
@="PowerShell -windowstyle hidden -command \"Start-Process cmd -ArgumentList '/s,/k, Dism /Online /Cleanup-Image /RestoreHealth' -Verb runAs\""

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
