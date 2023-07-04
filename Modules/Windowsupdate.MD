# Faire ces mise a jour en ligne de commande. ( Windows 11 * )
-----------------------------------------------------------------------------------------------

# Ouvrir Powershell ou Terminal en tant que administrateur et installer le module.

    Install-Module PSWindowsUpdate
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    Import-Module PSWindowsUpdate
    Get-Command -Module PSWindowsUpdate
    Get-WindowsUpdate

# Installe les Mise a jours.

    Install-WindowsUpdate
# Installe les Mise a jours et redemarre.
    
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Installe une mise a jours specifiques.

    Get-WindowsUpdate -Install -KBArticleID 'KB5021233'

    
    
