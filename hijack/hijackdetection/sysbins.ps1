$SysBinList = Get-ChildItem $env:SystemRoot\system32\,$env:SystemRoot\syswow64\ -Recurse -ErrorAction SilentlyContinue | Where-Object {($_.Extension -like “.exe”)} -ErrorAction SilentlyContinue | Select Name;$SysBinLobj = $SysBinList.Name | select -Unique | Select-Object @{Name=’Name’;Expression={$_}};$SysBinLobj | export-csv sysbins.csv -NoTypeInformation