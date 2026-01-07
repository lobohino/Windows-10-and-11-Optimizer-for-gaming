@echo off
title Automatic Program Installer - Winget
color 0B
chcp 65001 >nul

REM Check if Winget is installed
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo ════════════════════════════════════════════════
    echo    ERROR: Winget is not installed
    echo ════════════════════════════════════════════════
    echo.
    echo Winget is required to install programs automatically
    echo.
    echo Installing Winget...
    echo Please wait, this may take a few minutes...
    powershell -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe"
    timeout /t 3 >nul
)

:START
cls
echo ════════════════════════════════════════════════
echo    AUTOMATIC INSTALLER - WINGET
echo ════════════════════════════════════════════════
echo.
echo This script installs programs completely automatically
echo Without opening browsers or web pages
echo Requirements: Internet and administrator permissions
echo.
pause

:MAIN_MENU
cls
echo ════════════════════════════════════════════════
echo           MAIN MENU
echo ════════════════════════════════════════════════
echo.
echo  1. Web Browsers
echo  2. Gaming (Steam, Epic, Discord, etc.)
echo  3. Streaming (OBS, Stream Deck, etc.)
echo  4. Multimedia
echo  5. System Utilities
echo  6. Quick Packages (recommended)
echo  7. Exit
echo.
set /p menu="Select (1-7): "

if "%menu%"=="1" goto BROWSERS
if "%menu%"=="2" goto GAMING
if "%menu%"=="3" goto STREAMING
if "%menu%"=="4" goto MULTIMEDIA
if "%menu%"=="5" goto UTILITIES
if "%menu%"=="6" goto PACKAGES
if "%menu%"=="7" goto EXIT
goto MAIN_MENU

:BROWSERS
cls
echo ════════════════════════════════════════════════
echo           WEB BROWSERS
echo ════════════════════════════════════════════════
echo.
echo  1. Google Chrome
echo  2. Brave Browser
echo  3. Mozilla Firefox
echo  4. Opera
echo  5. Opera GX
echo  6. Vivaldi
echo  7. Microsoft Edge
echo  8. Install all
echo  0. Back
echo.
set /p nav="Select: "

if "%nav%"=="1" call :CHROME
if "%nav%"=="2" call :BRAVE
if "%nav%"=="3" call :FIREFOX
if "%nav%"=="4" call :OPERA
if "%nav%"=="5" call :OPERAGX
if "%nav%"=="6" call :VIVALDI
if "%nav%"=="7" call :EDGE
if "%nav%"=="8" (
    call :CHROME
    call :BRAVE
    call :FIREFOX
    call :OPERA
)
if "%nav%"=="0" goto MAIN_MENU
pause
goto BROWSERS

:GAMING
cls
echo ════════════════════════════════════════════════
echo           GAMING AND PLATFORMS
echo ════════════════════════════════════════════════
echo.
echo  1. Steam
echo  2. Epic Games Launcher
echo  3. EA App
echo  4. Battle.net (Blizzard)
echo  5. GOG Galaxy
echo  6. Ubisoft Connect
echo  7. Discord
echo  8. Xbox App
echo  9. Riot Games (League/Valorant)
echo  10. Amazon Games
echo  11. Install complete Gaming package
echo  0. Back
echo.
set /p game="Select: "

if "%game%"=="1" call :STEAM
if "%game%"=="2" call :EPIC
if "%game%"=="3" call :EA
if "%game%"=="4" call :BATTLENET
if "%game%"=="5" call :GOG
if "%game%"=="6" call :UBISOFT
if "%game%"=="7" call :DISCORD
if "%game%"=="8" call :XBOX
if "%game%"=="9" call :RIOT
if "%game%"=="10" call :AMAZONGAMES
if "%game%"=="11" (
    call :STEAM
    call :DISCORD
    call :EPIC
    call :EA
)
if "%game%"=="0" goto MAIN_MENU
pause
goto GAMING

:STREAMING
cls
echo ════════════════════════════════════════════════
echo           STREAMING AND CREATION
echo ════════════════════════════════════════════════
echo.
echo  1. OBS Studio
echo  2. Elgato Stream Deck
echo  3. Streamlabs Desktop
echo  4. Discord
echo  5. Spotify
echo  6. Audacity (audio editing)
echo  7. DaVinci Resolve (video editing)
echo  8. Install complete Streamer package
echo  0. Back
echo.
set /p stream="Select: "

if "%stream%"=="1" call :OBS
if "%stream%"=="2" call :STREAMDECK
if "%stream%"=="3" call :STREAMLABS
if "%stream%"=="4" call :DISCORD
if "%stream%"=="5" call :SPOTIFY
if "%stream%"=="6" call :AUDACITY
if "%stream%"=="7" call :DAVINCI
if "%stream%"=="8" (
    call :OBS
    call :STREAMDECK
    call :DISCORD
    call :SPOTIFY
)
if "%stream%"=="0" goto MAIN_MENU
pause
goto STREAMING

:MULTIMEDIA
cls
echo ════════════════════════════════════════════════
echo           MULTIMEDIA
echo ════════════════════════════════════════════════
echo.
echo  1. Spotify
echo  2. Audacity (audio editing)
echo  3. Install all
echo  0. Back
echo.
set /p multi="Select: "

if "%multi%"=="1" call :SPOTIFY
if "%multi%"=="2" call :AUDACITY
if "%multi%"=="3" (
    call :SPOTIFY
    call :AUDACITY
)
if "%multi%"=="0" goto MAIN_MENU
pause
goto MULTIMEDIA

:UTILITIES
cls
echo ════════════════════════════════════════════════
echo           SYSTEM UTILITIES
echo ════════════════════════════════════════════════
echo.
echo  1. CCleaner
echo  2. TeamViewer
echo  3. AnyDesk
echo  4. qBittorrent
echo  5. WinRAR
echo  6. Everything (file search)
echo  7. CPU-Z
echo  8. GPU-Z
echo  9. HWMonitor
echo  10. Revo Uninstaller
echo  11. Notepad++
echo  12. NVIDIA GeForce Experience
echo  13. AMD Radeon Software
echo  0. Back
echo.
set /p util="Select: "

if "%util%"=="1" call :CCLEANER
if "%util%"=="2" call :TEAMVIEWER
if "%util%"=="3" call :ANYDESK
if "%util%"=="4" call :QBITTORRENT
if "%util%"=="5" call :WINRAR
if "%util%"=="6" call :EVERYTHING
if "%util%"=="7" call :CPUZ
if "%util%"=="8" call :GPUZ
if "%util%"=="9" call :HWMONITOR
if "%util%"=="10" call :REVOUNINSTALLER
if "%util%"=="11" call :NOTEPADPP
if "%util%"=="12" call :NVIDIA
if "%util%"=="13" call :AMD
if "%util%"=="0" goto MAIN_MENU
pause
goto UTILITIES

:PACKAGES
cls
echo ════════════════════════════════════════════════
echo           QUICK INSTALLATION PACKAGES
echo ════════════════════════════════════════════════
echo.
echo  1. GAMER PACKAGE
echo     Steam, Epic, Discord, Brave, OBS, Spotify
echo.
echo  2. STREAMER PACKAGE
echo     OBS, Stream Deck, Discord, Spotify
echo.
echo  3. BASIC PACKAGE
echo     Brave, Notepad++, Telegram
echo.
echo  4. COMPLETE PACKAGE (EVERYTHING!)
echo     Installs the most popular programs from all categories
echo.
echo  0. Back
echo.
set /p paq="Select: "

if "%paq%"=="1" (
    cls
    echo ════════════════════════════════════════════════
    echo   INSTALLING GAMER PACKAGE
    echo ════════════════════════════════════════════════
    echo.
    call :STEAM
    call :EPIC
    call :DISCORD
    call :BRAVE
    call :OBS
    call :SPOTIFY
    echo.
    echo [✓] GAMER PACKAGE INSTALLED!
)
if "%paq%"=="2" (
    cls
    echo ════════════════════════════════════════════════
    echo   INSTALLING STREAMER PACKAGE
    echo ════════════════════════════════════════════════
    echo.
    call :OBS
    call :STREAMDECK
    call :DISCORD
    call :SPOTIFY
    echo.
    echo [✓] STREAMER PACKAGE INSTALLED!
)
if "%paq%"=="3" (
    cls
    echo ════════════════════════════════════════════════
    echo   INSTALLING BASIC PACKAGE
    echo ════════════════════════════════════════════════
    echo.
    call :BRAVE
    call :NOTEPADPP
    call :TELEGRAM
    echo.
    echo [✓] BASIC PACKAGE INSTALLED!
)
if "%paq%"=="4" (
    cls
    echo ════════════════════════════════════════════════
    echo   INSTALLING COMPLETE PACKAGE
    echo   This will take several minutes...
    echo ════════════════════════════════════════════════
    echo.
    call :CHROME
    call :STEAM
    call :DISCORD
    call :OBS
    call :SPOTIFY
    call :AUDACITY
    echo.
    echo [✓] COMPLETE PACKAGE INSTALLED!
)
if "%paq%"=="0" goto MAIN_MENU
pause
goto PACKAGES

REM ========== INSTALLATION FUNCTIONS WITH WINGET ==========

:CHROME
echo [*] Installing Google Chrome...
winget install -e --id Google.Chrome --silent --accept-source-agreements --accept-package-agreements
echo [✓] Chrome installed
echo.
goto :eof

:BRAVE
echo [*] Installing Brave Browser...
winget install -e --id Brave.Brave --silent --accept-source-agreements --accept-package-agreements
echo [✓] Brave installed
echo.
goto :eof

:FIREFOX
echo [*] Installing Mozilla Firefox...
winget install -e --id Mozilla.Firefox --silent --accept-source-agreements --accept-package-agreements
echo [✓] Firefox installed
echo.
goto :eof

:OPERA
echo [*] Installing Opera...
winget install -e --id Opera.Opera --silent --accept-source-agreements --accept-package-agreements
echo [✓] Opera installed
echo.
goto :eof

:OPERAGX
echo [*] Installing Opera GX...
winget install -e --id Opera.OperaGX --silent --accept-source-agreements --accept-package-agreements
echo [✓] Opera GX installed
echo.
goto :eof

:VIVALDI
echo [*] Installing Vivaldi...
winget install -e --id VivaldiTechnologies.Vivaldi --silent --accept-source-agreements --accept-package-agreements
echo [✓] Vivaldi installed
echo.
goto :eof

:EDGE
echo [*] Installing Microsoft Edge...
winget install -e --id Microsoft.Edge --silent --accept-source-agreements --accept-package-agreements
echo [✓] Edge installed
echo.
goto :eof

:STEAM
echo [*] Installing Steam...
winget install -e --id Valve.Steam --silent --accept-source-agreements --accept-package-agreements
echo [✓] Steam installed
echo.
goto :eof

:EPIC
echo [*] Installing Epic Games Launcher...
winget install -e --id EpicGames.EpicGamesLauncher --silent --accept-source-agreements --accept-package-agreements
echo [✓] Epic Games installed
echo.
goto :eof

:EA
echo [*] Installing EA App...
winget install -e --id ElectronicArts.EADesktop --silent --accept-source-agreements --accept-package-agreements
echo [✓] EA App installed
echo.
goto :eof

:BATTLENET
echo [*] Installing Battle.net...
winget install -e --id Blizzard.BattleNet --silent --accept-source-agreements --accept-package-agreements
echo [✓] Battle.net installed
echo.
goto :eof

:GOG
echo [*] Installing GOG Galaxy...
winget install -e --id GOG.Galaxy --silent --accept-source-agreements --accept-package-agreements
echo [✓] GOG Galaxy installed
echo.
goto :eof

:UBISOFT
echo [*] Installing Ubisoft Connect...
winget install -e --id Ubisoft.Connect --silent --accept-source-agreements --accept-package-agreements
echo [✓] Ubisoft Connect installed
echo.
goto :eof

:DISCORD
echo [*] Installing Discord...
winget install -e --id Discord.Discord --silent --accept-source-agreements --accept-package-agreements
echo [✓] Discord installed
echo.
goto :eof

:XBOX
echo [*] Installing Xbox App...
winget install -e --id Microsoft.XboxApp --silent --accept-source-agreements --accept-package-agreements
echo [✓] Xbox App installed
echo.
goto :eof

:RIOT
echo [*] Installing Riot Games...
winget install -e --id RiotGames.RiotClient --silent --accept-source-agreements --accept-package-agreements
echo [✓] Riot Games installed
echo.
goto :eof

:AMAZONGAMES
echo [*] Installing Amazon Games...
winget install -e --id Amazon.Games --silent --accept-source-agreements --accept-package-agreements
echo [✓] Amazon Games installed
echo.
goto :eof

:OBS
echo [*] Installing OBS Studio...
winget install -e --id OBSProject.OBSStudio --silent --accept-source-agreements --accept-package-agreements
echo [✓] OBS Studio installed
echo.
goto :eof

:STREAMDECK
echo [*] Installing Elgato Stream Deck...
winget install -e --id Elgato.StreamDeck --silent --accept-source-agreements --accept-package-agreements
echo [✓] Stream Deck installed
echo.
goto :eof

:STREAMLABS
echo [*] Installing Streamlabs Desktop...
winget install -e --id Streamlabs.Streamlabs --silent --accept-source-agreements --accept-package-agreements
echo [✓] Streamlabs installed
echo.
goto :eof

:DAVINCI
echo [*] Installing DaVinci Resolve...
winget install -e --id Blackmagic.DaVinciResolve --silent --accept-source-agreements --accept-package-agreements
echo [✓] DaVinci Resolve installed
echo.
goto :eof

:SPOTIFY
echo [*] Installing Spotify...
winget install -e --id Spotify.Spotify --silent --accept-source-agreements --accept-package-agreements
echo [✓] Spotify installed
echo.
goto :eof

:AUDACITY
echo [*] Installing Audacity...
winget install -e --id Audacity.Audacity --silent --accept-source-agreements --accept-package-agreements
echo [✓] Audacity installed
echo.
goto :eof

:NOTEPADPP
echo [*] Installing Notepad++...
winget install -e --id Notepad++.Notepad++ --silent --accept-source-agreements --accept-package-agreements
echo [✓] Notepad++ installed
echo.
goto :eof

:TELEGRAM
echo [*] Installing Telegram...
winget install -e --id Telegram.TelegramDesktop --silent --accept-source-agreements --accept-package-agreements
echo [✓] Telegram installed
echo.
goto :eof

:CCLEANER
echo [*] Installing CCleaner...
winget install -e --id Piriform.CCleaner --silent --accept-source-agreements --accept-package-agreements
echo [✓] CCleaner installed
echo.
goto :eof

:TEAMVIEWER
echo [*] Installing TeamViewer...
winget install -e --id TeamViewer.TeamViewer --silent --accept-source-agreements --accept-package-agreements
echo [✓] TeamViewer installed
echo.
goto :eof

:ANYDESK
echo [*] Installing AnyDesk...
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk --silent --accept-source-agreements --accept-package-agreements
echo [✓] AnyDesk installed
echo.
goto :eof

:QBITTORRENT
echo [*] Installing qBittorrent...
winget install -e --id qBittorrent.qBittorrent --silent --accept-source-agreements --accept-package-agreements
echo [✓] qBittorrent installed
echo.
goto :eof

:WINRAR
echo [*] Installing WinRAR...
winget install -e --id RARLab.WinRAR --silent --accept-source-agreements --accept-package-agreements
echo [✓] WinRAR installed
echo.
goto :eof

:EVERYTHING
echo [*] Installing Everything...
winget install -e --id voidtools.Everything --silent --accept-source-agreements --accept-package-agreements
echo [✓] Everything installed
echo.
goto :eof

:CPUZ
echo [*] Installing CPU-Z...
winget install -e --id CPUID.CPU-Z --silent --accept-source-agreements --accept-package-agreements
echo [✓] CPU-Z installed
echo.
goto :eof

:GPUZ
echo [*] Installing GPU-Z...
winget install -e --id TechPowerUp.GPU-Z --silent --accept-source-agreements --accept-package-agreements
echo [✓] GPU-Z installed
echo.
goto :eof

:HWMONITOR
echo [*] Installing HWMonitor...
winget install -e --id CPUID.HWMonitor --silent --accept-source-agreements --accept-package-agreements
echo [✓] HWMonitor installed
echo.
goto :eof

:REVOUNINSTALLER
echo [*] Installing Revo Uninstaller...
winget install -e --id RevoUninstaller.RevoUninstaller --silent --accept-source-agreements --accept-package-agreements
echo [✓] Revo Uninstaller installed
echo.
goto :eof

:NVIDIA
echo [*] Installing NVIDIA GeForce Experience...
winget install -e --id Nvidia.GeForceExperience --silent --accept-source-agreements --accept-package-agreements
echo [✓] NVIDIA GeForce Experience installed
echo.
goto :eof

:AMD
echo [*] Installing AMD Radeon Software...
winget install -e --id AMD.AdrenalinEdition --silent --accept-source-agreements --accept-package-agreements
echo [✓] AMD Radeon Software installed
echo.
goto :eof

:EXIT
cls
echo ════════════════════════════════════════════════
echo    Thank you for using the installer!
echo ════════════════════════════════════════════════
echo.
timeout /t 3
exit