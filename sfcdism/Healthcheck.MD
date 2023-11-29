

---------------------------------------------------------------------

# powershell ou CMD ou ADMIN

---------------------------------------------------------------------

# Check des systemes de fichiers, entrer le commandes ci-dessous.

    sfc /scannow

# DISM commande ci-dessous.
---
    Dism /Online /Cleanup-Image /ScanHealth
    Dism /Online /Cleanup-Image /CheckHealth
    Dism /Online /Cleanup-Image /RestoreHealth
    Restart-Computer
