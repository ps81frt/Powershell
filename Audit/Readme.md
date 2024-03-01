# Audit systeme de securité Evenements

## Activation Audit USB

            "Plug and Play Events","Removable Storage","Handle Manipulation"

## Activation Audit registre

Utilisation de auditpol

            auditpol /?
            auditpol /list /category /v
            auditpol /list /subcategory:* /v # /v Affivhe le GUID necessaire a l'activation.

 Activation de l'audit:

            auditpol /set /category:"{0CCE921E-69AE-11D9-BED3-505054503030}" /success:enable /  failure:enable

Verification de l'etat (Status)

            auditpol /get /category:{"0CCE921E-69AE-11D9-BED3-505054503030}" 

Mise a jour de la startegie de groupe
        
            gpupdate /force