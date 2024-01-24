# pour les 40 deernier evenements.

Get-EventLog -LogName System  -After (Get-Date).AddDays(-4) -EntryType Error, Warning | Select-Object -First 40 | fl | Out-File -FilePath $env:USERPROFILE\Desktop\eventsystem.txt
