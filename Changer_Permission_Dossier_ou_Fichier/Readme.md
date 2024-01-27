# Changer les permission.
======================================================


### check des permission (exemple dossier telechargement)

    get-acl -Path .\Downloads\

#### Vue détaillés.

    (Get-ACL -Path ".\Downloads\").Access | Format-Table IdentityReference,FileSystemRights,AccessControlType,IsInherited,InheritanceFlags -AutoSize

#### Données des permissions

    ​$ACL = Get-ACL -Path ".\Downloads\""
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule ("TestUser1","Read","Allow")
    $ACL.SetAccessRule($AccessRule)
    $ACL | Set-Acl -Path ".\Downloads\"" 
    (Get-ACL -Path ".\Downloads\").Access | Format-Table IdentityReference,FileSystemRights,AccessControlType,IsInherited,InheritanceFlags -AutoSize


#### Supprimer des permission

    $ACL = Get-ACL -Path ".\Downloads\"
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("TestUser1","Read","Allow")
    $ACL.RemoveAccessRule($AccessRule)
    $ACL | Set-Acl -Path ".\Downloads\"
    (Get-ACL -Path "Test1.txt").Access | Format-Table IdentityReference,FileSystemRights,AccessControlType,IsInherited,InheritanceFlags -AutoSize

#### Changer de proprietaire

    $ACL = Get-Acl -Path ".\Downloads\"
    $User = New-Object System.Security.Principal.Ntaccount("TestUser1")
    $ACL.SetOwner($User)
    $ACL | Set-Acl -Path ".\Downloads\"

    Get-ACL -Path ".\Downloads\"

