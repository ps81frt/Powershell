

---------------------------------------------------------------------

# powershell ou CMD ou ADMIN

---------------------------------------------------------------------

# Check des systemes de fichiers

sfc /scannow

# DISM

Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /RestoreHealth
Restart-Computer
