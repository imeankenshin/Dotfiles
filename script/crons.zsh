# _cron.zsh is a file that contains all the cron jobs that are used when the shell is loaded
# A cron job to ask the user to install missing plugins if there are any
if ! zplug check --verbose; then
  printf "Install missing plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
