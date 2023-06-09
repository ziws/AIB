# Add docker user
Write-Host "Adding local user to docker-user group"
Add-LocalGroupMember -Group "docker-users" -Member $env:UserName -Verbose
Write-Host "Group created and user added" -ForegroundColor Green

Sleep 3

# Docker Desktop - Switch to Windows containers
Write-Host "Switching to Windows containers..."
& $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon
Write-Host "Switched to Windows containers" -ForegroundColor Green

Sleep 5

# Docker Desktop - Engine adjustment
# Write-Host "Adjust Docker Engine DNS config..."
# echo '{"dns":["8.8.8.8"],"experimental":false}' > $env:USERPROFILE\.docker\windows-daemon.json
# Write-Host "Docker Engine DNS config adjustted" -ForegroundColor Green

# Write-Host "Adjust Docker Engine DNS config..."
# Invoke-WebRequest -uri 'https://raw.githubusercontent.com/ziws/AIB/main/windows-daemon.json' -OutFile 'C:\\ImageBuilder\\windows-daemon.json',
# Copy-Item 'C:\\ImageBuilder\\windows-daemon.json\\' -Destination $env:USERPROFILE\\.docker\\windows-daemon.json
# Write-Host "Docker Engine DNS config adjustted" -ForegroundColor Green


Write-Host "Adjust Docker Engine DNS config..."
New-Item -Type Directory -Path 'C:\' -Name ImageBuilder
Invoke-WebRequest -uri 'https://raw.githubusercontent.com/ziws/AIB/main/windows-daemon.json' -OutFile 'C:\ImageBuilder\windows-daemon.json'
Copy-Item 'C:\ImageBuilder\windows-daemon.json' -Destination $env:USERPROFILE\.docker\windows-daemon.json
Write-Host "Docker Engine DNS config adjustted" -ForegroundColor Green
