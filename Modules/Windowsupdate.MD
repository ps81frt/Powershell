# A executer avec powershell 7 pour compatibilité des commandes.
# Faire ces mise a jour en ligne de commande. ( Windows 10 & 11 * )
-----------------------------------------------------------------------------------------------

# 1. Ouvrir Powershell ou Terminal en tant que administrateur et installer le module.

    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
    Install-Module -Name PSWindowsUpdate
    Import-Module PSWindowsUpdate
    Get-Command -Module PSWindowsUpdate

# 2. Recherche des mise à jour disponible.

    Get-WindowsUpdate

# 3. Installe les Mise a jours.

    Install-WindowsUpdate

# 4. Installe les Mise a jours et redemarre automatiquement.
    
    Get-WindowsUpdate 
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Bonus Installe une mise a jours specifiques exemple pour la KB5021233 :
----------------------------
avec le résultat de la  ommande Get-WindowsUpdate vous aurez le numéro KBxxxxxxx à remplacer exemple ci-dessous.

    Get-WindowsUpdate -Install -KBArticleID 'KB5021233'

# Historiques des 100 derniere mise a jours des 20 derniers jours.

    Get-WUHistory -MaxDate (Get-Date).AddDays(-30) -Last 100

# List Pilotes.(powershell admin)

    Get-WindowsDriver -Online -All

    
    
