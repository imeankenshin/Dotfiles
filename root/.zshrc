# exports
export PNPM_HOME="/Users/kenshin/Library/pnpm"
export DOTFILES_PATH="$HOME/Dotfiles"
export GPG_TTY=$TTY
# sources
source "$HOME/.zplug/init.zsh"
source "$DOTFILES_PATH/script/functions.zsh"
source "$DOTFILES_PATH/script/crons.zsh"
# path
binary "$HOME/go/bin"
binary "$HOME/.cargo/bin"
binary "$HOME/Library/pnpm"
binary "$HOME/.local/bin"
binary "/opt/homebrew/bin"
binary "/opt/homebrew/sbin"
# zplug
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "marzocchi/zsh-notify"
zplug "tcnksm/docker-alias", use:zshrc
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh

zplug load

# aliases
# shorter commands
alias "lg"="lazygit"
# directories
alias "~"="cd ~"
alias "/"="cd /"
alias ".."="cd .."
alias "..."="cd ../.."
alias "godf"="cd $DOTFILES_PATH"
# other
alias "quit"="exit"

zle -N _fzf_history_search
zle -N _start_editing

bindkey '^R' _fzf_history_search
bindkey '^V' _start_editing
# eval
eval "$(mise activate)"
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerline.omp.json')"
