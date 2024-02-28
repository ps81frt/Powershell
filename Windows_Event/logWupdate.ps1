$date = Get-Date -Format "ddMMyy_HH_mm"

New-Item -ItemType Directory -Path "$env:userprofile\desktop\report$date" -Force

copy "C:\Windows\Logs\CBS\CBS.log" $env:userprofile\desktop\report$date

copy "C:\Windows\Logs\DISM\dism.log" $env:userprofile\desktop\report$date

Get-WindowsUpdateLog

copy "~\Desktop\WindowsUpdate.log" $env:userprofile\desktop\report$date

Compress-Archive -Path $env:userprofile\desktop\report$date -DestinationPath $env:userprofile\desktop\report$date.zip -Update

Remove-Item $env:userprofile\desktop\report$date -Recurse -Force -Confirm:$false

Remove-item ~\Desktop\WindowsUpdate.log -Recurse -Force -Confirm:$false

Remove-item ~\Desktop\logWupdate.ps1 -Recurse -Force -Confirm:$false

exit
