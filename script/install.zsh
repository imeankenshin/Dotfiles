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
  curl -fsSL "https://github.com/$DOTFILES_REPO/archive/main.zip" -o "$HOME/Dotfiles.zip"
  echo "Unzipping dotfiles..."
  unzip -o "$HOME/Dotfiles.zip" -d "$HOME"
  echo "Removing dotfiles zip..."
  rm -rf "$HOME/Dotfiles.zip"
}

install-brew() {
  echo "Installing Homebrew 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Installing Homebrew packages..."
  brew bundle --file="$DOTFILES_PATH/Brewfile"
}

install-zplug() {
  echo "Installing zplug 🧩"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
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
fi
if [[ ! -d "/opt/homebrew" ]]; then
  install-brew
else
  echo "Homebrew already installed"
fi
if [[ ! -d "$HOME/.zplug" ]]; then
  install-zplug
else
  echo "zplug already installed"
fi
if [[ ! -d "$HOME/.local/share/lunarvim" ]]; then
  install-lunarvim
else
  echo "LunarVim already installed"
fi
. "$DOTFILES_PATH/script/activate.zsh"
echo "Done"
