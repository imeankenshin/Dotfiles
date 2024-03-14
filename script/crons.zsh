# _cron.zsh is a file that contains all the cron jobs that are used when the shell is loaded
# A cron job to ask the user to install missing plugins if there are any
if ! zplug check --verbose; then
  gum confirm "Install missing plugins?" && zplug install
fi

# A cron job to ask the user to update dotfiles repository if there are any
if [[ -n $(git --git-dir $DOTFILES_PATH/.git fetch) ]]; then
  gum confirm "Update dotfiles repository?" && git pull
fi

