@echo off
:start
robocopy  C:\Users\SERGIO\Documents\backup\source D:\destination /e /copy:DAT /mt /z /xc /xn /xo /xd /xf /w:1
goto start