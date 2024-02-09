# Robocopy synchroniser dossier sur un autre lecteur.

## Exemple commande.

        robocopy  C:\[SOURCE] D:\[DESTINATION] /e /copy:DAT /mt /z /xc /xn /xo /w:1

-------------------------------------------------
        robocopy  C:\Users\SERGIO\Documents\backup\source D:\destination /e /copy:DAT /mt /z /xc /xn /xo /w:1
-------------------------------------------------
- copie simple:

        robocopy  C:\test\SOURC C:\test\DEST /R:2 /w:10 /S /E /COPY:DAT /MT:10 /Z /XO /XC /XD /XF /IM
- copie tous droit et permission des fichier et dossiers.(Doit s'executer en administrateur)

        robocopy  C:\test\SOURC C:\test\DEST /E /ZB /COPYALL /R:10 /W:30

-------------------------------------------------
## Explication Commande détaillés
-------------------------------------------------

/MIR
-  met en MIRoir une arborescence (équivaut à /E plus /PURGE).
-------------------------------------------------
/E      
- Indique qu'il faut copier les sous-répertoires, même les vides
-------------------------------------------------
/COPY   
- indicateurscopie :: spécifie les éléments à copier pour les fichiers (/COPY:DAT par défaut).     
- indicateurscopie : **D=Données**, **A=Attributs**, **T=Horodatages**, **X=Ignorer** les flux de données Alt (X est ignoré si /B ou /ZB). 
-------------------------------------------------
/MT[:n] 
- Effectuer des copies multi-thread avec n threads (par défaut, 8).
- n doit être au moins égal à 1 et non supérieur à 128.
-------------------------------------------------
/Z
- Copie en mode redémarrage. A vérifier mais c'est comme une reprised'une copie en cours avec un FTP suite a un problème. Attention, ce mode est à priori plus lent, ce qui se ressent entre 2 sites distants.
-------------------------------------------------
/XC
- eXclut les fichiers Changés.
-------------------------------------------------
/XN
- eXclut les fichiers Nouveaux.
-------------------------------------------------
/XO
- eXclut les fichiers anciens.
-------------------------------------------------
/XD
- "System Volume Information" On exclu le répertoires nommé "System Volume Information"qui est un répertoire système que l'on a pas d'intérêt à copier et qui peut en plus générer des erreurs.
-------------------------------------------------

/XF
- "pagefile.sys" On exclu le fichier qui contient la « mémoire virtuelle », il ne présente donc pas d'intérêt sans compter le fait qu'il peut être très volumineux.
-------------------------------------------------
/W:n
- délai entre les tentatives : 30 secondes par défaut.
-------------------------------------------------
/R:n
- Reesaie de copier le le fishier n fois.
-------------------------------------------------
/IM
- Inclure les fichiers modifiés (heures de modification différentes).

# cacher le processus sans ouverture de fenêtre

## Creer un fichier .vbs et copier coller ci-dessous

        Set WshShell = CreateObject("WScript.Shell") 
        WshShell.Run chr(34) & **"CHEMIN EXECUTABLE"** & Chr(34), 0
        Set WshShell = Nothing
-----------------------------------------


### Remplacer 
- C:\Users\SERGIO\Documents\backup\source\leScript\BackupRob.bat 
- par le chemin de vôtre fichier .bat ou .exe

        Set WshShell = CreateObject("WScript.Shell") 
        WshShell.Run chr(34) & "C:\Users\SERGIO\Documents\backup\source\leScript\BackupRob.bat" & Chr(34), 0
        Set WshShell = Nothing
-----------------------------------------
