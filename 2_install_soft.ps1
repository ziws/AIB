# VSCode
Write-Host "Installing VSCode latest version..."
$ErrorActionPreference='Stop'
choco install vscode -y
Write-Host "VSCode installed" -ForegroundColor Green

# VisualStudio 2022 
Write-Host "Installing VisualStudio 2022 Professional core packages..."
$ErrorActionPreference='Stop'
choco install visualstudio2022professional -y
Write-Host "VisualStudio 2022 Professional core packages installed" -ForegroundColor Green

Write-Host "Installing VisualStudio 2022 Web development packages"
$ErrorActionPreference='Stop'
choco install visualstudio2022-workload-netweb -y
Write-Host "VisualStudio 2022 Web development packages installed" -ForegroundColor Green

# ASP.NET Core runtime and packages
Write-Host "Installing .NET Core packages..."
$ErrorActionPreference='Stop'
choco install dotnetcore-runtime -y
Write-Host ".NET Core packages installed" -ForegroundColor Green

# choco install netfx-4.8-devpack -y

Write-Host "Installing ASP.Net Core 3.1 packages..."
$ErrorActionPreference='Stop'
choco install aspnetcore-runtimepackagestore -y
Write-Host "ASP.Net Core 3.1 packages installed" -ForegroundColor Green

# LTS NodeJS
Write-Host "Installing LTS NodeJS 18.6.0 packages..."
$ErrorActionPreference='Stop'
choco install nodejs-lts -y
Write-Host "LTS NodeJS 18.6.0 packages installed" -ForegroundColor Green

# Yeoman
Write-Host "Installing Yeoman latest version..."
$ErrorActionPreference='Stop'
choco install yo -y
Write-Host "Yeoman installed" -ForegroundColor Green

# Git
Write-Host "Installing Git for Windows latest version..."
$ErrorActionPreference='Stop'
choco install git -y
Write-Host "Git installed" -ForegroundColor Green

# Docker Desktop
Write-Host "Installing Docker Desktop latest version"
Write-Host "Downloading..." -ForegroundColor Cyan
$exePath = "$env:TEMP\Docker-Desktop-Installer.exe"
(New-Object Net.WebClient).DownloadFile('https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe', $exePath)

Write-Host "Installing..."
cmd /c start /wait $exePath install --quiet --backend=hyper-v --accept-license
Remove-Item $exePath

Write-Host "Docker Desktop installed" -ForegroundColor Green
Write-Host "Mapping docker-switch-windows.cmd to Switch-DockerWindows..."

@"
@echo off
powershell -command "Switch-DockerWindows"
"@ | Set-Content -Path "$env:ProgramFiles\Docker\Docker\resources\bin\docker-switch-windows.cmd"

# & $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon

Write-Host "Finished the installation of Docker for Desktop"
# Sleep 5
# Write-Host "Post-installation node reboot..."
# Sleep 5
# Restart-Computer -Force
