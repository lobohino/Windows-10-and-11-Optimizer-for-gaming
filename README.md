# Windows 11 Gaming Optimizer & Program Installer

🚩🚩 RUN THIS PROGRAM ALWAYS AS ADMINISTRATOR 🚩🚩

A collection of optimization and automation scripts for Windows 11, designed to improve gaming performance and facilitate program installation.

## 📋 Contents

This repository includes two main scripts:

1. **Gaming_Optimizer_for_Windows.bat** - Complete system optimizer for gaming
2. **Program_Installer.bat** - Automatic program installer via Winget

---

## 🎮 Gaming Optimizer PRO

Complete Windows 11 system optimization script to maximize gaming performance with visual progress bars and real-time feedback.

### ✨ Features

#### System Cleaning
- Deep deletion of temporary files
- Cache cleaning (Windows, D3D, NVIDIA, AMD)
- Disk optimization and defragmentation
- System logs cleanup
- DNS cache flushing
- Recycle bin emptying

#### Performance Optimization
- Disable unnecessary services
- Visual effects configured for performance
- High Performance/Ultimate Performance power plan
- Startup programs management
- Background applications disabled

#### Gaming Specific
- Full Game Mode activation and optimization
- GPU Hardware Scheduling enabled
- Maximum priority for gaming processes
- GPU Priority configuration
- Game DVR disabled
- Mouse & keyboard polling rate optimization
- Mouse acceleration disabled for better aim
- Reduced input latency

#### Network Optimization
- TCP/IP configuration for gaming
- CTCP congestion provider enabled
- Nagle's algorithm disabled for reduced latency
- ECN and timestamps disabled

#### GPU Optimizations
- **NVIDIA**: Optimized registry settings, telemetry disabled
- **AMD**: Power saving disabled, performance optimization
- General GPU configurations

#### Bloatware & Privacy
- Remove Windows pre-installed apps
- **Protected apps**: Calculator, Photos, Notepad, Paint, NVIDIA Control Panel
- Telemetry disabled
- Tracking services disabled
- Bloatware removal

### 🚀 How to Use

1. **Right-click** on `Gaming_Optimizer_for_Windows.bat`
2. Select **"Run as administrator"**
3. Creating a restore point is **highly recommended** (option 1 in startup menu)
4. Select desired optimizations from the menu
5. Each option shows real-time progress bars
6. Follow on-screen instructions for manual configurations

### 💡 Quick Start Guide

**For New Users:**
- Run option **21 (FULL PRO OPTIMIZATION)** for automatic setup
- Estimated time: 10-15 minutes
- Then manually run options 16 or 17 for GPU-specific optimization

**For Faster Category Optimization:**
- Option **3**: Install ALL Cleaning options (Deep clean + Optimize drives)
- Option **8**: Install ALL Performance options (Services + Visual + Startup + Power)
- Option **15**: Install ALL Gaming options (Game Mode + Network + GPU + Mouse, etc.)
- Option **20**: Install ALL Advanced options (Remove bloatware + Disable features)

**For Advanced Users:**
- Select individual options for specific optimizations
- Use option 23 (View status) to check current settings
- Use option 22 (Restore defaults) if needed

### 📊 Menu Options

```
CLEANING
1.  Deep clean (temp files, cache, logs)
2.  Optimize drives
3.  ► INSTALL ALL CLEANING OPTIONS

PERFORMANCE
4.  Disable ALL unnecessary services
5.  Maximum visual performance
6.  Manage startup programs
7.  Ultimate power plan
8.  ► INSTALL ALL PERFORMANCE OPTIONS

GAMING SPECIFIC
9.  Full Game Mode optimization
10. Remove bloatware & telemetry
11. Network optimization (gaming)
12. Disable background processes
13. General GPU optimization
14. Optimize mouse & keyboard (polling rate)
15. ► INSTALL ALL GAMING OPTIONS

GPU SPECIFIC
16. NVIDIA GPU Optimization
17. AMD GPU Optimization

ADVANCED
18. Remove Windows bloatware apps
19. Disable Windows features
20. ► INSTALL ALL ADVANCED OPTIONS

QUICK OPTIONS
21. FULL PRO OPTIMIZATION (ALL)
22. Restore defaults
23. View status
24. Exit
```

### ⚡ NEW! Install All Category Options

**NEW FEATURE**: Each section now has an "Install All" option for faster optimization!

#### Option 3 - INSTALL ALL CLEANING
Automatically executes:
- ✅ Deep clean (temp files, cache, logs)
- ✅ Optimize drives

#### Option 8 - INSTALL ALL PERFORMANCE
Automatically executes:
- ✅ Disable ALL unnecessary services
- ✅ Maximum visual performance
- ✅ Manage startup programs
- ✅ Ultimate power plan

#### Option 15 - INSTALL ALL GAMING
Automatically executes:
- ✅ Full Game Mode optimization
- ✅ Remove bloatware & telemetry
- ✅ Network optimization (gaming)
- ✅ Disable background processes
- ✅ General GPU optimization
- ✅ Optimize mouse & keyboard

#### Option 20 - INSTALL ALL ADVANCED
Automatically executes:
- ✅ Remove Windows bloatware apps
- ✅ Disable Windows features

**Benefits:**
- ⚡ Faster than selecting each option individually
- 📦 Organized by category for better control
- ✅ Each "Install All" shows progress and confirmation
- 🎯 More flexible than full optimization (option 21)

### ⚠️ Important

- **Requires administrator permissions**
- Recommended to create restore point before applying changes
- Some changes require system restart
- **"FULL PRO OPTIMIZATION" (Option 21)** applies all optimizations automatically including:
  - System cleaning and disk optimization (options 1-2)
  - Service and visual effects optimization (options 4-7)
  - Game Mode and power plan configuration (options 9-14)
  - Bloatware removal and feature disabling (options 18-19)
  - **Note**: GPU-specific optimizations (NVIDIA/AMD) must be run separately (options 16-17)
- **Category "Install All" options (3, 8, 15, 20)** provide faster installation by category without running everything

---

## 📦 Program Installer

Automatic program installer via Winget, no web browser needed.

### ✨ Features

- Completely silent installation
- No user interaction required
- Installation via Winget (Windows package manager)
- Pre-configured packages by categories

### 📂 Available Categories

#### 1. Web Browsers
- Google Chrome
- Brave Browser
- Mozilla Firefox
- Opera / Opera GX
- Vivaldi
- Microsoft Edge

#### 2. Gaming Platforms
- Steam
- Epic Games Launcher
- EA App
- Battle.net (Blizzard)
- GOG Galaxy
- Ubisoft Connect
- Discord
- Xbox App
- Riot Games
- Amazon Games

#### 3. Streaming & Creation
- OBS Studio
- Elgato Stream Deck
- Streamlabs Desktop
- Discord
- Spotify
- Audacity
- DaVinci Resolve

#### 4. Multimedia
- Spotify
- Audacity (audio editing)

#### 5. System Utilities
- CCleaner
- TeamViewer
- AnyDesk
- qBittorrent
- WinRAR
- Everything (file search)
- CPU-Z
- GPU-Z
- HWMonitor
- Revo Uninstaller
- Notepad++

### 🎁 Quick Packages

#### GAMER PACKAGE
Steam, Epic Games, Discord, Brave, OBS, Spotify

#### STREAMER PACKAGE
OBS, Stream Deck, Discord, Spotify

#### BASIC PACKAGE
Brave, Notepad++, Telegram

#### COMPLETE PACKAGE
Installs the most popular programs from all categories

### 🚀 How to Use

1. **Right-click** on `Program_Installer.bat`
2. Select **"Run as administrator"**
3. Script will verify if Winget is installed
4. Select desired category or package
5. Installation will run automatically

### ⚙️ Requirements

- Windows 10/11
- Internet connection
- Winget (will be installed automatically if not present)
- Administrator permissions

---

## 🛡️ Safety and Rollback

### Gaming Optimizer
- Includes option to **create restore point**
- **"Restore defaults"** option to revert ALL changes (services, visual effects, network, mouse, keyboard, GPU, power plan, background apps, telemetry)
- **"View status"** option to verify applied configurations
- **Protected apps**: Calculator, Photos, Notepad, Paint, NVIDIA Control Panel are never removed

### Program Installer
- All installations via official Windows package manager (Winget)
- Programs can be uninstalled normally from "Settings" → "Apps"

---

## ❓ Frequently Asked Questions

### Are these scripts safe to use?

Yes, all commands modify standard Windows configurations. The Gaming Optimizer offers to create a restore point before making changes.

### Do I need to run Gaming Optimizer every time?

No, optimizations are permanent. Recommended to run monthly or after major Windows updates.

### What's the difference between "Install All" options and "FULL PRO OPTIMIZATION"?

- **Install All options (3, 8, 15, 20)**: Install only the options in that specific category
- **FULL PRO OPTIMIZATION (21)**: Installs ALL categories at once (Cleaning + Performance + Gaming + Advanced)
- Use "Install All" options when you only want to optimize specific areas
- Use "FULL PRO OPTIMIZATION" for complete system optimization

### What to do if something goes wrong?

1. Use the "Restore defaults" option in Gaming Optimizer (option 22)
2. Restore system from the created restore point
3. Restart PC in Safe Mode if necessary

### Do they work on Windows 10?

Gaming Optimizer is optimized for Windows 11, but many options work on Windows 10. Program Installer works on both systems.

---

## 📝 Additional Notes

### After using Gaming Optimizer

1. **Restart your PC** to apply all changes
2. Open Task Manager and disable unnecessary startup programs
3. **For complete optimization:**
   - If you used category "Install All" options, consider running other categories
   - If you used FULL PRO OPTIMIZATION, also run GPU-specific options:
     - Option 16: NVIDIA GPU Optimization (if you have NVIDIA GPU)
     - Option 17: AMD GPU Optimization (if you have AMD GPU)
4. **NVIDIA users**: Open NVIDIA Control Panel and configure:
   - Power Management Mode: Prefer Maximum Performance
   - Low Latency Mode: On or Ultra
   - Texture Filtering - Quality: High Performance
5. **AMD users**: Open AMD Radeon Software and configure:
   - Enable Radeon Anti-Lag
   - Set Graphics Profile to eSports
   - Texture Filtering Quality: Performance
6. Keep drivers updated

### Optimization Workflow Examples

**Example 1 - Quick Gaming Setup:**
1. Run option 15 (Install ALL Gaming Options)
2. Run option 16 or 17 (GPU-specific)
3. Restart PC
4. Done in 5-7 minutes!

**Example 2 - Complete System Overhaul:**
1. Run option 21 (FULL PRO OPTIMIZATION)
2. Run option 16 or 17 (GPU-specific)
3. Restart PC
4. Done in 15-20 minutes!

**Example 3 - Targeted Optimization:**
1. Run option 3 (Install ALL Cleaning)
2. Run option 8 (Install ALL Performance)
3. Skip Gaming and Advanced if not needed
4. Restart PC
5. Done in 3-5 minutes!

### Recommendations

- Run Gaming Optimizer after a clean Windows installation
- Use Program Installer to quickly set up a new PC
- Keep regular backups of your important data
- Update Windows regularly for security
- Use "Install All" category options to save time while maintaining control

---

## ⚖️ Disclaimer

**USE AT YOUR OWN RISK.**

These scripts modify Windows system settings, services, registry entries, and remove pre-installed applications. While they have been tested and include rollback options, the author is NOT responsible for any damage, data loss, system instability, or unexpected behavior that may result from using these tools.

**By using these scripts you acknowledge that:**
- You understand these scripts make system-level changes to Windows
- You take full responsibility for any changes made to your system
- You will create a restore point or backup BEFORE running any optimization
- You have read and understood what each option does before running it
- The author provides these tools "as-is" without warranty of any kind
- Results may vary depending on your hardware, Windows version, and configuration

**Recommendations:**
- ALWAYS create a restore point first (option 1 in the Gaming Optimizer menu)
- Read the README fully before using any script
- Test on a non-production machine first if possible
- Keep your important data backed up regularly

These tools are provided for educational and personal use. Use them at your own discretion and risk.

---

## 🤝 Contributing

Have suggestions or improvements? Contributions are welcome.

---

## 📄 License

These scripts are free to use. Use them, modify them, and share them freely.

---

**Developed to optimize your gaming experience on Windows 11** 🎮✨

---

## 📋 Changelog

### v2.1 - Bug Fixes & Safety Improvements

#### Fixed
- **DEBLOAT_SILENT**: PowerShell script generation was broken (truncated line). Rewritten with multi-line approach
- **CLEAN_REGISTRY**: Removed destructive deletions that broke Add/Remove Programs. Now only cleans safe entries (MRU, RecentDocs, TypedPaths)
- **STATUS checker**: MouseDataQueueSize/KeyboardDataQueueSize hex check was wrong (0x14 vs 0x32). Now correctly detects optimized values
- **FULL PRO OPTIMIZATION**: Was calling MOUSE_SILENT instead of MOUSE_KEYBOARD_SILENT, missing keyboard optimization. Fixed
- **FULL PRO OPTIMIZATION**: Step counting was inconsistent (Step 14/22 vs 15/24). Fixed
- **RESTORE function**: Only restored4 services out of 30+. Now restores ALL services, visual effects, network, mouse, keyboard, GPU, power plan, background apps, telemetry, and Windows Search
- **Network optimization**: Removed deprecated commands (chimney, dca, netdma) that silently failed on Windows 10/11. Auto-tuning changed from 'disabled' to 'normal' (better for modern connections). Added CTCP congestion provider
- **Typo**: Fixed `-echo` command error in BLACK MODE output

#### Added
- **Calculator protection**: Windows Calculator is now protected and will never be removed during bloatware cleanup
- **Photos protection**: Windows Photos is now protected and will never be removed during bloatware cleanup
- Protected apps list: Windows Store, Calculator, Photos, Notepad, Paint, NVIDIA Control Panel

#### Improved
- RESTORE function now fully reverses all optimizations
- Registry cleanup is now safe (no more destructive wildcard deletions)
- Network optimization uses modern TCP settings for Windows 10/11