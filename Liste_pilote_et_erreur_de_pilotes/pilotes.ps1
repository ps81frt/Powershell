&{mode 300 ; Get-PnpDevice -PresentOnly | Select-Object -Property Status,Friendlyname,InstanceId | Format-Table -GroupBy Status ; 
Get-CimInstance Win32_PnPEntity | Select-Object Status, Class, FriendlyName, instanceId | Format-Table -GroupBy Status ;
Get-WmiObject -Class Win32_PnpEntity -ComputerName localhost -Namespace Root\CIMV2 | Where-Object {$_.ConfigManagerErrorCode -gt 0 } 
| Select-Object ConfigManagerErrorCode,Errortext,Present,Status,StatusInfo,caption | Format-List -GroupBy Status } 
|Out-File -Path $env:userprofile\Desktop\tspilote_et_erreur.txt ;
exit
