Param
    (
        [switch] $reset
    )
    if($reset){
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sLongDate  -Value "dd MMMM yyyy" ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sShortDate -Value "dd-MM-yyyy" ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sShortTime -Value "HH:mm" ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sTimeFormat -Value "HH:mm:ss" ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sYearMonth -Value "MMMM yyyy" ;


    } else {
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sLongDate -Value " " ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sShortDate -Value " " ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sShortTime -Value " " ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sTimeFormat -Value " " ;
        Set-ItemProperty -Path "HKCU:\Control Panel\International" -name sYearMonth -Value " " ;

    }

    Get-Process explorer | Stop-Process
    Start-Process explorer.exe 