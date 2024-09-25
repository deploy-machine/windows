# Development Machine Setup

This repository contains remote scripts to install and remove applications on your Windows machine using `winget`, without needing to clone the repository.

# ⚠️ WARNING ⚠️

**Running scripts from the web can potentially compromise your machine.**  
Before executing any script that installs or removes applications, make sure you fully understand what each command does and double-check the content of any files you are fetching.

**Only proceed if you trust the source of the script** and are certain that the applications being installed or removed are what you intend.


## Requirements
- Microsoft.AppInstaller installed from the microsoft store on version 1.8 or higher (use winget --version to check)
- Windows 10 or 11

## How to Use

You can directly fetch and execute the install or uninstall commands from the repository.

### Step 1: Install Applications

Run the following PowerShell command to install all the applications listed in the `install_apps.txt` file from the repository:

```powershell
 $ProgressPreference = 'SilentlyContinue'; (Invoke-WebRequest -Uri https://raw.githubusercontent.com/simbaclaws/dev-machine/main/install_apps.txt).Content -split "`n" | ForEach-Object {
     $appId = $_.Trim()
     Write-Host "Attempting to install: '$appId'"
     winget install --id $appId --silent --accept-package-agreements --accept-source-agreements
}
```

This command fetches the raw content of the `install_apps.txt` file from the GitHub repository and installs each application listed in that file.

### Step 2: Remove Applications

Run the following PowerShell command to remove all the applications listed in the `remove_apps.txt` file from the repository:

```powershell
 $ProgressPreference = 'SilentlyContinue'; (Invoke-WebRequest -Uri https://raw.githubusercontent.com/simbaclaws/dev-machine/main/remove_apps.txt).Content -split "`n" | ForEach-Object {
     $appName = $_.Trim()
     Write-Host "Attempting to uninstall: '$appName'"
     winget uninstall "$appName" --silent --accept-source-agreements
}
```

This command fetches the raw content of the `remove_apps.txt` file from the GitHub repository and uninstalls each application listed in that file.

### Customization

If you'd like to customize the apps to be installed or removed, you can:
- Fork this repository and modify the `install_apps.txt` or `remove_apps.txt` files in your own GitHub repository.
- Replace the URLs in the above commands with your own GitHub raw file links.

### Example App Lists

#### Apps to Install (`install_apps.txt`):
(Apps I want installed on my dev rig)

- NVM for Windows (NodeJS)
- Android Studio
- Neofetch
- Git
- Git LFS
- Neovim
- Zig
- Ripgrep
- Powershell
- JetBrainsMono NerdFont 
- Visual Studio 2022 Community
- Visual Studio Code
- Sysinternals
- Oh-my-posh
- Python
- Dart
- Xampp
- OpenJDK 11, 16, 17, 21
- Dotnet 8
- Windows Terminal (usually comes pre-installed)

**The following apps are general purpose**:
- 7zip (compression)
- Revo Uninstaller (properly uninstall by cleaning up system)
- Google Chrome
- Mozilla Firefox
- Opera
- Microsoft Edge (usually comes pre-installed)
- Microsoft Visual C++ Redistributable 2010 - 2012 - 2015 - 2022 x86 and x64 (app and game compatibility)
- Bitwarden (password manager)

**Communication apps**:
- Teams

#### Apps to Remove (`remove_apps.txt`):
(Default windows 11 apps that I don't require on my gaming rig...)

**Caution: disabling these windows built-in apps hasn't been tested yet, be very carefull when running the remove apps command!**:

- MSN Weather
- News
- Microsoft Bing Search
- Solitaire & Casual Games
- Paint

### Troubleshooting

If any apps fail to install or uninstall, you may see error messages in PowerShell. You can run the commands manually to troubleshoot or consult the `winget` documentation for more details.

## License

This project is open source under the MIT License.
