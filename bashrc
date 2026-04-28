
# Histfile
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Opts
set autocd extglob

# Colorize manpages, thanks Dave
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 4)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 6)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export MANROFFOPT='-c'
export MANPAGER='less'
export PAGER='less'

# Skip OMP in TTY
if ! tty | grep -q "tty" ; then
    eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/config.toml)"
fi

# Time savers
alias clr='clear'
alias cat='bat'
alias vim='nvim'
alias ls='eza --icons=auto'
alias fetch='fastfetch --config ~/.config/fastfetch/config.jsonc'
alias :q='exit'
alias uefi='systemctl reboot --firmware-setup'
alias avenv='source .venv/bin/activate'

# Git aliases
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gsall='for dir in ./*; do if [ -d "$dir" ]; then cd $dir; pwd; gs; cd ..; fi; done'
alias pullall='for dir in ./*; do if [ -d "$dir" ]; then cd $dir; pwd; git pull; cd ..; fi; done'

# Arch commands
if [[ $(cat /etc/os-release | grep '^ID=.*$' | cut -d "=" -f2) = "arch" ]]; then
    # Yay shortcuts
    alias upd='yay -Syu --noconfirm'
    alias add='yay -S'
    alias remove='yay -R'
    # Quick clean
    alias clean='yay -Yc'
    alias cleanss='rm -rf ~/Pictures/Screenshots/* && echo "Cleaned screenshots"'
    alias cleanyay='rm -rf --interactive=never ~/.cache/yay/* && echo "Cleaned yay cache"'
    alias cleanall='clean && cleanss && cleanyay'
    ## Desktop brightness control because not all desktops have it
    alias dim="ddcutil -d 1 setvcp 10 0"
    alias bright="ddcutil -d 1 setvcp 10 100"
    alias blc="ddcutil -d 1 setvcp 10"
    # Ollama GPU override on Arch
    alias ollama="HSA_OVERRIDE_GFX_VERSION=\"10.3.0\" ollama"
fi

# NixOS commands
if [[ $(cat /etc/os-release | grep '^ID=.*$' | cut -d "=" -f2) = "nixos" ]]; then
    FLAKE_PATH="$HOME/Projects/dotfiles/nixos/"
    # Rebuild and update
    alias dry="nh os switch -n $FLAKE_PATH"
    alias rebuild="nh os switch $FLAKE_PATH"
    alias dryu="nh os switch -nu $FLAKE_PATH"
    alias upd="nh os switch -u $FLAKE_PATH"
    # Alias betterdiscordctl to not keep it installed
    alias betterdiscordctl="nix run nixpkgs\#betterdiscordctl --"
fi

eval "$(zoxide init bash --cmd cd)"
