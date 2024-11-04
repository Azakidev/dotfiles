$env:POSH_GIT_ENABLED=$true
Import-Module posh-git

# Functions
function battery { Get-CimInstance -Class batterystatus -Namespace root/wmi }
function syncart { Param($arg) unison -ignore "Name desktop.ini" -batch $arg C:\Users\zazag\Pictures\Art ssh://zazag@192.168.0.17/Pictures/Art }
function syncm { Param($arg) unison -ignore "Name desktop.ini" -batch $arg C:\Users\zazag\Music ssh://zazag@192.168.0.17/Music }
function syncobsidian { Param($arg) unison -ignore "Name desktop.ini" -batch $arg C:\Users\zazag\Documents\Obsidian ssh://zazag@192.168.0.17/Documents/Obsidian }
function upd { Param($arg) winget update -r $arg }
function ezals { Param($arg) eza --icons=always --no-quotes $arg }
function explore { explorer . }
function fetch { fastfetch --config $HOME\Projects\dotfiles\fastfetch\wconfig.jsonc }

# Git aliases
function status { git status }
function commit { Param($arg) git commit $arg }
function add    { Param($arg) git add $arg }

Set-Alias gs status
Set-Alias gic commit
Set-Alias ga add

# Komorebi
function restile {
    taskkill /f /im komorebi.exe ;
    taskkill /f /im komorebi-bar.exe ;
    komorebic start --whkd --bar --ffm ;
}

# Aliases and time savers
Set-Alias code codium
Set-Alias clr clear
Set-Alias vim nvim
Set-Alias ls ezals
Set-Alias cat bat
Set-Alias ex explore

oh-my-posh init pwsh --config ~\omp.toml | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) }) 


