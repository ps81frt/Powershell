Write-Host "10 dernier evenement du journal system" ; Get-WinEvent -LogName System  -MaxEvents 100 | Select-Object TimeCreated,UserId,ContainerLog,ID,Level,Message,ProviderName,MachineName,TaskDisplayName,ProcessId,RecordId,Version,Task,Keywords | Export-Csv -Delimiter ";" $env:USERPROFILE\Desktop\event.csv -NoTypeInformation
