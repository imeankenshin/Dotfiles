if [ -z "$DOTFILES_PATH" ]; then
  echo "DOTFILES_PATH is not set"
  exit 1
fi
# update brewfile
brew bundle dump --force --file=$DOTFILES_PATH/Brewfile
