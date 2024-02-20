$backupPath = "$env:userprofile\desktop\TachesWindows"

$taskFolders = (Get-ScheduledTask).TaskPath | Where-Object { ($_ -notmatch "Microsoft") } | Select-Object -Unique

Write-Host "Debut de l exportation des taches." -ForegroundColor Cyan

if (Test-Path -Path $backupPath) {
    Write-Host "le Fichier existe deja: $backupPath" -ForegroundColor Yellow
}
else {
    New-Item -ItemType Directory -Path $backupPath | Out-Null
    Write-Host "Chemin Creer: $backupPath" -ForegroundColor Green
}

foreach ($taskFolder in $taskFolders) {
    Write-Host "Dossier TachesWindows: $taskFolder" -ForegroundColor Cyan

    if ($taskFolder -ne "\") {
        $folderPath = "$backupPath$taskFolder"

        if (-not (Test-Path -Path $folderPath)) {
            New-Item -ItemType Directory -Path $folderPath | Out-Null
        }
        else {
            Write-Host "Le fichier existe deja: $folderPath" -ForegroundColor Yellow
        }
    }

    $tasks = Get-ScheduledTask -TaskPath $taskFolder -ErrorAction SilentlyContinue

    foreach ($task in $tasks) {
        $taskName = $task.TaskName

        # Export the task and save it to a file
        $taskInfo = Export-ScheduledTask -TaskName $taskName -TaskPath $taskFolder
        $taskInfo | Out-File "$backupPath$taskFolder$taskName.xml"
        Write-Host "Saved file $backupPath$taskFolder$taskName.xml" -ForegroundColor Cyan
    }
}

Compress-Archive -Path "$env:userprofile\desktop\TachesWindows" -DestinationPath "$env:userprofile\desktop\TachesWindows.zip"

Remove-Item $env:userprofile\desktop\TachesWindows -Recurse

Write-Host "Exportation des taches Terminer !!!." -ForegroundColor Green
Write-Host ""
Write-Host "Le dossier se trouve sur le bureau" -ForegroundColor Red
Remove-Item .\tachewindows.ps1
timeout.exe 5