
$Path = ‘C’ + ‘:\$Recycle.Bin’


Get-ChildItem $Path -Force -Recurse  |


# Remove-Item -Recurse -Exclude *.ini 


Write-Host “Toutes les données nécessaires supprimées de la corbeille avec succès” -ForegroundColor Green  


Write-Host “Effacement des fichiers temporaires de divers emplacements” -ForegroundColor Yellow  

   
$tempfolders = @(“C:\Windows\Temp\*”, “C:\Windows\Prefetch\*”, “C:\Documents and Settings\*\Local Settings\temp\*”, “C:\Users\*\Appdata\Local\Temp\*”)
Remove-Item $tempfolders -force -recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
   
Write-Host “$([char]7)” 

Write-Host “suppression de tous les fichiers temporaires effectuer avec succès” -ForegroundColor Green 

#Outil de nettoyage de disque

Write-Host “Utilisation de l'outil de nettoyage de disque” -ForegroundColor Yellow  

cleanmgr /sagerun:1 /VeryLowDisk /AUTOCLEAN | Out-Null

Write-Host “$([char]7)” 

Write-Host "Nettoyage du disque effectué avec succès" -ForegroundColor Green

#======================================================================================

Function Check-if-empty-folder {
    [cmdletbinding()]
    Param (
    [parameter(Mandatory=$true)]
    [string]$folderName
      
    )
    $directoryInfo = Get-ChildItem $folderName | Measure-Object
    $count = $directoryInfo.count
    if($count -eq 0){
      return 0
    }
    else{
      return 1
     }
    }
      
      
      
    $Daysback = "-60"
    $CurrentDate = Get-Date
    $DatetoDelete = $CurrentDate.AddDays($Daysback)
    $systemDrive = Get-ChildItem -Path Env:\SystemDrive | select -ExpandProperty Value
    $iisPath = "$systemDrive\inetpub\logs\LogFiles\"
    $foldersToCheck = @("$systemDrive\Windows\ccmcache", "$systemDrive\Windows\SoftwareDistribution\Download", "$systemDrive\Windows\Temp", "$systemDrive\Users\*\AppData\Local\Temp\*")
      
    # Supprimer les journaux IIS de plus de 60 jours
      
    if(Test-Path $iisPath){
      $iisLogs = Get-ChildItem -Recurse $iisPath | Where-Object { (! $_.PSIsContainer) -and ($_.LastWriteTime -lt $DatetoDelete) }
      foreach ($iisLog in $iisLogs){
         Try{
            Remove-Item $iisLog.FullName -Force -ErrorAction Stop
            Write-Host "Deleted: " $iisLog.FullName -ForegroundColor Yellow
         }
         Catch{
            Write-Host "Error deleting: $iisLog.FullName; Error Message: $($_.Exception.Message)" -ForegroundColor Cyan
         }
        }
    }
      
      
    # Sppression du contenue de C:\Windows\SoftwareDistribution\Download, C:\Windows\Temp,C:\Windows\ccmcache and user temp folders
      
      
     foreach ($folderToCheck in $foldersToCheck){
         If (Test-Path -Path $folderToCheck){
         if([bool](Check-if-empty-folder -folderName $folderToCheck) -eq 1 ){
             $folderList = Get-ChildItem -Path $folderToCheck
             foreach($folder in $folderList){
             Try{
                Remove-Item $folder.FullName -Recurse -Force  -ErrorAction Stop
                Write-Host "Deleted: " $folder.FullName -ForegroundColor Yellow
             }
             Catch{
               Write-Host "Error deleting: $folder.FullName; Error Message: $($_.Exception.Message)" -ForegroundColor Cyan
          }
         }
       }
     }
    }
       
    # Suppréssion des profil inconnue.
      
    Get-CimInstance win32_userprofile | foreach {
        ""
        $u = $_          # enregistrer notre utilisateur pour supprimer tard
        try {
            $objSID = New-Object System.Security.Principal.SecurityIdentifier($U.sid) -ErrorAction stop
            $objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
            "User={0}" -f $objUser.Value
            "Path={0}" -f $u.LocalPath
            "SID={0}" -f $u.SID
        }
        catch {
            "!!!!!Compte Inconnue!!!!!"
            "Path={0}" -f $u.LocalPath
            "SID={0}" -f $u.SID
            Remove-CimInstance -inputobject $u -Verbose
        }
    }


# Compresser le dossier WinSxS si l'espace disque utilisé est supérieur à 85 %
# Espace utilisé par le lecteur système
$systemDrive = get-wmiobject -class win32_logicaldisk | where-object {$_.DeviceID -eq (Get-WmiObject Win32_OperatingSystem).SystemDrive}
# Espace utilisé par le lecteur système en pourcentage
$usedSpace = $systemDrive.Size - $systemDrive.FreeSpace
$usedpersentage = $usedSpace/$systemDrive.Size*100
$usedpersentage = [math]::Round($usedpersentage,2)



#DISM
#Premièrement... réparons ce qui est cassé
dism.exe /Online /Cleanup-Image /RestoreHealth

#Analyser (probablement pas nécessaire)
dism.exe /Online /Cleanup-Image /AnalyzeComponentStore

#Supprimer les indésirables
if ($usedpersentage -gt 85){
    Dism.exe /Online /Cleanup-Image /StartComponentCleanup
 }
#Supprimer les fichiers inutiles remplacés
dism.exe /Online /Cleanup-Image /SPSuperseded

Write-Host “$([char]7)” 

Write-Host " Votre ordinateur est maintenant nettoyer !!!!!! :) ^^" -ForegroundColor Green
