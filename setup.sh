#!/bin/bash

git pull

mkdir -p ~/.config/nvim/
mkdir -p ~/.config/kitty/
mkdir -p ~/.config/borders/

cp -r ./config/nvim/ ~/.config/nvim/
cp -r ./config/kitty/ ~/.config/kitty/
cp -r ./config/borders/ ~/.config/borders/
cp -r ./.zshrc ~/.zshrc
cp -r ./.aerospace.toml ~/.aerospace.toml

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
# brew update

# Tap the cask fonts repository if not already tapped
# if ! brew tap | grep "^homebrew/cask-fonts\$" > /dev/null; then
#   echo "Tapping homebrew/cask-fonts..."
#   brew tap homebrew/cask-fonts
# else
#   echo "homebrew/cask-fonts is already tapped."
# fi

# Install font-jetbrains-mono-nerd-font if not installed
if ! brew list --cask | grep "^font-jetbrains-mono-nerd-font\$" > /dev/null; then
  echo "Installing font-jetbrains-mono-nerd-font..."
  brew install --cask font-jetbrains-mono-nerd-font
else
  echo "font-jetbrains-mono-nerd-font is already installed."
fi

# Install fzf if not installed
if ! brew list | grep "^lazygit\$" > /dev/null; then
  echo "Installing lazygit..."
  brew install lazygit
else
  echo "lazygit is already installed."
fi

# Install fzf if not installed
if ! brew list | grep "^fzf\$" > /dev/null; then
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

# Install borders if not installed
if ! command_exists borders; then
  echo "borders not found. Installing borders..."
  brew tap FelixKratz/formulae
  brew install borders
else
  echo "borders is already installed."
fi

# Install borders if not installed
if ! command_exists aerospace; then
  echo "aerospace not found. Installing aerospace..."
  brew install --cask nikitabobko/tap/aerospace
else
  echo "aerospace is already installed."
fi

echo "All installations and checks are complete."
