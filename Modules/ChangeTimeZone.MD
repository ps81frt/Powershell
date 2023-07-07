# Changer la TZ avec Powershell
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Valeur Actuelle

    Get-TimeZone

Listes des TZ disponnible

    Get-TimeZone -ListAvailable

    ou pour une vue + humaine

    Get-TimeZone -ListAvailable | Out-GridView

Selection des TZ exemple avec Id et Name pour Paris

    Set-TimeZone -Id 'Romance Standard time' -PassThru

    Set-TimeZone -Name 'Paris, Madrid' -PassThru



    
