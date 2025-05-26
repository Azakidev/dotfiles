$env:POSH_GIT_ENABLED=$true
Import-Module posh-git

# Functions
    # Utilities
function upd { Param($arg) winget update -r $arg }
function ezals { Param($arg) eza --icons=always --no-quotes $arg }
function fetch { fastfetch --config $HOME\Projects\dotfiles\fastfetch\wconfig.jsonc }
    # Git aliases
function gs   { git status }
function push { git push }
function gic  { Param($arg) git commit -a -m $arg; push }
function ga   {
    Param($arg)
    if ($null -ne $arg) {
        git add $arg;
    } else {
        git add .;
    }
    git status;
}
    # The time saver of all time
function so {
    Param($arg)
    if ($null -ne $arg) {
        $res = fzf -q $arg;
    }
    else {
        $res = fzf;
    }
    if ($null -ne $res) {
        explorer $res;
    }
}

# Aliases and time savers
Set-Alias code codium
Set-Alias clr clear
Set-Alias vim nvim
Set-Alias ls ezals
Set-Alias cat bat

oh-my-posh init pwsh --config ~\omp.toml | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) }) 

Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
