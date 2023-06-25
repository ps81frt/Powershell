&{Show-NetfirewallRule| sort direction | ? enabled -eq "true" | ft -property @{label="Name" ; expression={$_.displayname}}, @{label="Direction" ; expression={$_.direction
	∙ }}} | Out-File $env:USERPROFILE\Desktop\parefeu.txt
