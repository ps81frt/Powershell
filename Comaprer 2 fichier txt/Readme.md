# Comparer les differences entre 2 fichiers.

        $fichier1 = Get-Content '.\fihier1.txt'
        $diff = Get-Content -Path '.\fichier2.txt' | Where-Object {$_ -notin $fichier1}