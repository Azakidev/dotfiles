$env:POSH_GIT_ENABLED=$true
Import-Module posh-git

# Custom functions
function batterystatus { Get-CimInstance -Class batterystatus -Namespace root/wmi }
function sync_art { Param($arg) unison $arg C:\Users\zazag\Pictures\Art ssh://zazag@192.168.0.17/Pictures/Art }
function update { Param($arg) winget update $arg }

# Aliases and time savers
Set-Alias battery batterystatus
Set-Alias syncart sync_art
Set-Alias code codium
Set-Alias clr clear
Set-Alias upd update
Set-Alias vim nvim

Set-Alias ffmpeg 'C:\Users\zazag\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-7.0-full_build\bin\ffmpeg.exe'

oh-my-posh init pwsh --config ~\omp.toml | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) }) 

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58