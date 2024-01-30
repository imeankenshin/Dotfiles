export PNPM_HOME="/Users/kenshin/Library/pnpm"
export DOTFILES_PATH="$HOME/Dotfiles"
export GPG_TTY=$(tty)

source "$HOME/.cache/p10k-instant-prompt-$USER.zsh"
source "$HOME/.zplug/init.zsh"
source "$HOME/.p10k.zsh"

. "$DOTFILES_PATH/script/functions.zsh"
. "$DOTFILES_PATH/script/crons.zsh"

binary "$HOME/go/bin"
binary "$HOME/.cargo/bin"
binary "$HOME/Library/pnpm"
binary "$HOME/.local/bin"
binary "/opt/homebrew/bin"
binary "/opt/homebrew/sbin"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "marzocchi/zsh-notify"
zplug "tcnksm/docker-alias", use:zshrc
zplug "romkatv/powerlevel10k", as:theme
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh

zplug load

alias "lg"="lazygit"
alias "~"="cd ~"
alias "/"="cd /"
alias ".."="cd .."
alias "..."="cd ../.."
alias "quit"="exit"

zle -N _fzf_history_search
zle -N _start_editing

bindkey '^R' _fzf_history_search
bindkey '^V' _start_editing

eval "$(mise activate)"
