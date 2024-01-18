&{ Get-CimInstance CIM_OperatingSystem | Select-Object Caption, Version, BuildNumber | fl ; 
Get-WmiObject -Class Win32_BIOS ;
Get-WmiObject CIM_Processor ; 
Get-WmiObject CIM_PhysicalMemory | Select-Object BankLabel, Manufacturer, PartNumber, SerialNumber, @{Name = 'Capacity'; Expression = {"$($_.Capacity / 1gb)" + 'GB'}}, Speed, ConfiguredClockSpeed, ConfiguredVoltage ; 
Get-WmiObject -Namespace root/cimv2/security/microsofttpm -Class Win32_TPM | Select-Object __SERVER,__NAMESPACE,IsActivated_InitialValue,IsEnabled_InitialValue,ManufacturerVersion,ManufacturerVersionInfo,PhysicalPresenceVersionInfo,SpecVersion ; 
Get-WmiObject Win32_VideoController | Select-Object Name,InfFilename,VideoModeDescription,PNPDeviceID | fl ;
Get-Disk | ft -AutoSize ;
Get-PSDrive -PSProvider 'FileSystem' ; 
Get-CimInstance -Class Win32_LogicalDisk | Select-Object -Property DeviceID, VolumeName, @{Label='EspaceLibre (Gb)'; expression={($_.FreeSpace/1GB).ToString('F2')}}, @{Label='Total (Gb)'; expression={($_.Size/1GB).ToString('F2')}}, @{label='LibrePourcentage'; expression={[Math]::Round(($_.freespace / $_.size) * 100, 2)}}|ft ; 
Get-CimInstance -ClassName Win32_Volume | Select-Object Name, FileSystem, Label, BlockSize | Sort-Object Name | Format-Table -AutoSize ;
Get-Volume | ft -Auto;
Get-Partition }| Out-File ~\Desktop\hardware.txt
