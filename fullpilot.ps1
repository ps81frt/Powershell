Get-CimInstance -ClassName Win32_PNPEntity | Select-Object -Property 'Availability','Caption','ClassGuid','CompatibleID','ConfigManagerErrorCode', 'ConfigManagerUserConfig','CreationClassName','Description','DeviceID','ErrorCleared','ErrorDescription', 'HardwareID','InstallDate','LastErrorCode','Manufacturer','Name','PNPClass','PNPDeviceID', 'PowerManagementCapabilities','PowerManagementSupported','Present','Service','Status','StatusInfo','SystemCreationClassName','SystemName' | Export-Csv ~\Desktop\fullpilot.csv -Delimiter ";" -UseQuotes Always