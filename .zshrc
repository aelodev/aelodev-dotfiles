#asusctl
# If on TTY1, start Hyprland
if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland &>/dev/null
fi

asusctl profile --profile-set Performance > /dev/null 2>&1

# The following lines were added by compinstall
zstyle :compinstall filename '/home/lucenabo/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

eval "$(starship init zsh)"

source /home/lucenabo/programs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# mapping

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# aliases

alias ls="eza --icons=always"
alias logout="kill -9 -1"
alias cat="bat -p"
alias icat="kitten icat"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/lucenabo/.dart-cli-completion/zsh-config.zsh ]] && . /home/lucenabo/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

