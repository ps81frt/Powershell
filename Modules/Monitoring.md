Rapport utilisation de la batterie.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    powercfg /batteryreport

Rapport Resau sans fil WLAN.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    netsh wlan show wlanreport

Imprimante
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Get-Printer

Erreur de pilotes.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Enregistrer au format .ps1
    $DeviceState = Get-WmiObject -Class Win32_PnpEntity -ComputerName localhost -Namespace Root\CIMV2 | Where-Object {$_.ConfigManagerErrorCode -gt 0
}

$DevicesInError = foreach($Device in $DeviceState){
 $Errortext = switch($device.ConfigManagerErrorCode){
    0 {"Ce périphérique ne fonctionne pas normalement."}
    1 {"Ce périphérique est mal configuré."}
    2 {"Windows ne peut pas charger le pilote pour ce périphérique."}
    3 {"Le pilote de ce périphérique est peut-être corrompu ou votre système manque peut-être de mémoire ou d'autres ressources."}
    4 {"Ce périphérique ne fonctionne pas correctement. L'un de ses pilotes ou votre registre est peut-être corrompu."}
    5 {"Le pilote de ce périphérique a besoin d'une ressource que Windows ne peut pas gérer."}
    6 {"La configuration de démarrage de ce périphérique est en conflit avec d'autres périphériques."}
    7 {"Impossible de filtrer."}
    8 {"Le chargeur de pilote pour le périphérique est manquant."}
    9 {"Cet appareil ne fonctionne pas correctement car le micrologiciel de contrôle signale les ressources de l'appareil de manière incorrecte."}
    10 {"Ce périphérique ne peut pas démarrer"}
    11 {"Cet appareil a échoué."}
    12 {"Cet appareil ne trouve pas suffisamment de ressources gratuites qu'il peut utiliser."}
    13 {"Windows ne peut pas vérifier les ressources de cet appareil."}
    14 {"Cet appareil ne peut pas fonctionner correctement tant que vous n'avez pas redémarré votre ordinateur."}
    15 {"Ce périphérique ne fonctionne pas correctement car il y a probablement un problème de ré-énumération."}
    16 {"Windows ne peut pas identifier toutes les ressources utilisées par cet appareil."}
    17 {"Cet appareil demande un type de ressource inconnu."}
    18 {"Réinstallez les pilotes de ce périphérique."}
    19 {"Échec lors de l'utilisation du chargeur VxD."}
    20 {"Votre registre est peut-être corrompu."}
    21 {" Échec du système : essayez de changer le pilote de ce périphérique. Si cela ne fonctionne pas, consultez la documentation de votre matériel. Windows supprime ce périphérique. "}
    22 {"Ce pilote est désactivé"}
    23 {" Échec du système : essayez de changer le pilote de ce périphérique. Si cela ne fonctionne pas, consultez la documentation de votre matériel. "}
    24 {"Ce périphérique n'est pas présent, ne fonctionne pas correctement ou n'a pas tous ses pilotes installés."}
    25 {"Windows est toujours en train de configurer cet appareil."}
    26 {"Windows est toujours en train de configurer cet appareil."}
    27 {"Ce périphérique n'a pas de configuration de journal valide."}
    28 {"Les pilotes de ce périphérique ne sont pas installés."}
    29 {"Cet appareil est désactivé car le micrologiciel de l'appareil ne lui a pas donné les ressources requises."}
    30 {"Ce périphérique utilise une ressource de demande d'interruption (IRQ) qu'un autre périphérique utilise."}
    31 {"Ce périphérique ne fonctionne pas correctement car Windows ne peut pas charger les pilotes requis pour ce périphérique."}
}
[PSCustomObject]@{
ErrorCode = $device.ConfigManagerErrorCode
ErrorText = $Errortext
Device = $device.Caption
Present = $device.Present
Status = $device.Status
StatusInfo = $device.StatusInfo
}
}

if(!$DevicesInError){
write-host "Healthy"
} else {
$DevicesInError
}
