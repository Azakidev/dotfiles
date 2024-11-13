$env:POSH_GIT_ENABLED=$true
Import-Module posh-git

# Functions
    # Sync with unison
function syncart { Param($arg) unison -ignore "Name desktop.ini" -batch $arg C:\Users\zazag\Pictures\Art ssh://zazag@192.168.0.17/Pictures/Art }
function syncm { Param($arg) unison -ignore "Name desktop.ini" -batch $arg C:\Users\zazag\Music ssh://zazag@192.168.0.17/Music }
function syncobsidian { Param($arg) unison -ignore "Name desktop.ini" -ignore "Name .stfolder" -batch $arg C:\Users\zazag\Documents\Obsidian ssh://zazag@192.168.0.17/Documents/Obsidian }
    # Utilities
function upd { Param($arg) winget update -r $arg }
function ezals { Param($arg) eza --icons=always --no-quotes $arg }
function explore { explorer . }
function fetch { fastfetch --config $HOME\Projects\dotfiles\fastfetch\wconfig.jsonc }
    # Git aliases
function gs { git status }
function gic { Param($arg) git commit $arg }
function ga    { Param($arg) git add $arg }
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


