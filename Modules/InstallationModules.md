Mise a jours de Powershell
------------------------------------------------------------------------------------------------------------------------------------------

        $PSVersionTable.PSVersion
        winget install --id Microsoft.Powershell --source winget
        $PSVersionTable

Mise a jours de Powershell 7
------------------------------------------------------------------------------------------------------------------------------------------

        $PSVersionTable.PSVersion
        iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
        $PSVersionTable



Modules Indispensable Powershell:
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

        Install-Module -Name WFTools 
*
*
------------------------------------------------------------------------------------------------------------------------------------------
        Install-Module -Name SetBIOS 
*
*
        Set-BIOS -Path "$env:USERPROFILE\Desktop\YourPath.csv"
        Set-BIOS -Path "$env:USERPROFILE\Desktop\YourPath.csv" -Password
        
------------------------------------------------------------------------------------------------------------------------------------------
        Install-Module -Name GetBIOS 
*
*
*
        Get-bios       
 ou
      
        wmic bios get serialnumber
ou

        Get-WmiObject win32_baseboard | Format-List Product,Manufacturer,SerialNumber,Version
        
------------------------------------------------------------------------------------------------------------------------------------------        
        Install-Module -Name Carbon -AllowPrerelease 
*
*
        Get-CProgramInstallInfo -Name 'Google Chrome' | Select-Object * 
*
*
------------------------------------------------------------------------------------------------------------------------------------------

        
