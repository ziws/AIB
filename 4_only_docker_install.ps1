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

Write-Host "Finished the installation of Docker for Desktop"
