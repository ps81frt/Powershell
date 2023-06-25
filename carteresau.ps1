& {Get-NetAdapter W*i* | fl Dri* && Get-NetAdapterAdvancedProperty W*i* | ft DisplayName, DisplayValue, ValidDisplayValues && Get-NetiPConfiguration && Get-DnsClientServerAddress | Format-Table -AutoSize} | Out-File -append $env:USERPROFILE\Desktop\reseau.txt



 & {Show-NetfirewallRule| sort direction | ? enabled -eq "true" | ft -property @{label="Name" ; expression={$_.displayname}}, @{label="Direction" ; expression={$_.direction}}} | Out-File $env:USERPROFILE\Desktop\parefeu.txt
