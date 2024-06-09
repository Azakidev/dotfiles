# Dotfiles!

For windows (powershell) and linux (zsh)

## Relevant folders
~\AppData\Local\nvim -> nvim folder
~\omp -> oh-my-posh config on windows

### Windows symlinks
´´´pwsh
New-Item -ItemType SymbolicLink -Path ~\AppData\Local\nvim -Target C:\Users\zazag\Projects\dotfiles\nvim\
New-Item -ItemType SymbolicLink -Path ~\omp.toml -Target C:\Users\zazag\Projects\dotfiles\oh-my-posh\config.toml
New-Item -ItemType SymbolicLink -Path C:\Users\zazag\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target C:\Users\zazag\Projects\dotfiles\pwsh.ps1

´´´
