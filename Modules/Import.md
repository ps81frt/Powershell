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

        
