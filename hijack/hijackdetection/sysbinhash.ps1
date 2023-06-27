$binarray=@()

$SysBinList = Get-ChildItem $env:SystemRoot\system32\,$env:SystemRoot\syswow64\ -Recurse -ErrorAction SilentlyContinue | Where-Object {($_.Extension -like “.exe”)} -ErrorAction SilentlyContinue | Select FullName,Name

foreach($bin in $SysBinList)

{

$binhash = Get-FileHash $bin.FullName -Algorithm SHA1

$binobject = New-Object psobject

$binobject | Add-Member -MemberType NoteProperty -Name “Name” -Value $bin.Name

$binobject | Add-Member -MemberType NoteProperty -Name “Hash” -Value $binhash.Hash

$binarray += $binobject

}

 

$binarray | export-csv sysbinhash.csv -NoTypeInformation