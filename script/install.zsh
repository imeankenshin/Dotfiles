#!/usr/bin/env zsh

export DOTFILES_PATH="$HOME/Dotfiles"
OWNER="imeankenshin"
REPONAME="Dotfiles"
DOTFILES_REPO="$OWNER/$REPONAME"
LOGO="
  ████████▄   ▄██████▄      ███        ▄████████  ▄█   ▄█          ▄████████    ▄████████
  ███   ▀███ ███    ███ ▀█████████▄   ███    ███ ███  ███         ███    ███   ███    ███
  ███    ███ ███    ███    ▀███▀▀██   ███    █▀  ███▌ ███         ███    █▀    ███    █▀
  ███    ███ ███    ███     ███   ▀  ▄███▄▄▄     ███▌ ███        ▄███▄▄▄       ███
  ███    ███ ███    ███     ███     ▀▀███▀▀▀     ███▌ ███       ▀▀███▀▀▀     ▀███████████
  ███    ███ ███    ███     ███       ███        ███  ███         ███    █▄           ███
  ███   ▄███ ███    ███     ███       ███        ███  ███▌    ▄   ███    ███    ▄█    ███
  ████████▀   ▀██████▀     ▄████▀     ███        █▀   █████▄▄██   ██████████  ▄████████▀   by $OWNER"

install-dotfiles() {
  echo "Installing dotfiles zip..."
  git clone "https://github.com/$DOTFILES_REPO.git" "$DOTFILES_PATH"
}

install-brew() {
  echo "Installing Homebrew 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Installing Homebrew packages..."
  brew bundle --file="$DOTFILES_PATH/Brewfile"
}

install-lunarvim() {
  echo "Installing LunarVim 🪐"
  LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
}

if [[ ! "$OSTYPE" == "darwin"* ]]; then
  echo "OS not supported"
  exit 1
fi

sudo -v
echo "$LOGO"
if [[ ! -d "$HOME/Dotfiles" ]]; then
  install-dotfiles
else
  echo "Dotfiles already installed"
  exit 1
fi
if [[ ! -d "/opt/homebrew" ]]; then
  install-brew
else
  echo "Homebrew already installed"
fi
if [[ ! -d "$HOME/.local/share/lunarvim" ]]; then
  install-lunarvim
else
  echo "LunarVim already installed"
fi
. "$DOTFILES_PATH/script/activate.zsh"
echo "Done"
