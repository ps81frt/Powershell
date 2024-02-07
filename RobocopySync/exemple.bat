@echo off
:start
robocopy  C:\Users\SERGIO\Documents\backup\source D:\destination /MIR /e /copy:DAT /mt /z /xo /xd /xf /w:1 /LOG:"C:\Users\SERGIO\Documents\backup\leScript\log\%date%_%dtime%.log"
goto start