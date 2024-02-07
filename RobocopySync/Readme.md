# Robocopy synchroniser dossier sur un autre lecteur.

## exemple commande.

        robocopy  C:[SOURCE] D:\[DESTINATION] /e /copy:DAT /mt /z /xc /xn /xo /w:1

-------------------------------------------------
        robocopy  C:\Users\SERGIO\Documents\backup\source D:\destination /e /copy:DAT /mt /z /xc /xn /xo /w:1
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