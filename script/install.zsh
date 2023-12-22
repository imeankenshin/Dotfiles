#!/usr/bin/env zsh

DOTFILES_REPO="imeankenshin/Dotfiles"

local download-dotfiles() {
  if [ -d "$HOME/Dotfiles" ]; then
    echo "Dotfiles already installed."
    return
  fi
  echo "Installing dotfiles zip..."
  curl -fsSL "https://github.com/$DOTFILES_REPO/archive/main.zip" -o "$HOME/Dotfiles.zip"
  echo "Unzipping dotfiles..."
  unzip -o "$HOME/Dotfiles.zip" -d "$HOME"
  echo "Removing dotfiles zip..."
  rm -rf "$HOME/Dotfiles.zip"
}

local install-brew() {
  if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Installing Homebrew packages..."
    brew bundle --file="$HOME/Dotfiles/Brewfile"
  fi
}

local install-zplug() {
  if ! command -v zplug &> /dev/null; then
    echo "Installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
}


