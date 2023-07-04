#Premièrement, je veux définir la variable de la corbeille
#Le "Namespace(0xA) est défini comme la corbeille.
#J'ajouterai bientôt un article avec tous les espaces de noms dont vous pourriez avoir besoin.
$recycleBinShell = New-Object -ComObject Shell.Application
$recycleBinFolder = $recycleBinShell.Namespace(0xA)

#Deuxièmement, je veux définir le dossier %temp% (AppData\Local\Temp).
$tempFilesENV = Get-ChildItem "env:\TEMP"
$tempFiles = $tempFilesENV.Value

#Troisièmement, je veux définir le répertoire Windows Temp
$windowsTemp = "C:\Windows\Temp\*"

#Enfin, je souhaite définir le dossier de distribution de logiciels Windows
$winDist = "C:\Windows\SoftwareDistribution"

#Maintenant la magie commence

#Retirer les éléments de la corbeille
$recycleBinFolder.item() | %{Remove-Item $_.path -Recurse -Confirm :$false}

#Supprimez les fichiers temporaires dans AppData\Local\Temp
Remove-Item -Recure "$tempFiles\*"

#Supprimer les anciennes mises à jour Windows
#Remarque : En supprimant ceci, vous perdrez l'historique des mises à jour et cela pourrait
#retéléchargez tout à la prochaine mise à jour si vous ne l'avez pas déjà installé
Get-Service -Name WUAUSERV | Stop-Service
Remove-Item -Path $winDist -Recurse -Force
Get-Service -Name WUAUSERV | Start-Service

#Outil de nettoyage de disque
cleanmgr /sagerun:1 /VeryLowDisk /AUTOCLEAN | Out-Null

#DISM
#Premièrement... réparons ce qui est cassé
dism.exe /Online /Cleanup-Image /RestoreHealth

#Analyser (probablement pas nécessaire)
dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

#Supprimer les indésirables
dism.exe /Online /Cleanup-Image /StartComponentCleanup

#Supprimer les fichiers inutiles remplacés
dism.exe /Online /Cleanup-Image /SPSuperseded
