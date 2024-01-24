Function Check-RunAsAdministrator()
{
  #Obtention du contexte utilisateur actuel
  $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  
  #On voit si l'utilisateur a les droit Administrateur
  if($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
  {
       Write-host "Le Script demarre avec les privilèges Administrateur"
  }
  else
    {
       #Creation d'un nouveau processus avec les privilèes Admin
       $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
 
       # Spécifiez le chemin et le nom du script actuel en tant que paramètre
       $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
 
       #Définir le processus sur élevé
       $ElevatedProcess.Verb = "runas"
 
       #Démarrer le nouveau processus élevé
       [System.Diagnostics.Process]::Start($ElevatedProcess)
 
       #Sortie du processus actuel, non élevé
       Exit
 
    }
}
 
#Vérifiez que le script s'exécute avec des privilèges élevés
Check-RunAsAdministrator

powershell mode "300" ; &{Get-PnpDevice -PresentOnly | Select-Object -Property Status,Friendlyname,InstanceId | Format-Table -GroupBy Status ; Get-CimInstance Win32_PnPEntity | Select-Object Status, Class, FriendlyName, instanceId | Format-Table -GroupBy Status ; Get-WmiObject -Class Win32_PnpEntity -ComputerName localhost -Namespace Root\CIMV2 | Where-Object {$_.ConfigManagerErrorCode -gt 0 } | Select-Object ConfigManagerErrorCode,Errortext,Present,Status,StatusInfo,caption | Format-List -GroupBy Status } | Out-File $env:userprofile\Desktop\tspilote_et_erreur.txt
