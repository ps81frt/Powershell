Get-WinEvent -FilterHashtable @{ LogName = "Application"; ID = 1033 } | select timecreated,level,message | select -First 140 | Format-List | Out-File $env:USERPROFILE\Desktop\LogInstallation.txt
