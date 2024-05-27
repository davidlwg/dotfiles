#!/bin/bash

cp -r ./.config/nvim/ ~/.config/nvim/
cp -r ./.config/kitty/ ~/.config/kitty/
cp -r ./.zshrc ~/.zshrc

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to check if Oh My Zsh is installed
oh_my_zsh_installed() {
  [ -d "$HOME/.oh-my-zsh" ]
}

# Install Homebrew if not installed
if ! command_exists brew; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Update Homebrew to ensure we have the latest information
brew update

# Tap the cask fonts repository if not already tapped
if ! brew tap | grep -q "^homebrew/cask-fonts\$"; then
  echo "Tapping homebrew/cask-fonts..."
  brew tap homebrew/cask-fonts
else
  echo "homebrew/cask-fonts is already tapped."
fi

# Install font-jetbrains-mono-nerd-font if not installed
if ! brew list --cask | grep -q "^font-jetbrains-mono-nerd-font\$"; then
  echo "Installing font-jetbrains-mono-nerd-font..."
  brew install --cask font-jetbrains-mono-nerd-font
else
  echo "font-jetbrains-mono-nerd-font is already installed."
fi

# Install fzf if not installed
if ! brew list | grep -q "^fzf\$"; then
  echo "Installing fzf..."
  brew install fzf
else
  echo "fzf is already installed."
fi

# Install Oh My Zsh if not installed
if ! oh_my_zsh_installed; then
  echo "Oh My Zsh not found. Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh is already installed."
fi

echo "All installations and checks are complete."
