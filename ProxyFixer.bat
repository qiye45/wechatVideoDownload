@echo off
title Proxy Fixer

:: 1. Enable Proxy and set specific server
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "127.0.0.1:7897" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "localhost;127.*;<local>" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d "" /f

:: 2. Clear corrupted connection settings (Fix loading issues)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DefaultConnectionSettings /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v SavedLegacySettings /f

:: 3. Flush DNS
ipconfig /flushdns

echo.
echo Fix Complete! 
echo --------------------------------------------------
echo Please verify:
echo 1. Clash Verge is RUNNING.
echo 2. If issues persist, toggle 'System Proxy' in Clash.
echo --------------------------------------------------
pause