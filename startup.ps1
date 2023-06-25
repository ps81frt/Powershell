Get-WmiObject win32_StartupCommand | Select-Object -Property name,command,location,id,user | Export-Csv $env:USERPROFILE\Desktop\startup.csv
