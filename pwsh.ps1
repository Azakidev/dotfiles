$env:POSH_GIT_ENABLED=$true
Import-Module posh-git

# Custom functions
function batterystatus { Get-CimInstance -Class batterystatus -Namespace root/wmi }
function sync_art { Param($arg) unison -batch $arg C:\Users\zazag\Pictures\Art ssh://zazag@192.168.0.17/Pictures/Art }
function sync_music { Param($arg) unison -batch $arg C:\Users\zazag\Music ssh://zazag@192.168.0.17/Music }
function update { Param($arg) winget update -r $arg }
function ezals { Param($arg) eza --icons=always --no-quotes $arg }
function explore { explorer . }
function ffetch { fastfetch --config $HOME\Projects\dotfiles\fastfetch\wconfig.jsonc }

# Aliases and time savers
Set-Alias battery batterystatus
Set-Alias syncart sync_art
Set-Alias syncm sync_music
Set-Alias code codium
Set-Alias clr clear
Set-Alias upd update
Set-Alias vim nvim
Set-Alias ls ezals
Set-Alias cat bat
Set-Alias ex explore
Set-Alias fetch ffetch

oh-my-posh init pwsh --config ~\omp.toml | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) }) 

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
