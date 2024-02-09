Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "C:\Users\tech\Desktop\test\copy.bat" & Chr(34), 0
Set WshShell = Nothing