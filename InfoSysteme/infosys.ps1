
# Art
Function Get-WindowsArt()
{
    [string[]] $ArtArray  =
            "                         ....::::       ",
            "                 ....::::::::::::       ",
            "        ....:::: ::::::::::::::::       ",
            "....:::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            "................ ................       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            ":::::::::::::::: ::::::::::::::::       ",
            "'''':::::::::::: ::::::::::::::::       ",
            "        '''':::: ::::::::::::::::       ",
            "                 ''''::::::::::::       ",
            "                         ''''::::       ",
            "                                        ",
            "                                        ",
            "                                        ";
    
    return $ArtArray;
}
#Prompts for Computer Name
powershell mode "300" ; &{ Param (
    [parameter(Mandatory = $false)]$Computer
)
#Variables
$SystemEnclosure = Get-CimInstance win32_systemenclosure -ComputerName $computer
$OS = Get-CimInstance Win32_OperatingSystem -ComputerName $Computer
#Creating Hash table from variables
$PCInfo = @{
    Manufacturer   = $SystemEnclosure.Manufacturer
    PCName         = $OS.CSName
    OS             = $OS.Caption
    Architecture   = $OS.OSArchitecture
    AssetTag       = $systemenclosure.serialnumber
    OSVersion      = $OS.Version
    InstallDate    = $OS.InstallDate
    LastBootUpTime = $OS.LastBootUpTime
}
#Writing to Host
Write-Host " "
Write-Host "Information sur la configuration" -ForegroundColor Yellow
Write-Host "Computer Info" -ForegroundColor Cyan
Write-Output "Computer Info"
Get-WindowsArt

#Display Hash Table
$PCInfo.getenumerator() | Sort-Object -Property name | Format-Table -AutoSize
Start-Sleep -Seconds 2
#Writing to Host
Write-Host "Computer Bios Info" -ForegroundColor Cyan
Write-Output "Computer Bios Info"

Get-WmiObject -Class Win32_BIOS | Select-Object SMBIOSBIOSVersion,Manufacturer,Name,SerialNumber,Version
Start-Sleep -Seconds 2
#Writing to Host
Write-Host "Computer GPU Info" -ForegroundColor Cyan
Write-Output "Computer GPU Info"

Get-CimInstance -ClassName Win32_VideoController | Select-Object Caption ,PNPDeviceID, DriverDate, DriverVersion, VideoModeDescription
Start-Sleep -Seconds 2
#Writing to Host
Write-Host "Computer Display Info" -ForegroundColor Cyan
Write-Output "Computer Display Info"

wmic desktopmonitor get Caption,MonitorType,MonitorManufacturer,Name
Start-Sleep -Seconds 2
#Writing to Host
Write-Host "Computer Disk Info" -ForegroundColor Cyan
Write-Output "Computer Disk Info"

#Display Drives
Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $computer |
Format-Table -Property DeviceID, Volumename, `
@{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
@{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
@{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }
Start-Sleep -Seconds 2
#Writing to Host
Write-Host "Network Information" -ForegroundColor Cyan
Write-Output "Network Information"

Get-CimInstance win32_networkadapterconfiguration -computer $computer | Where-Object { $null -ne $_.IPAddress } |
Select-Object IPAddress, DefaultIPGateway, DNSServerSearchOrder, IPSubnet, MACAddress, Caption, DHCPEnabled, DHCPServer, DNSDomainSuffixSearchOrder |
Format-List
Start-Sleep -Seconds 2
#Writing to Host
Write-Host "Computer Full DriverInfo" -ForegroundColor Cyan
Write-Output "Computer Full DriverInfo"

Get-PnpDevice -PresentOnly | Select-Object -Property Status,Friendlyname,InstanceId | Format-Table -GroupBy Status ; Get-CimInstance Win32_PnPEntity | Select-Object Status, Class, FriendlyName, instanceId | Format-Table -GroupBy Status ; Get-WmiObject Win32_PnPSignedDriver| Select-Object DeviceName, Manufacturer, DriverVersion ;  Get-WmiObject -Class Win32_PnpEntity -ComputerName localhost -Namespace Root\CIMV2 | Where-Object {$_.ConfigManagerErrorCode -gt 0 } | Select-Object ConfigManagerErrorCode,Errortext,Present,Status,StatusInfo,caption | Format-List -GroupBy Status } | Out-File $env:USERPROFILE\Desktop\info.txt
