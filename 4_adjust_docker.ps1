# Docker Desktop - Switch to Windows containers
Write-Host "Switching to Windows containers..."
& $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon
Write-Host "Switched to Windows containers" -ForegroundColor Green

Sleep 10

# Docker Desktop - Engine adjustment
# Write-Host "Adjust Docker Engine DNS config..."
# echo '{"dns":["8.8.8.8"],"experimental":false}' > $env:USERPROFILE\.docker\windows-daemon.json
# Write-Host "Docker Engine DNS config adjustted" -ForegroundColor Green

Write-Host "Adjust Docker Engine DNS config..."
invoke-webrequest -uri 'https://raw.githubusercontent.com/ziws/AIB/main/windows-daemon.json' -OutFile 'c:\\ImageBuilder\\windows-daemon.json',
copy-item 'c:\\ImageBuilder\\windows-daemon.json\\' -Destination '$env:USERPROFILE\\.docker\\'
Write-Host "Docker Engine DNS config adjustted" -ForegroundColor Green
