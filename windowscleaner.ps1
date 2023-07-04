
$Path = ‘C’ + ‘:\$Recycle.Bin’


Get-ChildItem $Path -Force -Recurse  |


# Remove-Item -Recurse -Exclude *.ini 


write-Host “Toutes les données nécessaires supprimées de la corbeille avec succès” -ForegroundColor Green  


write-Host “Effacement des fichiers temporaires de divers emplacements” -ForegroundColor Yellow  

   
$tempfolders = @(“C:\Windows\Temp\*”, “C:\Windows\Prefetch\*”, “C:\Documents and Settings\*\Local Settings\temp\*”, “C:\Users\*\Appdata\Local\Temp\*”)
Remove-Item $tempfolders -force -recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
   
Write-Host “$([char]7)” 

write-Host “suppression de tous les fichiers temporaires effectuer avec succès” -ForegroundColor Green 

#Outil de nettoyage de disque

write-Host “Utilisation de l'outil de nettoyage de disque” -ForegroundColor Yellow  

cleanmgr /sagerun:1 /VeryLowDisk /AUTOCLEAN | Out-Null

Write-Host “$([char]7)” 

write-Host "Nettoyage du disque effectué avec succès" -ForegroundColor Green

#DISM
#Premièrement... réparons ce qui est cassé
dism.exe /Online /Cleanup-Image /RestoreHealth

#Analyser (probablement pas nécessaire)
dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

#Supprimer les indésirables
dism.exe /Online /Cleanup-Image /StartComponentCleanup

#Supprimer les fichiers inutiles remplacés
dism.exe /Online /Cleanup-Image /SPSuperseded

Write-Host “$([char]7)” 

Write-Host " Votre ordinateur a etais nettoyer avec succès" -ForegroundColor Green
