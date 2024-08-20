export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export PATH="/opt/rocm/bin:/opt/rocm-*/:$PATH"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
typeset -g -A key

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit && compinit

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "$terminfo[kdch1]" delete-char
bindkey "^[[1;$terminfo[kdch1]" kill-word
bindkey "^[[1;$terminfo[kbs]" backward-kill-word

alias upd='yay -Syu'
alias add='yay -S'
alias remove='yay -R'

alias rs='trash'
alias clr='clear'
alias cat='bat'
alias top='btop'
alias vim='nvim'
alias code='vscodium'
alias ls='eza --icons'
alias fetch='fastfetch --config ~/.config/fastfetch/config.jsonc'

alias uefi='systemctl reboot --firmware-setup'

# Git aliases
alias gs='git status'
alias gc='git commit'
alias ga='git add'
# Quick clean
alias clean='yay -Yc'
alias cleanss='rm -rf ~/Pictures/Screenshots/* && echo "Cleaned screenshots"'
alias cleanyay='rm -rf --interactive=never ~/.cache/yay/* && echo "Cleaned yay cache"'
alias cleantasks='rm -rf .cache/evolution/tasks/* && echo "Task cache cleaned"'
alias cleanall='clean && cleanss && cleanyay && cleantasks'

eval $(thefuck --alias)
eval "$(zoxide init zsh --cmd cd)"
