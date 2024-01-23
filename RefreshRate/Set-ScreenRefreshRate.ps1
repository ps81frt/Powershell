function Set-ScreenRefreshRate
{ 
    param ( 
        [Parameter(Mandatory=$true)] 
        [int] $Frequency
    ) 

    [Display.PrimaryScreen]::ChangeRefreshRate($frequency) 
}

function Get-ScreenRefreshRate
{
    $frequency = Get-WmiObject -Class "Win32_VideoController" | Select-Object CurrentRefreshRate

    return $frequency
}
$currentFrequency = Get-ScreenRefreshRate
$newFrequency     = if ($currentFrequency -eq 40) { 60.01 } else { 60.01 }

Set-ScreenRefreshRate -Frequency $newFrequency
