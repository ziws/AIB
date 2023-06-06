## Install Chocolatey ##
Write-Host "Installing Chocolatey package manager..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Host "Chocolatey installed" -ForegroundColor Green

## Install NuGet ##
Write-Host "Installing NuGet..."
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Write-Host "NuGet installed" -ForegroundColor Green

## Enable Hyper-V and containers ##
Write-Host "Enabling Hyper-V and Containers services (silently)..."
$ProgPref = $ProgressPreference
$ProgressPreference = 'SilentlyContinue'
$results = Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart -WarningAction SilentlyContinue
$ProgressPreference = $ProgPref
Write-Host "Hyper-V and Containers services enabled" -ForegroundColor Green
# Write-Host "Post-installation node reboot..."
# Sleep 5
# if ($results.RestartNeeded -eq $true) {
#   Restart-Computer -Force}
