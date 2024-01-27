&{Get-WmiObject win32_desktopmonitor;Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams;Get-WmiObject win32_videocontroller | select caption, CurrentHorizontalResolution, CurrentVerticalResolution, MaxRefreshRate, MinRefreshRate, currentrefreshrate} | Out-File -FilePath $env:USERPROFILE\Desktop\ecran.txt
 CA81.SSD dans 󰋜 ~ code .\Desktop\ecran.txt
