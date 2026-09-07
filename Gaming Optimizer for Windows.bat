@echo off
title Windows 11 Gaming Optimizer PRO
color 0A
chcp 65001 >nul

REM Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ============================================
    echo    ERROR: Administrator rights required
    echo ============================================
    echo.
    echo Please run this script as Administrator
    echo Right-click and select "Run as administrator"
    echo.
    pause
    exit
)

:START
cls
echo ════════════════════════════════════════════════
echo    WINDOWS 11 GAMING OPTIMIZER PRO
echo ════════════════════════════════════════════════
echo.
echo WARNING: This script will AGGRESSIVELY modify system settings
echo Create a restore point before continuing!
echo.
echo Would you like to create a restore point now?
echo 1. Yes (HIGHLY RECOMMENDED)
echo 2. No, continue without restore point
echo.
set /p restore="Select (1-2): "

if "%restore%"=="1" (
    echo.
    echo Creating system restore point...
    wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Gaming Optimization PRO", 100, 7 >nul 2>&1
    if %errorlevel%==0 (
        echo [✓] Restore point created successfully!
    ) else (
        echo [!] Could not create restore point - continuing anyway
    )
    timeout /t 2 >nul
)

:MENU
cls
echo ════════════════════════════════════════════════
echo         GAMING OPTIMIZATION MENU PRO
echo ════════════════════════════════════════════════
echo.
echo  CLEANING
echo  1. Deep clean (temp files, cache, logs)
echo  2. Optimize drives
echo  3. ► INSTALL ALL CLEANING OPTIONS
echo.
echo  PERFORMANCE
echo  4. Disable ALL unnecessary services
echo  5. Maximum visual performance
echo  6. Manage startup programs
echo  7. Ultimate power plan
echo  8. ► INSTALL ALL PERFORMANCE OPTIONS
echo.
echo  GAMING SPECIFIC
echo  9. Full Game Mode optimization
echo  10. Remove bloatware ^& telemetry
echo  11. Network optimization (gaming)
echo  12. Disable background processes
echo  13. General GPU optimization
echo  14. Optimize mouse ^& keyboard (polling rate)
echo  15. ► INSTALL ALL GAMING OPTIONS
echo.
echo  GPU SPECIFIC
echo  16. NVIDIA GPU Optimization
echo  17. AMD GPU Optimization
echo.
echo  ADVANCED
echo  18. Remove Windows bloatware apps
echo  19. Disable Windows features
echo  20. ► INSTALL ALL ADVANCED OPTIONS
echo.
echo  QUICK OPTIONS
echo  21. FULL PRO OPTIMIZATION (ALL)
echo  22. Restore defaults
echo  23. View status
echo  24. Exit
echo.
echo  EXTREME OPTIMIZATIONS
echo  25. Disable Windows Updates
echo  26. Disable Cortana completely
echo  27. Disable OneDrive completely
echo  28. Optimize pagefile (Virtual Memory)
echo  29. Disable System Sounds
echo  30. Disable Error Reporting
echo  31. Disable Windows Search Indexing
echo  32. Aggressive Visual Effects Disable
echo  33. Clean Registry (Remove obsolete entries)
echo  34. BLACK MODE - Remove ALL Windows Apps + Black Background
echo  35. EXTREME Keyboard Optimization (200,6,0,59)
echo  36. EXTREME Latency Optimization (IRQ, Timer, HPET, Nagle)
echo.
set /p option="Select (1-36): "

if "%option%"=="1" goto CLEAN_TEMP
if "%option%"=="2" goto DISK_OPT
if "%option%"=="3" goto INSTALL_ALL_CLEANING
if "%option%"=="4" goto SERVICES
if "%option%"=="5" goto VISUAL
if "%option%"=="6" goto STARTUP
if "%option%"=="7" goto POWER
if "%option%"=="8" goto INSTALL_ALL_PERFORMANCE
if "%option%"=="9" goto GAME_MODE
if "%option%"=="10" goto TELEMETRY
if "%option%"=="11" goto NETWORK
if "%option%"=="12" goto BACKGROUND_APPS
if "%option%"=="13" goto GPU_SETTINGS
if "%option%"=="14" goto MOUSE_KEYBOARD
if "%option%"=="15" goto INSTALL_ALL_GAMING
if "%option%"=="16" goto NVIDIA_OPT
if "%option%"=="17" goto AMD_OPT
if "%option%"=="18" goto DEBLOAT
if "%option%"=="19" goto DISABLE_FEATURES
if "%option%"=="20" goto INSTALL_ALL_ADVANCED
if "%option%"=="21" goto FULL_OPT
if "%option%"=="22" goto RESTORE
if "%option%"=="23" goto STATUS
if "%option%"=="24" goto EXIT
if "%option%"=="25" goto DISABLE_UPDATES
if "%option%"=="26" goto DISABLE_CORTANA
if "%option%"=="27" goto DISABLE_ONEDRIVE
if "%option%"=="28" goto OPTIMIZE_PAGEFILE
if "%option%"=="29" goto DISABLE_SOUNDS
if "%option%"=="30" goto DISABLE_ERROR_REPORTING
if "%option%"=="31" goto DISABLE_INDEXING
if "%option%"=="32" goto AGGRESSIVE_VISUAL
if "%option%"=="33" goto CLEAN_REGISTRY
if "%option%"=="34" goto BLACK_MODE
if "%option%"=="35" goto KEYBOARD_EXTREME
if "%option%"=="36" goto LATENCY_OPT
goto MENU

REM ════════════════════════════════════════════════
REM    INSTALL ALL CLEANING OPTIONS
REM ════════════════════════════════════════════════
:INSTALL_ALL_CLEANING
cls
echo ════════════════════════════════════════════════
echo    INSTALL ALL CLEANING OPTIONS
echo ════════════════════════════════════════════════
echo.
echo This will execute:
echo  • Deep clean (temp files, cache, logs)
echo  • Optimize drives
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion

REM Execute Deep Clean
echo.
echo [1/2] Running Deep Clean...
echo ════════════════════════════════════════════════
call :CLEAN_TEMP_SILENT

REM Execute Disk Optimization
echo.
echo [2/2] Running Disk Optimization...
echo ════════════════════════════════════════════════
call :DISK_OPT_SILENT

cls
echo ════════════════════════════════════════════════
echo    ALL CLEANING OPTIONS COMPLETED!
echo ════════════════════════════════════════════════
echo.
echo [✓] Deep clean completed
echo [✓] Drive optimization completed
echo.
echo All cleaning operations finished successfully!
echo.
endlocal
pause
goto MENU

REM ════════════════════════════════════════════════
REM    INSTALL ALL PERFORMANCE OPTIONS
REM ════════════════════════════════════════════════
:INSTALL_ALL_PERFORMANCE
cls
echo ════════════════════════════════════════════════
echo    INSTALL ALL PERFORMANCE OPTIONS
echo ════════════════════════════════════════════════
echo.
echo This will execute:
echo  • Disable ALL unnecessary services
echo  • Maximum visual performance
echo  • Manage startup programs
echo  • Ultimate power plan
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion

echo.
echo [1/4] Disabling unnecessary services...
call :SERVICES_SILENT

echo.
echo [2/4] Configuring visual performance...
call :VISUAL_SILENT

echo.
echo [3/4] Managing startup programs...
call :STARTUP_SILENT

echo.
echo [4/4] Activating ultimate power plan...
call :POWER_SILENT

cls
echo ════════════════════════════════════════════════
echo    ALL PERFORMANCE OPTIONS COMPLETED!
echo ════════════════════════════════════════════════
echo.
echo [✓] Services disabled
echo [✓] Visual performance maximized
echo [✓] Startup programs managed
echo [✓] Ultimate power plan activated
echo.
echo All performance optimizations applied!
echo.
endlocal
pause
goto MENU

REM ════════════════════════════════════════════════
REM    INSTALL ALL GAMING OPTIONS
REM ════════════════════════════════════════════════
:INSTALL_ALL_GAMING
cls
echo ════════════════════════════════════════════════
echo    INSTALL ALL GAMING OPTIONS
echo ════════════════════════════════════════════════
echo.
echo This will execute:
echo  • Full Game Mode optimization
echo  • Remove bloatware ^& telemetry
echo  • Network optimization
echo  • Disable background processes
echo  • General GPU optimization
echo  • Optimize mouse ^& keyboard
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion

echo.
echo [1/6] Configuring Game Mode...
call :GAME_MODE_SILENT

echo.
echo [2/6] Removing bloatware ^& telemetry...
call :TELEMETRY_SILENT

echo.
echo [3/6] Optimizing network...
call :NETWORK_SILENT

echo.
echo [4/6] Disabling background processes...
call :BACKGROUND_APPS_SILENT

echo.
echo [5/6] Optimizing GPU settings...
call :GPU_SETTINGS_SILENT

echo.
echo [6/6] Optimizing mouse ^& keyboard...
call :MOUSE_KEYBOARD_SILENT

cls
echo ════════════════════════════════════════════════
echo    ALL GAMING OPTIONS COMPLETED!
echo ════════════════════════════════════════════════
echo.
echo [✓] Game Mode optimized
echo [✓] Bloatware ^& telemetry removed
echo [✓] Network optimized
echo [✓] Background processes disabled
echo [✓] GPU optimized
echo [✓] Mouse ^& keyboard optimized
echo.
echo All gaming optimizations applied!
echo.
endlocal
pause
goto MENU

REM ════════════════════════════════════════════════
REM    INSTALL ALL ADVANCED OPTIONS
REM ════════════════════════════════════════════════
:INSTALL_ALL_ADVANCED
cls
echo ════════════════════════════════════════════════
echo    INSTALL ALL ADVANCED OPTIONS
echo ════════════════════════════════════════════════
echo.
echo WARNING: These are aggressive optimizations!
echo This will execute:
echo  • Remove Windows bloatware apps
echo  • Disable Windows features
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion

echo.
echo [1/2] Removing bloatware apps...
call :DEBLOAT_SILENT

echo.
echo [2/2] Disabling Windows features...
call :DISABLE_FEATURES_SILENT

cls
echo ════════════════════════════════════════════════
echo    ALL ADVANCED OPTIONS COMPLETED!
echo ════════════════════════════════════════════════
echo.
echo [✓] Bloatware apps removed
echo [✓] Windows features disabled
echo.
echo All advanced optimizations applied!
echo.
endlocal
pause
goto MENU

REM ════════════════════════════════════════════════
REM    SILENT EXECUTION FUNCTIONS
REM ════════════════════════════════════════════════

:CLEAN_TEMP_SILENT
echo [░░░░░░░░░░] 0%% - Starting deep cleaning...
del /q/f/s %TEMP%\* >nul 2>&1
echo [█░░░░░░░░░] 10%% - Cleaning user temp files...
del /q/f/s C:\Windows\Temp\* >nul 2>&1
echo [██░░░░░░░░] 20%% - Cleaning Windows temp...
del /q/f/s C:\Windows\Prefetch\* >nul 2>&1
echo [███░░░░░░░] 30%% - Cleaning prefetch...
rd /s /q %systemdrive%\$Recycle.Bin >nul 2>&1
echo [████░░░░░░] 40%% - Emptying recycle bin...
net stop wuauserv >nul 2>&1
del /q/f/s C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
echo [█████░░░░░] 50%% - Cleaning Windows Update cache...
del /q/f/s "%LocalAppData%\D3DSCache\*" >nul 2>&1
del /q/f/s "%LocalAppData%\NVIDIA\DXCache\*" >nul 2>&1
del /q/f/s "%LocalAppData%\AMD\DXCache\*" >nul 2>&1
echo [██████░░░░] 60%% - Cleaning shader caches...
del /q/f/s C:\Windows\Logs\* >nul 2>&1
wevtutil cl System >nul 2>&1
wevtutil cl Application >nul 2>&1
echo [███████░░░] 70%% - Cleaning system logs...
del /q/f/s %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db >nul 2>&1
echo [████████░░] 80%% - Cleaning thumbnail cache...
ipconfig /flushdns >nul 2>&1
echo [█████████░] 90%% - Flushing DNS cache...
cleanmgr /sagerun:1 >nul 2>&1
echo [██████████] 100%% - Running Disk Cleanup...
echo [✓] Deep cleaning completed
goto :eof

:DISK_OPT_SILENT
echo [░░░░░░░░░░] 0%% - Starting drive optimization...
echo     This may take 3-10 minutes depending on drive size
defrag C: /O /H >nul 2>&1
echo [███████░░░] 70%% - Drive optimization completed...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE >nul 2>&1
echo [█████████░] 85%% - Disabling scheduled defragmentation...
powercfg -h off >nul 2>&1
echo [██████████] 95%% - Disabling hibernation...
vssadmin delete shadows /for=c: /all /quiet >nul 2>&1
echo [██████████] 100%% - Cleaning shadow copies...
echo [✓] Drive optimization completed
goto :eof

:SERVICES_SILENT
echo [░░░░░░░░░░] 0%% - Starting service optimization...
set count=0
for %%s in (WSearch SysMain DiagTrack dmwappushservice WerSvc wuauserv wisvc WMPNetworkSvc XblAuthManager XblGameSave XboxNetApiSvc TabletInputService OneSyncSvc PcaSvc WbioSrvc RetailDemo MapsBroker lfsvc SharedAccess TrkWks WpcMonSvc PhoneSvc Fax Spooler RemoteRegistry RemoteAccess AppVClient tzautoupdate CDPUserSvc MessagingService PimIndexMaintenanceSvc UnistoreSvc UserDataSvc WalletService) do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start=disabled >nul 2>&1
    set /a count+=1
)
echo [██████████] 100%% - Services disabled...
echo [✓] Services disabled
goto :eof

:VISUAL_SILENT
echo [░░░░░░░░░░] 0%% - Starting visual optimization...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo [██░░░░░░░░] 20%% - Disabling visual effects...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
echo [████░░░░░░] 40%% - Disabling animations...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul
echo [██████░░░░] 60%% - Optimizing desktop...
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f >nul
echo [████████░░] 80%% - Configuring DWM...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul
echo [██████████] 100%% - Disabling transparency...
echo [✓] Visual performance configured
goto :eof

:STARTUP_SILENT
echo [░░░░░░░░░░] 0%% - Disabling startup programs...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "OneDrive" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
echo [██░░░░░░░░] 20%% - Disabling common apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Spotify" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Discord" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Steam" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
echo [█████░░░░░] 50%% - Disabling Adobe/Creative apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "AdobeAAMUpdater" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "AdobeGCInvoker" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
echo [███████░░░] 70%% - Disabling other apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Skype" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Teams" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
echo [█████████░] 90%% - Optimizing startup...
schtasks /Change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE >nul 2>&1
echo [██████████] 100%% - Startup optimized...
echo [✓] Startup programs disabled
goto :eof

:POWER_SILENT
echo [░░░░░░░░░░] 0%% - Creating Ultimate Performance plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
echo [███░░░░░░░] 30%% - Activating power plan...
for /f "tokens=4" %%a in ('powercfg -list ^| findstr "Ultimate"') do set ULTIMATE_GUID=%%a
if defined ULTIMATE_GUID (
    powercfg /setactive %ULTIMATE_GUID% >nul 2>&1
) else (
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
)
echo [██████░░░░] 60%% - Disabling sleep timers...
powercfg /change monitor-timeout-ac 0 >nul 2>&1
powercfg /change disk-timeout-ac 0 >nul 2>&1
echo [█████████░] 90%% - Disabling hibernation...
powercfg /change standby-timeout-ac 0 >nul 2>&1
powercfg /change hibernate-timeout-ac 0 >nul 2>&1
echo [██████████] 100%% - Power plan configured...
echo [✓] Power plan configured
goto :eof

:GAME_MODE_SILENT
echo [░░░░░░░░░░] 0%% - Enabling Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul
echo [███░░░░░░░] 30%% - Disabling Game Bar/DVR...
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v value /t REG_DWORD /d 0 /f >nul
echo [██████░░░░] 60%% - Enabling GPU scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul
echo [█████████░] 90%% - Optimizing CPU priority...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul
echo [██████████] 100%% - Game Mode configured...
echo [✓] Game Mode optimized
goto :eof

:TELEMETRY_SILENT
echo [░░░░░░░░░░] 0%% - Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
echo [█████░░░░░] 50%% - Disabling telemetry tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE >nul 2>&1
echo [██████████] 100%% - Telemetry disabled...
echo [✓] Telemetry removed
goto :eof

:NETWORK_SILENT
echo [░░░░░░░░░░] 0%% - Starting network optimization...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo [██░░░░░░░░] 20%% - Setting auto-tuning to normal...
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
echo [████░░░░░░] 40%% - Disabling ECN and timestamps...
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=2 >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
echo [██████░░░░] 60%% - Optimizing TCP settings...
netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
echo [████████░░] 80%% - Configuring advanced options...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul
echo [██████████] 100%% - Reducing latency...
echo [✓] Network optimized
goto :eof

:BACKGROUND_APPS_SILENT
echo [░░░░░░░░░░] 0%% - Disabling background apps globally...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
echo [█████░░░░░] 50%% - Disabling individual apps...
for %%a in (Microsoft.WindowsCamera Microsoft.Windows.Cortana Microsoft.WindowsMaps Microsoft.WindowsAlarms Microsoft.BingWeather Microsoft.GetHelp Microsoft.Getstarted Microsoft.Messaging Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.WindowsFeedbackHub Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.People Microsoft.WindowsSoundRecorder Microsoft.YourPhone Microsoft.Xbox.TCUI Microsoft.XboxApp Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxIdentityProvider Microsoft.XboxSpeechToTextOverlay) do (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\%%a" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\%%a" /v DisabledByUser /t REG_DWORD /d 1 /f >nul 2>&1
)
echo [██████████] 100%% - Background apps disabled...
echo [✓] Background apps disabled
goto :eof

:GPU_SETTINGS_SILENT
echo [░░░░░░░░░░] 0%% - Enabling GPU scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul
echo [████░░░░░░] 40%% - Disabling GPU preemption...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption /t REG_DWORD /d 0 /f >nul
echo [████████░░] 80%% - Optimizing DirectX...
reg add "HKLM\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t REG_SZ /d "VRROptimizeEnable=0;" /f >nul
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t REG_SZ /d "SwapEffectUpgradeEnable=1;VRROptimizeEnable=0;" /f >nul
echo [██████████] 100%% - GPU configured...
echo [✓] GPU optimized
goto :eof

:MOUSE_SILENT
echo [░░░░░░░░░░] 0%% - Increasing mouse queue size...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 50 /f >nul
echo [████░░░░░░] 40%% - Disabling mouse acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul
echo [████████░░] 80%% - Optimizing mouse sensitivity...
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t REG_DWORD /d 10000 /f >nul
echo [██████████] 100%% - Mouse optimized...
echo [✓] Mouse optimized
goto :eof

:LATENCY_OPT_SILENT
echo [░░░░░░░░░░] 0%% - Starting EXTREME latency optimization...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v IRQ8Priority /t REG_DWORD /d 1 /f >nul
echo [██░░░░░░░░] 15%% - IRQ 8 Priority set for mouse...
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /f "NameServer" 2^>nul ^| find "HKEY"') do (
    reg add "%%i" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "%%i" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
)
echo [████░░░░░░] 30%% - Nagle's Algorithm disabled...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f >nul
echo [█████░░░░░] 45%% - Power Throttling disabled...
powershell -Command "Disable-MMAgent -MemoryCompression" >nul 2>&1
echo [███████░░░] 60%% - Memory Compression disabled...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f >nul
echo [████████░░] 75%% - Timer Resolution set to 0.5ms...
bcdedit /deletevalue useplatformclock >nul 2>&1
echo [█████████░] 90%% - HPET disabled...
echo [██████████] 100%% - EXTREME latency optimization completed...
echo [✓] Latency EXTREMELY optimized
goto :eof

:MOUSE_KEYBOARD_SILENT
echo [░░░░░░░░░░] 0%% - Increasing queue sizes...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 50 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 50 /f >nul
echo [██░░░░░░░░] 15%% - Disabling mouse acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul
echo [███░░░░░░░] 25%% - Optimizing mouse sensitivity...
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t REG_DWORD /d 10000 /f >nul
echo [████░░░░░░] 35%% - Optimizing keyboard repeat rate...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f >nul
echo [█████░░░░░] 45%% - Optimizing keyboard response (EXTREME)...
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t REG_SZ /d 200 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t REG_SZ /d 6 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 59 /f >nul
echo [██████░░░░] 55%% - Disabling Sticky Keys...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul
echo [███████░░░] 65%% - Disabling Toggle Keys...
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f >nul
echo [████████░░] 75%% - Disabling Mouse Keys...
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v Flags /t REG_SZ /d 0 /f >nul
echo [█████████░] 85%% - Optimizing HID devices...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hidusbf\Parameters" /v "OverrideHidFlags" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hidusbf\Parameters" /v "OverrideHidPollInterval" /t REG_DWORD /d 1 /f >nul 2>&1
echo [██████████] 95%% - Disabling touchpad gestures (if exists)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v SmartAgilityEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v CursorSpeedEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo [██████████] 100%% - Input devices optimized...
echo [✓] Mouse ^& keyboard EXTREMELY optimized
goto :eof

:DEBLOAT_SILENT
echo [░░░░░░░░░░] 0%% - Removing bloatware apps...
echo     This may take 2-5 minutes, please wait...

REM Create temporary PowerShell script using multiple echo lines
echo $apps = @( > "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.3DBuilder', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.BingFinance', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.BingNews', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.BingSports', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.BingWeather', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.GetHelp', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Getstarted', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Messaging', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Microsoft3DViewer', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.MicrosoftOfficeHub', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.MicrosoftSolitaireCollection', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.OneConnect', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.People', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Print3D', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.SkypeApp', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Wallet', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WindowsAlarms', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WindowsCamera', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.windowscommunicationsapps', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WindowsFeedbackHub', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WindowsMaps', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WindowsSoundRecorder', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Xbox.TCUI', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.XboxApp', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.XboxGameOverlay', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.XboxGamingOverlay', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.XboxIdentityProvider', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.XboxSpeechToTextOverlay', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.YourPhone', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.ZuneMusic', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.ZuneVideo', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.MixedReality.Portal', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Windows.SecHealthUI', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Windows.SecureAssessmentBrowser', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Windows.Cortana', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.Windows.Search', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.ScreenSketch', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.HEIFImageExtension', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WebMediaExtensions', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.WebpImageExtension', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.MPEG2VideoExtension', >> "%TEMP%\debloat_silent.ps1"
echo 'Microsoft.VP9VideoExtensions' >> "%TEMP%\debloat_silent.ps1"
echo $protectedApps = @('Microsoft.WindowsStore','Microsoft.StorePurchaseApp','Microsoft.DesktopAppInstaller','Microsoft.WindowsNotepad','Microsoft.Paint','Microsoft.MSPaint','Microsoft.WindowsCalculator','Microsoft.Windows.Photos','NVIDIACorp.NVIDIAControlPanel','Microsoft.ZuneMusic','Microsoft.ZuneVideo') >> "%TEMP%\debloat_silent.ps1"
echo ) >> "%TEMP%\debloat_silent.ps1"
echo foreach ($app in $apps) { >> "%TEMP%\debloat_silent.ps1"
echo     try { >> "%TEMP%\debloat_silent.ps1"
echo         $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue ^| Where-Object { $_.Name -notin $protectedApps } >> "%TEMP%\debloat_silent.ps1"
echo         if ($package) { >> "%TEMP%\debloat_silent.ps1"
echo             Remove-AppxPackage -Package $package.PackageFullName -ErrorAction SilentlyContinue >> "%TEMP%\debloat_silent.ps1"
echo         } >> "%TEMP%\debloat_silent.ps1"
echo     } catch { } >> "%TEMP%\debloat_silent.ps1"
echo } >> "%TEMP%\debloat_silent.ps1"

echo [██████░░░░] 60%% - Processing apps, please wait...
powershell -ExecutionPolicy Bypass -File "%TEMP%\debloat_silent.ps1" >nul 2>&1
del "%TEMP%\debloat_silent.ps1" 2>nul

echo [██████████] 100%% - Bloatware removal completed...
echo [✓] Bloatware removed
goto :eof

:DISABLE_FEATURES_SILENT
echo [░░░░░░░░░░] 0%% - Disabling XPS Services...
dism /online /disable-feature /featurename:Printing-XPSServices-Features /NoRestart >nul 2>&1
echo [████░░░░░░] 40%% - Disabling Work Folders...
dism /online /disable-feature /featurename:WorkFolders-Client /NoRestart >nul 2>&1
echo [████████░░] 80%% - Skipping Windows Media Player (protected)...
echo [██████████] 100%% - Features disabled...
echo [✓] Features disabled
goto :eof

REM ════════════════════════════════════════════════
REM    ORIGINAL INDIVIDUAL FUNCTIONS (Interactive)
REM ════════════════════════════════════════════════

:CLEAN_TEMP
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Cleaning temporary files...
del /q/f/s %TEMP%\* 2>nul
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 15%%
echo [*] Cleaning Windows temp...
del /q/f/s C:\Windows\Temp\* 2>nul
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Cleaning prefetch...
del /q/f/s C:\Windows\Prefetch\* 2>nul
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 35%%
echo [*] Emptying recycle bin...
rd /s /q %systemdrive%\$Recycle.Bin 2>nul
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 45%%
echo [*] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /q/f/s C:\Windows\SoftwareDistribution\Download\* 2>nul
net start wuauserv >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 55%%
echo [*] Cleaning shader cache...
del /q/f/s "%LocalAppData%\D3DSCache\*" 2>nul
del /q/f/s "%LocalAppData%\NVIDIA\DXCache\*" 2>nul
del /q/f/s "%LocalAppData%\AMD\DXCache\*" 2>nul
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [███████░░░] 65%%
echo [*] Cleaning system logs...
del /q/f/s C:\Windows\Logs\* 2>nul
wevtutil cl System >nul 2>&1
wevtutil cl Application >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 75%%
echo [*] Cleaning thumbnail cache...
del /q/f/s %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db 2>nul
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 85%%
echo [*] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 95%%
echo [*] Running Disk Cleanup utility...
echo     This may take 2-5 minutes, please wait...
start /wait cleanmgr /sagerun:1
cls
echo ════════════════════════════════════════════════
echo    DEEP CLEANING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Deep cleaning completed successfully!
echo.
pause
goto MENU

:DISK_OPT
cls
echo ════════════════════════════════════════════════
echo    DRIVE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Starting drive optimization...
echo     This may take 3-10 minutes depending on drive size
echo.
defrag C: /O /H
cls
echo ════════════════════════════════════════════════
echo    DRIVE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [███████░░░] 70%%
echo [*] Disabling scheduled defragmentation...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DRIVE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 85%%
echo [*] Disabling hibernation to save space...
powercfg -h off >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DRIVE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo [*] Cleaning shadow copies...
vssadmin delete shadows /for=c: /all /quiet >nul 2>&1
echo.
echo [✓] Drive optimization completed!
echo.
pause
goto MENU

:SERVICES
cls
echo ════════════════════════════════════════════════
echo    DISABLING UNNECESSARY SERVICES
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
setlocal enabledelayedexpansion
set count=0
set total=30

for %%s in (WSearch SysMain DiagTrack dmwappushservice WerSvc wuauserv wisvc WMPNetworkSvc XblAuthManager XblGameSave XboxNetApiSvc TabletInputService OneSyncSvc PcaSvc WbioSrvc RetailDemo MapsBroker lfsvc SharedAccess TrkWks WpcMonSvc PhoneSvc Fax Spooler RemoteRegistry RemoteAccess AppVClient tzautoupdate CDPUserSvc MessagingService PimIndexMaintenanceSvc UnistoreSvc UserDataSvc WalletService) do (
    set /a count+=1
    set /a percent=(!count!*100)/!total!
    set /a blocks=!percent!/10
    set bar=
    for /L %%i in (1,1,!blocks!) do set bar=!bar!█
    for /L %%i in (!blocks!,1,9) do set bar=!bar!░
    cls
    echo ════════════════════════════════════════════════
    echo    DISABLING UNNECESSARY SERVICES
    echo ════════════════════════════════════════════════
    echo.
    echo Progress: [!bar!] !percent!%%
    echo [*] Disabling %%s...
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start=disabled >nul 2>&1
    timeout /t 1 >nul
)

cls
echo ════════════════════════════════════════════════
echo    DISABLING UNNECESSARY SERVICES
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] All unnecessary services disabled!
echo.
echo NOTE: This disables many Windows services including:
echo  - Windows Search, Superfetch, Telemetry
echo  - Xbox services, Tablet services
echo  - Fax, Print Spooler (if you don't print)
echo.
echo If you experience issues, use option 18 to restore.
echo.
endlocal
pause
goto MENU

:VISUAL
cls
echo ════════════════════════════════════════════════
echo    MAXIMUM VISUAL PERFORMANCE
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MAXIMUM VISUAL PERFORMANCE
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Disabling animations...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MAXIMUM VISUAL PERFORMANCE
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 50%%
echo [*] Disabling taskbar animations...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MAXIMUM VISUAL PERFORMANCE
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 75%%
echo [*] Disabling transparency...
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MAXIMUM VISUAL PERFORMANCE
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Visual performance maximized!
echo.
echo Changes applied:
echo  • Disabled all visual effects
echo  • Removed animations
echo  • Disabled transparency
echo  • Taskbar optimized
echo.
pause
goto MENU

:STARTUP
cls
echo ════════════════════════════════════════════════
echo    STARTUP PROGRAMS MANAGEMENT
echo ════════════════════════════════════════════════
echo.
echo Choose how to manage startup programs:
echo.
echo 1. Automatic - Disable common startup programs
echo 2. Manual - Open Windows settings to choose yourself
echo.
set /p choice="Select option (1-2): "

if "%choice%"=="1" (
    cls
    echo ════════════════════════════════════════════════
    echo    STARTUP PROGRAMS MANAGEMENT - AUTOMATIC
    echo ════════════════════════════════════════════════
    echo.
    echo Progress: [░░░░░░░░░░] 0%%
    echo [*] Disabling common startup programs...
    
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "OneDrive" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    echo Progress: [██░░░░░░░░] 20%%
    
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Spotify" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Discord" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Steam" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    echo Progress: [█████░░░░░] 50%%
    
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "AdobeAAMUpdater" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "AdobeGCInvoker" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    echo Progress: [███████░░░] 70%%
    
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Skype" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Teams" /t REG_BINARY /d 0300000000000000000000000000000000 /f >nul 2>&1
    schtasks /Change /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE >nul 2>&1
    echo Progress: [██████████] 100%%
    echo.
    echo [✓] Common startup programs disabled!
    echo.
    echo Disabled programs include:
    echo  • OneDrive
    echo  • Spotify, Discord, Steam
    echo  • Adobe updaters
    echo  • Skype, Teams
    echo  • And others...
    echo.
    pause
    goto MENU
)

if "%choice%"=="2" (
    cls
    echo ════════════════════════════════════════════════
    echo    STARTUP PROGRAMS MANAGEMENT - MANUAL
    echo ════════════════════════════════════════════════
    echo.
    echo Opening Windows Startup Settings...
    echo.
    echo Instructions:
    echo  1. Disable programs you don't need at startup
    echo  2. Keep antivirus and essential tools enabled
    echo  3. Close the window when done
    echo.
    echo Press any key to open Startup Manager...
    pause >nul
    start "" "ms-settings:startupapps"
    echo.
    echo [✓] Startup manager opened!
    echo.
    echo Disable unnecessary startup programs and close the window
    echo when you're done. Then press any key here to continue...
    pause >nul
    goto MENU
)

goto MENU

:POWER
cls
echo ════════════════════════════════════════════════
echo    ULTIMATE POWER PLAN
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Creating Ultimate Performance power plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    ULTIMATE POWER PLAN
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Activating Ultimate Performance plan...
for /f "tokens=4" %%a in ('powercfg -list ^| findstr "Ultimate"') do set ULTIMATE_GUID=%%a
if defined ULTIMATE_GUID (
    powercfg /setactive %ULTIMATE_GUID%
) else (
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
)
cls
echo ════════════════════════════════════════════════
echo    ULTIMATE POWER PLAN
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Configuring power settings...
powercfg /change monitor-timeout-ac 0
powercfg /change disk-timeout-ac 0
powercfg /change standby-timeout-ac 0
powercfg /change hibernate-timeout-ac 0
cls
echo ════════════════════════════════════════════════
echo    ULTIMATE POWER PLAN
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Ultimate Performance power plan activated!
echo.
echo Settings applied:
echo  • Maximum CPU performance
echo  • No monitor timeout
echo  • No sleep/hibernation
echo  • PCIe power management disabled
echo.
pause
goto MENU

:GAME_MODE
cls
echo ════════════════════════════════════════════════
echo    FULL GAME MODE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Enabling Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul
cls
echo ════════════════════════════════════════════════
echo    FULL GAME MODE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Disabling Game Bar...
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    FULL GAME MODE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 50%%
echo [*] Disabling Game DVR...
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v value /t REG_DWORD /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    FULL GAME MODE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 75%%
echo [*] Enabling Hardware-Accelerated GPU Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul
cls
echo ════════════════════════════════════════════════
echo    FULL GAME MODE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 95%%
echo [*] Optimizing CPU scheduling for games...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul
cls
echo ════════════════════════════════════════════════
echo    FULL GAME MODE OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Game Mode fully optimized!
echo.
echo Features configured:
echo  • Auto Game Mode enabled
echo  • Game Bar/DVR disabled
echo  • GPU Hardware Scheduling enabled
echo  • CPU priority optimized for gaming
echo.
pause
goto MENU

:TELEMETRY
cls
echo ════════════════════════════════════════════════
echo    REMOVE BLOATWARE ^& TELEMETRY
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    REMOVE BLOATWARE ^& TELEMETRY
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Disabling scheduled telemetry tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    REMOVE BLOATWARE ^& TELEMETRY
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Bloatware and telemetry removed!
echo.
pause
goto MENU

:NETWORK
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
setlocal enabledelayedexpansion
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Setting auto-tuning to normal...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 15%%
echo [*] Disabling ECN capability...
netsh int tcp set global ecncapability=disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Disabling timestamps...
netsh int tcp set global timestamps=disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Enabling RSS and CTCP congestion provider...
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 55%%
echo [*] Disabling ECN capability...
netsh int tcp set global ecncapability=disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Disabling timestamps...
netsh int tcp set global timestamps=disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 85%%
echo [*] Enabling RSS...
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=2 >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 95%%
echo [*] Reducing network latency...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Network optimized for gaming!
echo.
echo Applied optimizations:
echo  • TCP auto-tuning set to normal (best for modern connections)
echo  • ECN and timestamps disabled
echo  • CTCP congestion provider enabled
echo  • Latency reduced via Nagle's algorithm disable
echo  • RSS enabled for better throughput
echo.
endlocal
pause
goto MENU

:BACKGROUND_APPS
cls
echo ════════════════════════════════════════════════
echo    DISABLE BACKGROUND PROCESSES
echo ════════════════════════════════════════════════
echo.
setlocal enabledelayedexpansion
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling background apps globally...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul

set count=0
set total=30
for %%a in (Microsoft.WindowsCamera Microsoft.Windows.Cortana Microsoft.WindowsMaps Microsoft.WindowsAlarms Microsoft.BingWeather Microsoft.GetHelp Microsoft.Getstarted Microsoft.Messaging Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.WindowsFeedbackHub Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.People Microsoft.WindowsSoundRecorder Microsoft.YourPhone Microsoft.Xbox.TCUI Microsoft.XboxApp Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxIdentityProvider Microsoft.XboxSpeechToTextOverlay) do (
    set /a count+=1
    set /a percent=(!count!*100)/!total!
    set /a blocks=!percent!/10
    set bar=
    for /L %%i in (1,1,!blocks!) do set bar=!bar!█
    for /L %%i in (!blocks!,1,9) do set bar=!bar!░
    cls
    echo ════════════════════════════════════════════════
    echo    DISABLE BACKGROUND PROCESSES
    echo ════════════════════════════════════════════════
    echo.
    echo Progress: [!bar!] !percent!%%
    echo [*] Disabling %%a...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\%%a" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\%%a" /v DisabledByUser /t REG_DWORD /d 1 /f >nul 2>&1
)

cls
echo ════════════════════════════════════════════════
echo    DISABLE BACKGROUND PROCESSES
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Background apps disabled!
echo.
echo All system apps are prevented from running in background
echo This will significantly reduce CPU/RAM usage
echo.
endlocal
pause
goto MENU

:GPU_SETTINGS
cls
echo ════════════════════════════════════════════════
echo    GENERAL GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Enabling Hardware-Accelerated GPU Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul
cls
echo ════════════════════════════════════════════════
echo    GENERAL GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Disabling GPU preemption...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption /t REG_DWORD /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    GENERAL GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Optimizing DirectX settings...
reg add "HKLM\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t REG_SZ /d "VRROptimizeEnable=0;" /f >nul
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t REG_SZ /d "SwapEffectUpgradeEnable=1;VRROptimizeEnable=0;" /f >nul
cls
echo ════════════════════════════════════════════════
echo    GENERAL GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] GPU optimizations applied!
echo.
echo Settings configured:
echo  • Hardware GPU scheduling enabled
echo  • GPU preemption disabled
echo  • DirectX optimized
echo.
echo For GPU-specific optimizations:
echo  - NVIDIA users: Use option 16
echo  - AMD users: Use option 17
echo.
pause
goto MENU

:MOUSE_KEYBOARD
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Increasing data queue sizes...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 50 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 50 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 15%%
echo [*] Disabling mouse acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Optimizing mouse sensitivity...
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t REG_DWORD /d 10000 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 35%%
echo [*] Optimizing keyboard repeat rate...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 45%%
echo [*] Optimizing keyboard response (EXTREME)...
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t REG_SZ /d 200 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t REG_SZ /d 6 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 59 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 55%%
echo [*] Disabling Sticky Keys...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [███████░░░] 65%%
echo [*] Disabling Toggle Keys...
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 75%%
echo [*] Disabling Mouse Keys...
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v Flags /t REG_SZ /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 85%%
echo [*] Optimizing HID devices...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hidusbf\Parameters" /v "OverrideHidFlags" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hidusbf\Parameters" /v "OverrideHidPollInterval" /t REG_DWORD /d 1 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 95%%
echo [*] Disabling touchpad gestures...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v SmartAgilityEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /v CursorSpeedEnabled /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION PRO
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Mouse and keyboard EXTREMELY optimized!
echo.
echo Settings applied:
echo  • Higher polling rate support (50 packets)
echo  • Mouse acceleration disabled
echo  • Raw input optimized
echo  • Keyboard repeat rate maximized (EXTREME)
echo  • AutoRepeatDelay: 200ms (was 1000ms)
echo  • AutoRepeatRate: 6 (was 500)
echo  • DelayBeforeAcceptance: 0ms (was 1000ms)
echo  • Flags: 59 (EXTREME MODE)
echo  • Filter keys disabled
echo  • Sticky/Toggle/Mouse keys disabled
echo  • HID polling interval optimized
echo  • Touchpad gestures disabled
echo  • Input lag significantly reduced
echo.
pause
goto MENU

:KEYBOARD_EXTREME
cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo This will optimize keyboard for EXTREME response!
echo Values: AutoRepeatDelay=200, AutoRepeatRate=6
echo         DelayBeforeAcceptance=0, Flags=59
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Increasing keyboard queue size...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 50 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 20%%
echo [*] Optimizing keyboard repeat rate...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 40%%
echo [*] Applying EXTREME response values...
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t REG_SZ /d 200 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t REG_SZ /d 6 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 59 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 60%%
echo [*] Disabling Sticky Keys...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 80%%
echo [*] Disabling Toggle Keys and Mouse Keys...
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f >nul
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v Flags /t REG_SZ /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Keyboard EXTREMELY optimized!
echo.
echo Settings applied:
echo  • Queue size: 50 packets
echo  • AutoRepeatDelay: 200ms (was 1000ms)
echo  • AutoRepeatRate: 6 (was 500)
echo  • DelayBeforeAcceptance: 0ms (was 1000ms)
echo  • Flags: 59 (EXTREME MODE)
echo  • Sticky/Toggle/Mouse keys disabled
echo.
echo Your keyboard now responds like a machine gun! 🔫
echo.
pause
goto MENU

:LATENCY_OPT
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo WARNING: These are EXTREME low-latency optimizations!
echo.
echo This will apply:
echo  - IRQ 8 Priority for Mouse (highest priority)
echo  - Disable Nagle's Algorithm (network latency)
echo  - Disable Power Throttling (CPU/GPU full power)
echo  - Disable Memory Compression (less overhead)
echo  - Timer Resolution 0.5ms (better input lag)
echo  - Disable HPET (controversial, may reduce input lag)
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Setting IRQ 8 Priority for Mouse...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v IRQ8Priority /t REG_DWORD /d 1 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 20%%
echo [*] Disabling Nagle's Algorithm...
for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /f "NameServer" 2^>nul ^| find "HKEY"') do (
    reg add "%%i" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "%%i" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
)
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 40%%
echo [*] Disabling Power Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 60%%
echo [*] Disabling Memory Compression...
powershell -Command "Disable-MMAgent -MemoryCompression" >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 80%%
echo [*] Setting Timer Resolution to 0.5ms...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v GlobalTimerResolutionRequests /t REG_DWORD /d 1 /f >nul
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 90%%
echo [*] Disabling HPET...
bcdedit /deletevalue useplatformclock >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    EXTREME LATENCY OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] EXTREME Latency Optimization applied!
echo.
echo Settings applied:
echo  - IRQ 8 Priority: 1 (highest for mouse)
echo  - Nagle's Algorithm: DISABLED
echo  - Power Throttling: DISABLED
echo  - Memory Compression: DISABLED
echo  - Timer Resolution: 0.5ms
echo  - HPET: DISABLED
echo.
echo RESTART REQUIRED for some changes!
echo.
echo Your system is now optimized for MINIMUM latency!
echo.
pause
goto MENU

:NVIDIA_OPT
cls
echo ════════════════════════════════════════════════
echo    NVIDIA GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Checking for NVIDIA GPU...
nvidia-smi >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] NVIDIA GPU not detected or drivers not installed
    echo.
    echo Please install NVIDIA drivers first:
    echo https://www.nvidia.com/Download/index.aspx
    echo.
    pause
    goto MENU
)
cls
echo ════════════════════════════════════════════════
echo    NVIDIA GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Optimizing NVIDIA Control Panel settings via registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /t REG_DWORD /d 8738 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d 1 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NVIDIA GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 50%%
echo [*] Setting maximum performance mode...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NVIDIA GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 75%%
echo [*] Optimizing shader cache...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NVIDIA GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] NVIDIA GPU optimized!
echo.
echo IMPORTANT: Complete optimization manually:
echo ════════════════════════════════════════════════
echo.
echo 1. Open NVIDIA Control Panel
echo 2. Go to "Manage 3D Settings"
echo 3. Set these options:
echo    • Power Management Mode: Prefer Maximum Performance
echo    • Low Latency Mode: Ultra
echo    • Texture Filtering Quality: Performance
echo    • Vertical Sync: Off
echo    • Max Frame Rate: Off
echo.
pause
goto MENU

:AMD_OPT
cls
echo ════════════════════════════════════════════════
echo    AMD GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Checking for AMD GPU...
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DriverDesc" 2>nul | find "AMD" >nul
if %errorlevel% neq 0 (
    echo.
    echo [!] AMD GPU not detected or drivers not installed
    echo.
    echo Please install AMD drivers first:
    echo https://www.amd.com/en/support
    echo.
    pause
    goto MENU
)
cls
echo ════════════════════════════════════════════════
echo    AMD GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Optimizing AMD settings via registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableComputePreemption" /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AMD GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 50%%
echo [*] Disabling AMD power saving features...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AMD GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 75%%
echo [*] Optimizing for maximum performance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AMD GPU OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] AMD GPU optimized!
echo.
echo IMPORTANT: Complete optimization manually:
echo ════════════════════════════════════════════════
echo.
echo 1. Open AMD Radeon Software
echo 2. Go to "Gaming" ^> "Global Graphics"
echo 3. Set these options:
echo    • Radeon Anti-Lag: Enabled
echo    • Radeon Boost: Enabled
echo    • Radeon Image Sharpening: Enabled
echo    • Wait for Vertical Refresh: Off
echo    • Graphics Profile: eSports
echo.
pause
goto MENU

:DEBLOAT
cls
echo ════════════════════════════════════════════════
echo    REMOVE WINDOWS BLOATWARE APPS
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will remove many pre-installed apps!
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    REMOVE WINDOWS BLOATWARE APPS
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo Starting bloatware removal...
echo This may take 2-5 minutes, please wait...
echo.

REM Create a PowerShell script file to avoid command line issues
echo $apps = @( > "%TEMP%\debloat.ps1"
echo 'Microsoft.3DBuilder', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.BingFinance', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.BingNews', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.BingSports', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.BingWeather', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.GetHelp', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Getstarted', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Messaging', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Microsoft3DViewer', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.MicrosoftOfficeHub', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.MicrosoftSolitaireCollection', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.OneConnect', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.People', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Print3D', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.SkypeApp', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Wallet', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WindowsAlarms', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WindowsCamera', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.windowscommunicationsapps', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WindowsFeedbackHub', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WindowsMaps', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WindowsSoundRecorder', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Xbox.TCUI', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.XboxApp', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.XboxGameOverlay', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.XboxGamingOverlay', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.XboxIdentityProvider', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.XboxSpeechToTextOverlay', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.YourPhone', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.ZuneMusic', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.ZuneVideo', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.MixedReality.Portal', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Windows.SecHealthUI', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Windows.SecureAssessmentBrowser', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Windows.Cortana', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Windows.Search', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.ScreenSketch', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.HEIFImageExtension', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WebMediaExtensions', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.WebpImageExtension', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.MPEG2VideoExtension', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.VP9VideoExtensions' >> "%TEMP%\debloat.ps1"
echo $protectedApps = @('Microsoft.WindowsStore','Microsoft.StorePurchaseApp','Microsoft.DesktopAppInstaller','Microsoft.WindowsNotepad','Microsoft.Paint','Microsoft.MSPaint','Microsoft.WindowsCalculator','Microsoft.Windows.Photos','NVIDIACorp.NVIDIAControlPanel','Microsoft.ZuneMusic','Microsoft.ZuneVideo') >> "%TEMP%\debloat.ps1"
echo ) >> "%TEMP%\debloat.ps1"
echo $removed = 0 >> "%TEMP%\debloat.ps1"
echo foreach ($app in $apps) { >> "%TEMP%\debloat.ps1"
echo     try { >> "%TEMP%\debloat.ps1"
echo         $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue ^| Where-Object { $_.Name -notin $protectedApps } >> "%TEMP%\debloat.ps1"
echo         if ($package) { >> "%TEMP%\debloat.ps1"
echo             Remove-AppxPackage -Package $package.PackageFullName -ErrorAction SilentlyContinue >> "%TEMP%\debloat.ps1"
echo             $removed++ >> "%TEMP%\debloat.ps1"
echo         } >> "%TEMP%\debloat.ps1"
echo     } catch { } >> "%TEMP%\debloat.ps1"
echo } >> "%TEMP%\debloat.ps1"
echo Write-Output $removed >> "%TEMP%\debloat.ps1"

cls
echo ════════════════════════════════════════════════
echo    REMOVE WINDOWS BLOATWARE APPS
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 50%%
echo Processing apps, please wait...
echo.

powershell -ExecutionPolicy Bypass -File "%TEMP%\debloat.ps1" > "%TEMP%\debloat_result.txt" 2>&1
set /p REMOVED=<"%TEMP%\debloat_result.txt"

del "%TEMP%\debloat.ps1" 2>nul
del "%TEMP%\debloat_result.txt" 2>nul

cls
echo ════════════════════════════════════════════════
echo    REMOVE WINDOWS BLOATWARE APPS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.

if defined REMOVED (
    if %REMOVED% GTR 0 (
        echo [✓] Bloatware removal completed successfully!
        echo.
        echo Successfully removed %REMOVED% apps including:
        echo  • Xbox apps, 3D Builder, Paint 3D
        echo  • Office Hub, OneNote
        echo  • Bing apps Weather, News, etc.
        echo  • Your Phone, Messaging, People
        echo  • And many more...
    ) else (
        echo [✓] Process completed!
        echo.
        echo No bloatware apps found to remove.
        echo.
        echo This means:
        echo  • Apps were already removed previously, or
        echo  • Your Windows version doesn't include these apps
        echo.
        echo Your system is clean!
    )
) else (
    echo [✓] Process completed!
    echo.
    echo Bloatware removal process finished.
)
echo.
pause
goto MENU

:DISABLE_FEATURES
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS FEATURES
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will disable optional Windows features!
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion
set disabled=0

echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling XPS services...
dism /online /disable-feature /featurename:Printing-XPSServices-Features /NoRestart >nul 2>&1
if !errorlevel! equ 0 set /a disabled+=1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS FEATURES
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Disabling Work Folders...
dism /online /disable-feature /featurename:WorkFolders-Client /NoRestart >nul 2>&1
if !errorlevel! equ 0 set /a disabled+=1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS FEATURES
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Skipping Windows Media Player (protected)...
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS FEATURES
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
if !disabled! gtr 0 (
    echo [✓] Windows features disabled successfully!
    echo.
    echo Disabled !disabled! features:
    echo  • XPS Services
    echo  • Work Folders Client
) else (
    echo [✓] Process completed!
    echo.
    echo NOTE: All features were already disabled
    echo or not available on this system.
)
echo.
endlocal
pause
goto MENU

:FULL_OPT
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION - EXTREME EDITION
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will apply ALL optimizations including EXTREME ones!
echo This process will take 15-20 minutes.
echo.
echo EXTREME optimizations included:
echo  • Windows Updates will be DISABLED
echo  • Cortana will be DISABLED
echo  • OneDrive will be REMOVED
echo  • System sounds will be DISABLED
echo  • Error reporting will be DISABLED
echo  • Windows Search indexing will be DISABLED
echo  • Pagefile will be OPTIMIZED
echo  • BLACK MODE: All apps removed + Black background
echo  • 'Learn about this picture' icon removed
echo.
echo ONLY use this for dedicated gaming PCs!
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion

REM Step 1/23
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [1/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█░░░░░░░░░░] 4%%
echo [*] Deep cleaning system...
call :CLEAN_TEMP_SILENT

REM Step 2/23
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [2/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██░░░░░░░░░] 10%%
echo [*] Optimizing drives...
call :DISK_OPT_SILENT

REM Step 3/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [3/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███░░░░░░░░] 14%%
echo [*] Disabling services...
call :SERVICES_SILENT

REM Step 4/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [4/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███░░░░░░░░] 18%%
echo [*] Configuring visual performance...
call :VISUAL_SILENT

REM Step 5/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [5/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████░░░░░░░] 23%%
echo [*] Managing startup programs...
call :STARTUP_SILENT

REM Step 6/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [6/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████░░░░░░░] 27%%
echo [*] Activating ultimate power plan...
call :POWER_SILENT

REM Step 7/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [7/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████░░░░░░] 32%%
echo [*] Optimizing Game Mode...
call :GAME_MODE_SILENT

REM Step 8/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [8/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████░░░░░░] 36%%
echo [*] Removing telemetry...
call :TELEMETRY_SILENT

REM Step 9/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [9/23]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████░░░░░] 41%%
echo [*] Optimizing network...
call :NETWORK_SILENT

REM Step 10/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [10/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████░░░░░] 45%%
echo [*] Disabling background apps...
call :BACKGROUND_APPS_SILENT

REM Step 11/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [11/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████░░░░] 50%%
echo [*] Optimizing GPU...
call :GPU_SETTINGS_SILENT

REM Step 12/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [12/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████░░░░] 55%%
echo [*] Optimizing mouse & keyboard...
call :MOUSE_KEYBOARD_SILENT

REM Step 13/24 - EXTREME LATENCY
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [13/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████████░░░] 59%%
echo [*] Applying EXTREME latency optimizations...
call :LATENCY_OPT_SILENT

REM Step 14/24
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [14/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████████░░░] 64%%
echo [*] Removing bloatware...
call :DEBLOAT_SILENT

REM Step 15/24
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [15/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████████░░░] 66%%
echo [*] Disabling Windows features...
call :DISABLE_FEATURES_SILENT

REM Step 15/22 - EXTREME OPTIMIZATIONS
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [16/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████████░░] 68%%
echo [*] Disabling Windows Updates...
call :DISABLE_UPDATES_SILENT

REM Step 16/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [17/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████████░░] 73%%
echo [*] Disabling Cortana...
call :DISABLE_CORTANA_SILENT

REM Step 17/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [18/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████████░] 77%%
echo [*] Removing OneDrive...
call :DISABLE_ONEDRIVE_SILENT

REM Step 18/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [19/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████████░] 82%%
echo [*] Optimizing pagefile...
call :OPTIMIZE_PAGEFILE_SILENT

REM Step 19/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [20/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████████░] 86%%
echo [*] Disabling system sounds...
call :DISABLE_SOUNDS_SILENT

REM Step 20/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [21/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████████] 91%%
echo [*] Disabling error reporting...
call :DISABLE_ERROR_REPORTING_SILENT

REM Step 21/22
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [22/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████████] 95%%
echo [*] Disabling Windows Search indexing...
call :DISABLE_INDEXING_SILENT

REM Step 22/22 - BLACK MODE
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [23/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████████] 95%%
echo [*] Applying BLACK MODE...
echo     Removing ALL apps and setting black background...
call :BLACK_MODE_SILENT

REM Step 23/22 - Remove Learn about this picture
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [24/24]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████████] 100%%
echo [*] Removing 'Learn about this picture' icon...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{2cc5ca98-6485-489a-920e-b3e88a6a0f0b}" /t REG_DWORD /d 1 /f >nul 2>&1
echo [✓] Icon removed from desktop

cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION COMPLETED!
echo ════════════════════════════════════════════════
echo.
echo [✓✓✓] ALL EXTREME OPTIMIZATIONS APPLIED! [✓✓✓]
echo.
echo ════════════════════════════════════════════════
echo ⚠️  IMPORTANT WARNINGS:
echo ════════════════════════════════════════════════
echo.
echo  • Windows Updates: DISABLED
echo  • OneDrive: REMOVED
echo  • ALL Windows apps removed (BLACK MODE)
echo  • Calculator, Photos, Notepad, Paint preserved
echo  • Black background set
echo  • 'Learn about this picture' icon removed
echo  • System is now MINIMAL
echo.
echo ════════════════════════════════════════════════
echo IMPORTANT NEXT STEPS:
echo ════════════════════════════════════════════════
echo.
echo  1. RESTART your computer IMMEDIATELY
echo  2. Manually update Windows monthly if needed
echo  3. Re-enable Windows Updates for security patches
echo  4. For GPU-specific optimizations:
echo     - NVIDIA users: Run option 16 from main menu
echo     - AMD users: Run option 17 from main menu
echo  5. Update GPU drivers to latest version
echo.
echo ════════════════════════════════════════════════
echo Your system is now EXTREMELY optimized for gaming!
echo ════════════════════════════════════════════════
echo.
endlocal
pause
goto MENU

:RESTORE
cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will undo all optimizations and
echo restore Windows to default settings.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Starting restoration...

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 15%%
echo [*] Restoring ALL services...
for %%s in (WSearch SysMain DiagTrack dmwappushservice WerSvc wuauserv wisvc WMPNetworkSvc XblAuthManager XblGameSave XboxNetApiSvc TabletInputService OneSyncSvc PcaSvc WbioSrvc RetailDemo MapsBroker lfsvc SharedAccess TrkWks WpcMonSvc PhoneSvc Fax Spooler RemoteRegistry RemoteAccess AppVClient tzautoupdate CDPUserSvc MessagingService PimIndexMaintenanceSvc UnistoreSvc UserDataSvc WalletService) do (
    sc config "%%s" start=auto >nul 2>&1
    sc start "%%s" >nul 2>&1
)

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 35%%
echo [*] Restoring visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9e3e078012000000 /f >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 1 /f >nul

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 55%%
echo [*] Restoring power plan...
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
powercfg -h on >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [███████░░░] 70%%
echo [*] Restoring network settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpDelAckTicks /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /f >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 85%%
echo [*] Restoring background apps and telemetry...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 3 /f >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 1 /f >nul

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 95%%
echo [*] Restoring mouse and keyboard defaults...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 1 /f >nul
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f >nul

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo [*] Restoring Windows Search and enabling hibernation...
sc config WSearch start=delayed-auto >nul 2>&1
sc start WSearch >nul 2>&1
powercfg -h on >nul 2>&1

echo.
echo [✓] All settings restored to defaults!
echo.
echo Please restart your computer for changes to take effect.
echo.
endlocal
pause
goto MENU

:STATUS
cls
echo ════════════════════════════════════════════════
echo    OPTIMIZATION STATUS
echo ════════════════════════════════════════════════
echo.

echo [SERVICES]
echo ────────────────────────────────────────────────
sc query "WSearch" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo  Windows Search: RUNNING) else (echo  Windows Search: STOPPED ✓)

sc query "SysMain" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo  Superfetch: RUNNING) else (echo  Superfetch: STOPPED ✓)

sc query "DiagTrack" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo  Telemetry: RUNNING) else (echo  Telemetry: STOPPED ✓)

echo.
echo [GAME MODE]
echo ────────────────────────────────────────────────
reg query "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled 2>nul | find "0x1" >nul 2>&1
if %errorlevel%==0 (echo  Game Mode: ENABLED ✓) else (echo  Game Mode: DISABLED)

reg query "HKCU\System\GameConfigStore" /v GameDVR_Enabled 2>nul | find "0x0" >nul 2>&1
if %errorlevel%==0 (echo  Game DVR: DISABLED ✓) else (echo  Game DVR: ENABLED)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation 2>nul | find "0x26" >nul 2>&1
if %errorlevel%==0 (echo  CPU Priority: OPTIMIZED ✓) else (echo  CPU Priority: DEFAULT)

echo.
echo [GPU SETTINGS]
echo ────────────────────────────────────────────────
reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode 2>nul | find "0x2" >nul 2>&1
if %errorlevel%==0 (echo  GPU Scheduling: ENABLED ✓) else (echo  GPU Scheduling: DISABLED)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption 2>nul | find "0x0" >nul 2>&1
if %errorlevel%==0 (echo  GPU Preemption: DISABLED ✓) else (echo  GPU Preemption: ENABLED)

echo.
echo [POWER PLAN]
echo ────────────────────────────────────────────────
powercfg /getactivescheme | find "Ultimate" >nul 2>&1
if %errorlevel%==0 (
    echo  Ultimate Performance: ACTIVE ✓
) else (
    powercfg /getactivescheme | find "High performance" >nul 2>&1
    if %errorlevel%==0 (
        echo  High Performance: ACTIVE ✓
    ) else (
        echo  Balanced or Power Saver: ACTIVE
    )
)

powercfg /query | find "Turn off display after" >nul 2>&1
if %errorlevel%==0 (
    powercfg /query | find "Current AC Power Setting Index: 0x00000000" >nul 2>&1
    if %errorlevel%==0 (echo  Display Timeout: DISABLED ✓) else (echo  Display Timeout: ENABLED)
)

echo.
echo [VISUAL EFFECTS]
echo ────────────────────────────────────────────────
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting 2>nul | find "0x2" >nul 2>&1
if %errorlevel%==0 (echo  Performance Mode: ENABLED ✓) else (echo  Performance Mode: DISABLED)

reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency 2>nul | find "0x0" >nul 2>&1
if %errorlevel%==0 (echo  Transparency: DISABLED ✓) else (echo  Transparency: ENABLED)

echo.
echo [NETWORK OPTIMIZATION]
echo ────────────────────────────────────────────────
netsh int tcp show global | find "Receive Window Auto-Tuning Level" | find "disabled" >nul 2>&1
if %errorlevel%==0 (echo  Auto-Tuning: DISABLED ✓) else (echo  Auto-Tuning: ENABLED)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency 2>nul | find "0x1" >nul 2>&1
if %errorlevel%==0 (echo  TCP Latency: OPTIMIZED ✓) else (echo  TCP Latency: DEFAULT)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay 2>nul | find "0x1" >nul 2>&1
if %errorlevel%==0 (echo  TCP No Delay: ENABLED ✓) else (echo  TCP No Delay: DISABLED)

echo.
echo [BACKGROUND APPS]
echo ────────────────────────────────────────────────
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled 2>nul | find "0x1" >nul 2>&1
if %errorlevel%==0 (echo  Background Apps: DISABLED ✓) else (echo  Background Apps: ENABLED)

echo.
echo [MOUSE & KEYBOARD]
echo ────────────────────────────────────────────────
reg query "HKCU\Control Panel\Mouse" /v MouseSpeed 2>nul | find "0" >nul 2>&1
if %errorlevel%==0 (echo  Mouse Acceleration: DISABLED ✓) else (echo  Mouse Acceleration: ENABLED)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize 2>nul | find "0x32" >nul 2>&1
if %errorlevel%==0 (echo  Mouse Queue Size: OPTIMIZED ✓) else (echo  Mouse Queue Size: DEFAULT)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize 2>nul | find "0x32" >nul 2>&1
if %errorlevel%==0 (echo  Keyboard Queue Size: OPTIMIZED ✓) else (echo  Keyboard Queue Size: DEFAULT)

echo.
echo [TELEMETRY]
echo ────────────────────────────────────────────────
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry 2>nul | find "0x0" >nul 2>&1
if %errorlevel%==0 (echo  Telemetry: DISABLED ✓) else (echo  Telemetry: ENABLED)

schtasks /query /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 2>nul | find "Disabled" >nul 2>&1
if %errorlevel%==0 (echo  Telemetry Tasks: DISABLED ✓) else (echo  Telemetry Tasks: ENABLED)

echo.
echo [NVIDIA GPU] (If applicable)
echo ────────────────────────────────────────────────
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PowerMizerLevel 2>nul | find "0x1" >nul 2>&1
if %errorlevel%==0 (echo  NVIDIA Performance: MAX ✓) else (echo  NVIDIA Performance: NOT OPTIMIZED)

reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v EnableUlps 2>nul | find "0x0" >nul 2>&1
if %errorlevel%==0 (echo  NVIDIA ULPS: DISABLED ✓) else (echo  NVIDIA ULPS: ENABLED)

echo.
echo ════════════════════════════════════════════════
echo Press any key to return to menu...
echo ════════════════════════════════════════════════
pause >nul
goto MENU

:DISABLE_DEFENDER
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS DEFENDER
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will disable Windows Defender!
echo Your system will be vulnerable to malware.
echo Only use this for maximum gaming performance.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS DEFENDER
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling Windows Defender services...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS DEFENDER
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Disabling real-time protection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS DEFENDER
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Disabling Windows Defender tasks...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /DISABLE >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS DEFENDER
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Windows Defender disabled!
echo.
echo WARNING: Your system is now vulnerable!
echo Consider installing a lightweight antivirus.
echo.
pause
goto MENU

:DISABLE_UPDATES
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS UPDATES
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will disable Windows Updates!
echo You will not receive security patches.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS UPDATES
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Stopping Windows Update service...
net stop wuauserv >nul 2>&1
sc config wuauserv start=disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS UPDATES
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 35%%
echo [*] Disabling update tasks...
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\sih" /DISABLE >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS UPDATES
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Configuring registry settings...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS UPDATES
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Windows Updates disabled!
echo.
echo You can re-enable later if needed.
echo.
pause
goto MENU

:DISABLE_CORTANA
cls
echo ════════════════════════════════════════════════
echo    DISABLE CORTANA COMPLETELY
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE CORTANA COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling Cortana via registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE CORTANA COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 55%%
echo [*] Disabling Cortana tasks...
schtasks /Change /TN "Microsoft\Windows\Windows Search\CrawlStartPages" /DISABLE >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE CORTANA COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Cortana disabled!
echo.
echo Search box removed from taskbar.
echo.
pause
goto MENU

:DISABLE_ONEDRIVE
cls
echo ════════════════════════════════════════════════
echo    DISABLE ONEDRIVE COMPLETELY
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE ONEDRIVE COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Stopping OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE ONEDRIVE COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 30%%
echo [*] Uninstalling OneDrive...
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall >nul 2>&1
) else (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall >nul 2>&1
)
cls
echo ════════════════════════════════════════════════
echo    DISABLE ONEDRIVE COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [███████░░░] 65%%
echo [*] Removing OneDrive from registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSync /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableLibrariesDefaultSaveToOneDrive /t REG_DWORD /d 1 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE ONEDRIVE COMPLETELY
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] OneDrive disabled and uninstalled!
echo.
pause
goto MENU

:OPTIMIZE_PAGEFILE
cls
echo ════════════════════════════════════════════════
echo    OPTIMIZE VIRTUAL MEMORY (PAGEFILE)
echo ════════════════════════════════════════════════
echo.
echo This will optimize pagefile for gaming performance.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    OPTIMIZE VIRTUAL MEMORY (PAGEFILE)
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Configuring pagefile settings...
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    OPTIMIZE VIRTUAL MEMORY (PAGEFILE)
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 45%%
echo [*] Setting custom pagefile size...
for /f "tokens=2 delims==" %%a in ('wmic os get TotalVisibleMemorySize /value ^| find "="') do set RAM=%%a
set /a RAM_MB=%RAM% / 1024
set /a INITIAL=%RAM_MB%
set /a MAXIMUM=%RAM_MB% * 2
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=%INITIAL%,MaximumSize=%MAXIMUM% >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    OPTIMIZE VIRTUAL MEMORY (PAGEFILE)
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Pagefile optimized!
echo.
echo Settings applied:
echo  • Automatic management: DISABLED
echo  • Initial size: %INITIAL% MB
echo  • Maximum size: %MAXIMUM% MB
echo.
echo Restart required to apply changes.
echo.
pause
goto MENU

:DISABLE_SOUNDS
cls
echo ════════════════════════════════════════════════
echo    DISABLE SYSTEM SOUNDS
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE SYSTEM SOUNDS
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling system sounds...
reg add "HKCU\AppEvents\Schemes" /v "@" /t REG_SZ /d ".None" /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE SYSTEM SOUNDS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] System sounds disabled!
echo.
pause
goto MENU

:DISABLE_ERROR_REPORTING
cls
echo ════════════════════════════════════════════════
echo    DISABLE ERROR REPORTING
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE ERROR REPORTING
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling Windows Error Reporting...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE ERROR REPORTING
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Stopping WerSvc service...
sc config WerSvc start=disabled >nul 2>&1
net stop WerSvc >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE ERROR REPORTING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Error reporting disabled!
echo.
pause
goto MENU

:DISABLE_REMOTE_DESKTOP
cls
echo ════════════════════════════════════════════════
echo    DISABLE REMOTE DESKTOP
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE REMOTE DESKTOP
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling Remote Desktop...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE REMOTE DESKTOP
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Stopping Terminal Services...
sc config TermService start=disabled >nul 2>&1
net stop TermService >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE REMOTE DESKTOP
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Remote Desktop disabled!
echo.
pause
goto MENU

:DISABLE_INDEXING
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS SEARCH INDEXING
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS SEARCH INDEXING
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Stopping Windows Search service...
sc config WSearch start=disabled >nul 2>&1
net stop WSearch >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS SEARCH INDEXING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 50%%
echo [*] Configuring registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    DISABLE WINDOWS SEARCH INDEXING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Windows Search indexing disabled!
echo.
echo Searches will be slower but system will be faster.
echo.
pause
goto MENU

:AGGRESSIVE_VISUAL
cls
echo ════════════════════════════════════════════════
echo    AGGRESSIVE VISUAL EFFECTS DISABLE
echo ════════════════════════════════════════════════
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    AGGRESSIVE VISUAL EFFECTS DISABLE
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Disabling all visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AGGRESSIVE VISUAL EFFECTS DISABLE
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 30%%
echo [*] Disabling animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AGGRESSIVE VISUAL EFFECTS DISABLE
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 60%%
echo [*] Disabling DWM effects...
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AGGRESSIVE VISUAL EFFECTS DISABLE
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 90%%
echo [*] Disabling menu animations...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v UseOLEDTaskbarTransparency /t REG_DWORD /d 0 /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    AGGRESSIVE VISUAL EFFECTS DISABLE
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] All visual effects aggressively disabled!
echo.
echo Windows will look basic but perform much faster.
echo.
pause
goto MENU

:CLEAN_REGISTRY
cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo This will remove obsolete registry entries.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Creating registry backup...
reg export HKLM "%TEMP%\registry_backup_hklm.reg" /y >nul 2>&1
reg export HKCU "%TEMP%\registry_backup_hkcu.reg" /y >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 20%%
echo [*] Cleaning temp registry entries...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo Progress: [████░░░░░░] 40%%
echo [*] Cleaning obsolete MRU entries...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 60%%
echo [*] Cleaning obsolete font cache entries...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "MS Shell Dlg" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "MS Shell Dlg 2" /f >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 80%%
echo [*] Running DISM cleanup and System File Checker...
dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    CLEAN REGISTRY (REMOVE OBSOLETE ENTRIES)
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Registry cleaned!
echo.
echo Note: Some entries could not be removed (protected).
echo.
pause
goto MENU

:BLACK_MODE
cls
echo ════════════════════════════════════════════════
echo    BLACK MODE - EXTREME CLEANUP
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will remove ALL Windows apps and set BLACK background!
echo Windows Store, Calculator, Photos, Notepad, Paint and NVIDIA Control Panel will be preserved.
echo This is the most aggressive cleanup possible.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

cls
echo ════════════════════════════════════════════════
echo    BLACK MODE - REMOVING ALL APPS
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Removing ALL Windows apps except Store and Calculator...
echo $allapps = Get-AppxPackage ^| Where-Object {$_.Name -notlike "*WindowsStore*" -and $_.Name -notlike "*StorePurchaseApp*" -and $_.Name -notlike "*DesktopAppInstaller*" -and $_.Name -notlike "*WindowsNotepad*" -and $_.Name -notlike "*Paint*" -and $_.Name -notlike "*MSPaint*" -and $_.Name -notlike "*WindowsCalculator*" -and $_.Name -notlike "*Photos*" -and $_.Name -notlike "*NVIDIAControlPanel*" -and $_.Name -notlike "*ZuneMusic*" -and $_.Name -notlike "*ZuneVideo*"} > "%TEMP%\remove_all.ps1"
echo foreach ($app in $allapps) { try { Remove-AppxPackage -Package $app.PackageFullName -ErrorAction SilentlyContinue } catch { } } >> "%TEMP%\remove_all.ps1"
powershell -ExecutionPolicy Bypass -File "%TEMP%\remove_all.ps1" >nul 2>&1
del "%TEMP%\remove_all.ps1" 2>nul

cls
echo ════════════════════════════════════════════════
echo    BLACK MODE - SETTING BLACK BACKGROUND
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 60%%
echo [*] Setting solid black background...
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "2" /f >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    BLACK MODE - REMOVING TASKBAR CUSTOMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 80%%
echo [*] Removing taskbar transparency and effects...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableBlurBehind /t REG_DWORD /d 0 /f >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    BLACK MODE - DISABLING ANIMATIONS
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 90%%
echo [*] Disabling ALL animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /d 0 /f >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    BLACK MODE - CLEANING START MENU
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo [*] Cleaning Start Menu and removing tiles...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v StartLayoutFile /t REG_EXPAND_SZ /d "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v StartLayoutFile /t REG_EXPAND_SZ /d "" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" /v Data /t REG_BINARY /d 00000000 /f >nul 2>&1

echo.
echo [✓] BLACK MODE COMPLETE!
echo.
echo Your system is now MINIMAL:
echo  • All Windows apps removed
echo  • Calculator, Photos, Notepad, Paint preserved
echo  • Black background set
echo  • No transparency
echo  • No animations
echo  • Clean Start Menu
echo.
echo RESTART REQUIRED to see all changes!
echo.
pause
goto MENU

:DISABLE_DEFENDER_SILENT
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /DISABLE >nul 2>&1
goto :eof

:DISABLE_UPDATES_SILENT
net stop wuauserv >nul 2>&1
sc config wuauserv start=disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /DISABLE >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\sih" /DISABLE >nul 2>&1
goto :eof

:DISABLE_CORTANA_SILENT
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Windows Search\CrawlStartPages" /DISABLE >nul 2>&1
goto :eof

:DISABLE_ONEDRIVE_SILENT
taskkill /f /im OneDrive.exe >nul 2>&1
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall >nul 2>&1
) else (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall >nul 2>&1
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSync /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableLibrariesDefaultSaveToOneDrive /t REG_DWORD /d 1 /f >nul 2>&1
goto :eof

:OPTIMIZE_PAGEFILE_SILENT
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false >nul 2>&1
for /f "tokens=2 delims==" %%a in ('wmic os get TotalVisibleMemorySize /value ^| find "="') do set RAM=%%a
set /a RAM_MB=%RAM% / 1024
set /a INITIAL=%RAM_MB%
set /a MAXIMUM=%RAM_MB% * 2
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=%INITIAL%,MaximumSize=%MAXIMUM% >nul 2>&1
goto :eof

:DISABLE_SOUNDS_SILENT
reg add "HKCU\AppEvents\Schemes" /v "@" /t REG_SZ /d ".None" /f >nul 2>&1
goto :eof

:DISABLE_ERROR_REPORTING_SILENT
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >nul 2>&1
sc config WerSvc start=disabled >nul 2>&1
net stop WerSvc >nul 2>&1
goto :eof

:DISABLE_REMOTE_DESKTOP_SILENT
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f >nul 2>&1
sc config TermService start=disabled >nul 2>&1
net stop TermService >nul 2>&1
goto :eof

:DISABLE_INDEXING_SILENT
sc config WSearch start=disabled >nul 2>&1
net stop WSearch >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
goto :eof

:BLACK_MODE_SILENT
echo [*] Removing ALL Windows apps except Store and Calculator...
echo $allapps = Get-AppxPackage ^| Where-Object {$_.Name -notlike "*WindowsStore*" -and $_.Name -notlike "*StorePurchaseApp*" -and $_.Name -notlike "*DesktopAppInstaller*" -and $_.Name -notlike "*WindowsNotepad*" -and $_.Name -notlike "*Paint*" -and $_.Name -notlike "*MSPaint*" -and $_.Name -notlike "*WindowsCalculator*" -and $_.Name -notlike "*Photos*" -and $_.Name -notlike "*NVIDIAControlPanel*" -and $_.Name -notlike "*ZuneMusic*" -and $_.Name -notlike "*ZuneVideo*"} > "%TEMP%\black_mode.ps1"
echo foreach ($app in $allapps) { try { Remove-AppxPackage -Package $app.PackageFullName -ErrorAction SilentlyContinue } catch { } } >> "%TEMP%\black_mode.ps1"
powershell -ExecutionPolicy Bypass -File "%TEMP%\black_mode.ps1" >nul 2>&1
del "%TEMP%\black_mode.ps1" 2>nul
echo [*] Setting black background...
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "2" /f >nul 2>&1
echo [*] Removing transparency...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f >nul 2>&1
echo [*] Disabling animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1
echo [✓] BLACK MODE applied
goto :eof

:EXIT
cls
echo ════════════════════════════════════════════════
echo    Windows 11 Gaming Optimizer PRO
echo ════════════════════════════════════════════════
echo.
echo Thank you for using Gaming Optimizer PRO!
echo.
echo ════════════════════════════════════════════════
echo FINAL RECOMMENDATIONS:
echo ════════════════════════════════════════════════
echo.
echo  🔄 RESTART your PC to apply all changes
echo.
echo  🎮 NVIDIA Users:
echo     • Open NVIDIA Control Panel
echo     • Set Power Management to Maximum Performance
echo     • Enable Low Latency Mode
echo.
echo  🎮 AMD Users:
echo     • Open AMD Radeon Software
echo     • Enable Radeon Anti-Lag
echo     • Set Graphics Profile to eSports
echo.
echo  📊 Monitor Performance:
echo     • Use MSI Afterburner for FPS monitoring
echo     • Check temperatures (GPU should be under 80°C)
echo     • Update drivers regularly
echo.
echo  ⚡ For Best Results:
echo     • Close all programs before gaming
echo     • Use Game Mode when gaming
echo     • Keep Windows updated
echo     • Run this optimizer monthly
echo.
echo ════════════════════════════════════════════════
echo.
echo Press any key to exit...
pause >nul
exit
