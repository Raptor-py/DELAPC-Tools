@echo off
title DELAPC Tools - Diagnostico SMB Toshiba

:: Verificar privilegios de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell.exe -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

echo ======================================
echo          DELAPC Tools
echo   Diagnostico SMB Signing - Toshiba
echo          Coded by Raptor
echo ======================================
echo.

powershell.exe -ExecutionPolicy Bypass -File "%~dp0Diagnostico-SMB-Toshiba.ps1"

pause