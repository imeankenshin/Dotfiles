# exports
export PNPM_HOME="$HOME/Library/pnpm"
export DOTFILES_PATH="$HOME/Dotfiles"
if [ -r ~/.zshrc ]; then echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zshrc; \
  else echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zprofile; fi
export GPG_TTY=$TTY
export POSH_THEME_PATH="$HOME/.config/posh/themes/meanit.omp.toml"
# sources
source "$HOME/.zplug/init.zsh"
source "$DOTFILES_PATH/script/functions.zsh"
# path
binary "$HOME/go/bin"
binary "$HOME/.cargo/bin"
binary "$HOME/Library/pnpm"
binary "$HOME/.local/bin"
binary "/opt/homebrew/bin"
binary "/opt/homebrew/sbin"
# zplug
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "marzocchi/zsh-notify"
zplug "tcnksm/docker-alias", use:zshrc
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh

zplug load

# aliases
alias "lg"="lazygit"
alias "st"="speedtest"
alias "quit"="exit"

zle -N _fzf_history_search
zle -N _start_editing

bindkey '^R' _fzf_history_search
bindkey '^V' _start_editing
# eval
eval "$(mise activate)"
eval "$(oh-my-posh init zsh --config $POSH_THEME_PATH)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

export GPG_TTY=$(tty)
