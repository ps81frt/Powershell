# Powershell 5.1

&{wmic path win32_pnpentity where "deviceid like '%PCI%'" get Caption,deviceid,Status,Service,ClassGUID,PNPClass ;
(gwmi Win32_Bus -Filter 'DeviceID like "PCI%"').GetRelated('Win32_PnPEntity').GetDeviceProperties('DEVPKEY_Device_LocationInfo').deviceProperties | ft data,DeviceID ;
$Availability = @{
    Name = 'Availability'
    Expression = {
      # property is an array, so process all values
      $value = $_.Availability
      
      switch([int]$value)
        {
          1          {'Other'}
          2          {'Unknown'}
          3          {'Running/Full Power'}
          4          {'Warning'}
          5          {'In Test'}
          6          {'Not Applicable'}
          7          {'Power Off'}
          8          {'Off Line'}
          9          {'Off Duty'}
          10         {'Degraded'}
          11         {'Not Installed'}
          12         {'Install Error'}
          13         {'Power Save - Unknown'}
          14         {'Power Save - Low Power Mode'}
          15         {'Power Save - Standby'}
          16         {'Power Cycle'}
          17         {'Power Save - Warning'}
          18         {'Paused'}
          19         {'Not Ready'}
          20         {'Not Configured'}
          21         {'Quiesced'}
          default    {"$value"}
        }
        
    }  
  }
  $StatusInfo = @{
    Name = 'StatusInfo'
    Expression = {
      # property is an array, so process all values
      $value = $_.StatusInfo
      
      switch([int]$value)
        {
          1          {'Other'}
          2          {'Unknown'}
          3          {'Enabled'}
          4          {'Disabled'}
          5          {'Not Applicable'}
          default    {"$value"}
        }
        
    }  
  }
  Get-CimInstance -ClassName Win32_Bus | Select-Object -Property DeviceID, Status, BusNum, $StatusInfo, $Availability | Sort-Object -Property @{Expression = "Caption"; Descending = $false} | ft } | Out-File -Width 4096 $env:USERPROFILE\Desktop\PeriphVendeur.txt

