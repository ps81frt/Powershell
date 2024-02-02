# Lister et exporter les evenement de Windows

    Exemple avec system log et export autres a venir

# List Log d'installation d'application EventID 1033

        Get-WinEvent -FilterHashtable @{ LogName = "Application"; ID = 1033 } | Where-Object -Property Message -Match Office | select timecreated,level,message | select -First 140 | fl
