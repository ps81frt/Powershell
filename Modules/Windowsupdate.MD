# Faire ces mise a jour en ligne de commande. ( Windows 10 & 11 * )
-----------------------------------------------------------------------------------------------

# 1. Ouvrir Powershell ou Terminal en tant que administrateur et installer le module.

    Install-Module PSWindowsUpdate
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    Import-Module PSWindowsUpdate
    Get-Command -Module PSWindowsUpdate

# 2. Recherche des mise à jour disponible.

    Get-WindowsUpdate

# 3. Installe les Mise a jours.

    Install-WindowsUpdate

# 4. Installe les Mise a jours et redemarre automatiquement.
    
    Get-WindowsUpdate 
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Installe une mise a jours specifiques exemple pour la KB5021233 :

    Get-WindowsUpdate -Install -KBArticleID 'KB5021233'

# Historiques des mise a jours.

    Get-WUHistory -MaxDate (Get-Date).AddDays(-30) -Last 100

# List Pilotes.

    Get-WindowsDriver -Online -All

    
    
