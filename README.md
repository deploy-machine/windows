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

Run the following PowerShell command to install all the applications listed in the `packages.json` file from the repository:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Simbaclaws/dev-windows/refs/heads/main/packages.json" -OutFile "$($env:TEMP)\packages.json" ; winget import -i "$($env:TEMP)\packages.json"
```

This command fetches the raw content of the `packages.json` file from the GitHub repository and installs each application listed in that file with winget.

You can export a packages.json file with `winget export packages.json`. This will export all of your currently installed apps to a `packages.json` file.

### Step 2: Remove Applications

Run the following PowerShell command to remove all the applications listed in the `remove_apps.txt` file from the repository:

```powershell
 $ProgressPreference = 'SilentlyContinue'; (Invoke-WebRequest -Uri https://raw.githubusercontent.com/simbaclaws/dev-windows/main/remove_apps.txt).Content -split "`n" | ForEach-Object {
     $appName = $_.Trim()
     Write-Host "Attempting to uninstall: '$appName'"
     winget uninstall "$appName" --silent --accept-source-agreements
}
```

This command fetches the raw content of the `remove_apps.txt` file from the GitHub repository and uninstalls each application listed in that file.

### Troubleshooting

If any apps fail to install or uninstall, you may see error messages in PowerShell. You can run the commands manually to troubleshoot or consult the `winget` documentation for more details.

## License

This project is open source under the MIT License.
