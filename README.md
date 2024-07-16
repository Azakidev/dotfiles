# Dotfiles!
For windows (powershell) and linux (zsh)

# Dependencies
Common:
- Zoxide
- Oh my posh
- Node
- Zig/gcc (a c compiler)
- Neovim
- Git
- Ripgrep
- Fastfetch
- Eza

### Windows symlinks
```pwsh
New-Item -ItemType SymbolicLink -Path ~\AppData\Local\nvim -Target C:\Users\[USERNAME]\Projects\dotfiles\nvim\
New-Item -ItemType SymbolicLink -Path ~\omp.toml -Target C:\Users\[USERNAME]\Projects\dotfiles\oh-my-posh\config.toml
New-Item -ItemType SymbolicLink -Path C:\Users\[USERNAME]\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target C:\Users\[USERNAME]\Projects\dotfiles\pwsh.ps1
```
### Linux symlinks
```zsh
ln -s oh-my-posh/config.toml ~/.config/oh-my-posh/config.toml
ln -ds nvim ~/.config/nvim
ln -s .zshrc ~/zshrc
ln -ds fastfetch ~/.config/fastfetch
```
