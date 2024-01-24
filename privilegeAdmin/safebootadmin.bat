# Cmd Admin démarrage mode sans échec 
bcdedit /set {default} safeboot minimal

# Cmd Admin démarrage mode sans échec reseau

bcdedit /set {default} safeboot network



# ouvrir Cmd remplacer username parle nom d utilisateur concerné 

net user

net localgroup administrators {username} /add

# Cmd Admin restaurer session normale

bcdedit /deletevalue {default} safeboot
