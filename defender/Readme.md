Installation du module Windows Defender 
-------------------------------------------------------------
        Install-Module -Name WindowsDefender


Detection De Microsoft Windows Defender
------------------------------------------------------------

	Get-MpThreatDetection

Etats de Windows Defender
------------------------------------------------------------

	Get-MpComputerStatus


Mise a jours de Windows Defender
------------------------------------------------------------

	Update-MpSignature



Scan de Windows Defender
------------------------------------------------------------

	Start-MpScan -ScanType QuickScan

	Start-MpScan -ScanType FullScan

	Start-MpScan -ScanType FullScan -AsJob


Scan hors-ligne Windows Defender
------------------------------------------------------------


	Start-MpWDOScan
.

------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
Status et desactivation de Defender.
------------------------------------------------------------

Lister les Commandes
------------------------------------------------------------

 	Get-Command -Module Defender

Status des services
------------------------------------------------------------
	
 	Get-Service Windefend, SecurityHealthService, wscsvc| Select Name,DisplayName, Status

Status des fonctionnalité active ou pas
------------------------------------------------------------
	Get-MpComputerStatus | Select-Object -Property Antivirusenabled,AMServiceEnabled,AntispywareEnabled,BehaviorMonitorEnabled,IoavProtectionEnabled,NISEnabled,OnAccessProtectionEnabled,RealTimeProtectionEnabled,IsTamperProtected,AntivirusSignatureLastUpdated

 
 ![status](https://github.com/ps81frt/Powershell/assets/32146568/c0c11a42-fae4-49f6-9771-083c2ee1ae13)

Desactiver la Protection en temp réel, prend effet au redemarrage du systeme
------------------------------------------------------------

 	Set-MpPreference -DisableRealtimeMonitoring $true
  




