# Dotfiles!
For windows (powershell) and linux (zsh)
> [!NOTE]
> It's recommended to clone this repo into `$HOME/Documents/Projects/` for easier setup

# Dependencies
## Common:
- Git
- Oh my posh
- zoxide
- Node
- A C/zig compiler
- neovim
- ripgrep
- fastfetch
- eza
- bat
- Unison
## Linux:
- yay
- zsh-autosuggestions
- zsh-syntax-highlighter
- thefuck
- btop
## Windows:
- Powertoys
- Winget
- PowerShell 7 installed via winget

### Windows symlinks
```pwsh
New-Item -ItemType SymbolicLink -Path ~\AppData\Local\nvim -Target $HOME\Projects\dotfiles\nvim\
New-Item -ItemType SymbolicLink -Path ~\omp.toml -Target $HOME\Projects\dotfiles\oh-my-posh\config.toml
New-Item -ItemType SymbolicLink -Path $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target $HOME\Projects\dotfiles\pwsh.ps1
```
If the symlink is invalid, replace it with the actual path
### Linux symlinks
```zsh
ln -s oh-my-posh/config.toml ~/.config/oh-my-posh/config.toml
ln -ds nvim ~/.config/nvim
ln -s .zshrc ~/.zshrc
ln -ds fastfetch ~/.config/fastfetch
```
