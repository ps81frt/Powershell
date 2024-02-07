@echo off
timeout 30
:start
robocopy  C:\Users\SERGIO\Documents\backup\source D:\destination /MIR /e /copy:DAT /mt /z /xo /xc /xd /xf /im /w:10
timeout 10
goto start 