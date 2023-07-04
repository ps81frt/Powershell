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
