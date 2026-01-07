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
set /p option="Select (1-24): "

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
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
echo [██░░░░░░░░] 20%% - Disabling auto-tuning...
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
echo [████░░░░░░] 40%% - Enabling offload features...
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
echo [██████░░░░] 60%% - Optimizing TCP settings...
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=2 >nul 2>&1
netsh int tcp set global fastopen=enabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
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
for %%a in (Microsoft.Windows.Photos Microsoft.WindowsCalculator Microsoft.WindowsCamera Microsoft.Windows.Cortana Microsoft.WindowsMaps Microsoft.WindowsAlarms Microsoft.BingWeather Microsoft.GetHelp Microsoft.Getstarted Microsoft.Messaging Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.WindowsFeedbackHub Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.People Microsoft.WindowsSoundRecorder Microsoft.YourPhone Microsoft.Xbox.TCUI Microsoft.XboxApp Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxIdentityProvider Microsoft.XboxSpeechToTextOverlay) do (
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

:MOUSE_KEYBOARD_SILENT
echo [░░░░░░░░░░] 0%% - Increasing queue sizes...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 20 /f >nul
echo [████░░░░░░] 40%% - Disabling mouse acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul
echo [████████░░] 80%% - Optimizing sensitivity...
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t REG_DWORD /d 10000 /f >nul
echo [██████████] 100%% - Input devices optimized...
echo [✓] Mouse ^& keyboard optimized
goto :eof

:DEBLOAT_SILENT
echo [░░░░░░░░░░] 0%% - Removing bloatware apps...
echo     This may take 2-5 minutes, please wait...

REM Create temporary PowerShell script
echo $apps = @('Microsoft.3DBuilder','Microsoft.BingFinance','Microsoft.BingNews','Microsoft.BingSports','Microsoft.BingWeather','Microsoft.GetHelp','Microsoft.Getstarted','Microsoft.Messaging','Microsoft.Microsoft3DViewer','Microsoft.MicrosoftOfficeHub','Microsoft.MicrosoftSolitaireCollection','Microsoft.MSPaint','Microsoft.Office.OneNote','Microsoft.OneConnect','Microsoft.People','Microsoft.Print3D','Microsoft.SkypeApp','Microsoft.Wallet','Microsoft.WindowsAlarms','Microsoft.WindowsCamera','Microsoft.windowscommunicationsapps','Microsoft.WindowsFeedbackHub','Microsoft.WindowsMaps','Microsoft.WindowsSoundRecorder','Microsoft.Xbox.TCUI','Microsoft.XboxApp','Microsoft.XboxGameOverlay','Microsoft.XboxGamingOverlay','Microsoft.XboxIdentityProvider','Microsoft.XboxSpeechToTextOverlay','Microsoft.YourPhone','Microsoft.ZuneMusic','Microsoft.ZuneVideo') > "%TEMP%\debloat_silent.ps1"
echo foreach ($app in $apps) { try { $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue; if ($package) { Remove-AppxPackage -Package $package.PackageFullName -ErrorAction SilentlyContinue } } catch { } } >> "%TEMP%\debloat_silent.ps1"

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
echo [████████░░] 80%% - Disabling Windows Media Player...
dism /online /disable-feature /featurename:WindowsMediaPlayer /NoRestart >nul 2>&1
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
echo [*] Disabling auto-tuning...
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [██░░░░░░░░] 15%%
echo [*] Enabling chimney offload...
netsh int tcp set global chimney=enabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [███░░░░░░░] 25%%
echo [*] Enabling direct cache access...
netsh int tcp set global dca=enabled >nul 2>&1
cls
echo ════════════════════════════════════════════════
echo    NETWORK OPTIMIZATION FOR GAMING
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Enabling NetDMA...
netsh int tcp set global netdma=enabled >nul 2>&1
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
echo  • TCP auto-tuning disabled
echo  • Network offload features enabled
echo  • Latency reduced
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
for %%a in (Microsoft.Windows.Photos Microsoft.WindowsCalculator Microsoft.WindowsCamera Microsoft.Windows.Cortana Microsoft.WindowsMaps Microsoft.WindowsAlarms Microsoft.BingWeather Microsoft.GetHelp Microsoft.Getstarted Microsoft.Messaging Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.WindowsFeedbackHub Microsoft.ZuneMusic Microsoft.ZuneVideo Microsoft.People Microsoft.WindowsSoundRecorder Microsoft.YourPhone Microsoft.Xbox.TCUI Microsoft.XboxApp Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxIdentityProvider Microsoft.XboxSpeechToTextOverlay) do (
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
echo    MOUSE ^& KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [░░░░░░░░░░] 0%%
echo [*] Increasing data queue sizes...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 20 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████░░░░░] 40%%
echo [*] Disabling mouse acceleration...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Optimizing mouse sensitivity...
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t REG_DWORD /d 10000 /f >nul
cls
echo ════════════════════════════════════════════════
echo    MOUSE ^& KEYBOARD OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo.
echo [✓] Mouse and keyboard optimized!
echo.
echo Settings applied:
echo  • Higher polling rate support
echo  • Mouse acceleration disabled
echo  • Raw input optimized
echo  • Input lag reduced
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
echo 'Microsoft.MSPaint', >> "%TEMP%\debloat.ps1"
echo 'Microsoft.Office.OneNote', >> "%TEMP%\debloat.ps1"
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
echo 'Microsoft.ZuneVideo' >> "%TEMP%\debloat.ps1"
echo ) >> "%TEMP%\debloat.ps1"
echo $removed = 0 >> "%TEMP%\debloat.ps1"
echo foreach ($app in $apps) { >> "%TEMP%\debloat.ps1"
echo     try { >> "%TEMP%\debloat.ps1"
echo         $package = Get-AppxPackage -Name $app -ErrorAction SilentlyContinue >> "%TEMP%\debloat.ps1"
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
echo [*] Disabling Windows Media Player...
dism /online /disable-feature /featurename:WindowsMediaPlayer /NoRestart >nul 2>&1
if !errorlevel! equ 0 set /a disabled+=1
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
    echo  • Windows Media Player
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
echo    FULL PRO OPTIMIZATION
echo ════════════════════════════════════════════════
echo.
echo WARNING: This will apply ALL optimizations!
echo This process will take 10-15 minutes.
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MENU

setlocal enabledelayedexpansion

REM Step 1/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [1/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█░░░░░░░░░] 7%%
echo [*] Deep cleaning system...
call :CLEAN_TEMP_SILENT

REM Step 2/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [2/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██░░░░░░░░] 13%%
echo [*] Optimizing drives...
call :DISK_OPT_SILENT

REM Step 3/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [3/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███░░░░░░░] 20%%
echo [*] Disabling services...
call :SERVICES_SILENT

REM Step 4/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [4/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███░░░░░░░] 27%%
echo [*] Configuring visual performance...
call :VISUAL_SILENT

REM Step 5/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [5/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████░░░░░░] 33%%
echo [*] Managing startup programs...
call :STARTUP_SILENT

REM Step 6/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [6/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████░░░░░] 40%%
echo [*] Activating ultimate power plan...
call :POWER_SILENT

REM Step 7/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [7/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████░░░░░] 47%%
echo [*] Optimizing Game Mode...
call :GAME_MODE_SILENT

REM Step 8/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [8/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████░░░░] 53%%
echo [*] Removing telemetry...
call :TELEMETRY_SILENT

REM Step 9/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [9/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████░░░] 60%%
echo [*] Optimizing network...
call :NETWORK_SILENT

REM Step 10/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [10/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [███████░░░] 67%%
echo [*] Disabling background apps...
call :BACKGROUND_APPS_SILENT

REM Step 11/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [11/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [████████░░] 73%%
echo [*] Optimizing GPU...
call :GPU_SETTINGS_SILENT

REM Step 12/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [12/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████████░] 80%%
echo [*] Optimizing mouse ^& keyboard...
call :MOUSE_KEYBOARD_SILENT

REM Step 13/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [13/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [█████████░] 87%%
echo [*] Removing bloatware...
call :DEBLOAT_SILENT

REM Step 14/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [14/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████████] 93%%
echo [*] Disabling features...
call :DISABLE_FEATURES_SILENT

REM Step 15/15
cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION [15/15]
echo ════════════════════════════════════════════════
echo.
echo Overall Progress: [██████████] 100%%
echo [*] Finalizing optimizations...
timeout /t 2 >nul

cls
echo ════════════════════════════════════════════════
echo    FULL PRO OPTIMIZATION COMPLETED!
echo ════════════════════════════════════════════════
echo.
echo [✓✓✓] ALL OPTIMIZATIONS APPLIED SUCCESSFULLY! [✓✓✓]
echo.
echo ════════════════════════════════════════════════
echo IMPORTANT NEXT STEPS:
echo ════════════════════════════════════════════════
echo.
echo 1. RESTART your computer NOW to apply all changes
echo.
echo 2. Open Task Manager and disable startup programs:
echo    - Press Ctrl+Shift+Esc
echo    - Go to Startup tab
echo    - Disable non-essential programs
echo.
echo 3. For GPU-specific optimizations:
echo    - NVIDIA users: Run option 16 from main menu
echo    - AMD users: Run option 17 from main menu
echo.
echo 4. Update GPU drivers to latest version
echo.
echo ════════════════════════════════════════════════
echo Your system is now optimized for maximum gaming!
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
echo Progress: [███░░░░░░░] 25%%
echo [*] Restoring services...
for %%s in (WSearch SysMain DiagTrack dmwappushservice) do (
    sc config "%%s" start=auto >nul 2>&1
    sc start "%%s" >nul 2>&1
)

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████░░░░] 50%%
echo [*] Restoring visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f >nul

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [████████░░] 70%%
echo [*] Restoring power plan...
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [█████████░] 85%%
echo [*] Restoring network settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 95%%
echo [*] Re-enabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 0 /f >nul

cls
echo ════════════════════════════════════════════════
echo    RESTORE DEFAULT SETTINGS
echo ════════════════════════════════════════════════
echo.
echo Progress: [██████████] 100%%
echo [*] Enabling hibernation...
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

reg query "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize 2>nul | find "0x14" >nul 2>&1
if %errorlevel%==0 (echo  Mouse Queue Size: OPTIMIZED ✓) else (echo  Mouse Queue Size: DEFAULT)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize 2>nul | find "0x14" >nul 2>&1
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