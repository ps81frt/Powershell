# Faire ces mise a jour en ligne de commande. ( Windows 11 * )
-----------------------------------------------------------------------------------------------

# Ouvrir Powershell ou Terminal en tant que administrateur et installer le module.

    Install-Module PSWindowsUpdate
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    Import-Module PSWindowsUpdate
    Get-Command -Module PSWindowsUpdate

# Recherche des mise à jour disponible.

    Get-WindowsUpdate

# Installe les Mise a jours.

    Install-WindowsUpdate

# Installe les Mise a jours et redemarre automatiquement.
    
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Installe une mise a jours specifiques exemple pour la KB5021233 :

    Get-WindowsUpdate -Install -KBArticleID 'KB5021233'

# Mise a jour des pilotes avec Windows update.

    Get-WindowsDriver -Online -All

    
    
