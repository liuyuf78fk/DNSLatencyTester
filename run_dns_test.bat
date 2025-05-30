@echo off
:: DNS Latency Test Launcher with Admin Elevation
:: Author: Liu Yu <f78fk@live.com>
:: Date: 2025-05-31
:: Description: Automatically runs the dns_latency_test.ps1 script as Administrator

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Full path to the PowerShell script
set "scriptPath=%~dp0dns_latency_test.ps1"

:: Run the PowerShell script with unrestricted execution policy
powershell -NoProfile -ExecutionPolicy Bypass -File "%scriptPath%"

pause
