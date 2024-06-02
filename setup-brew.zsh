#!/usr/bin/env zsh

# First, make sure to install Homebrew
# from https://github.com/Homebrew/brew/releases

# Settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `setup-*` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "brew version: $(brew -v)"

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install a few Terminal stuff.
brew install typewritten

# Install git tools
# Uncomment if not installed via xcode
echo "Installing git tools"
brew install --cask git-credential-manager
brew install gh

echo "git version: $(git version)"
echo "gh version: $(gh version)"

echo "Installing container tools"
# Replace podman from Docker.
# See https://github.com/localstack/localstack/issues/5304
brew install --cask docker
echo "docker version: $(docker version)"
# brew install podman
# echo "podman version: $(podman version)"


echo "Installing a few apps with brew --cask"
brew install --cask visual-studio-code
brew install --cask intellij-idea-ce
brew install --cask typora@dev
brew install --cask canva
brew install --cask figma
brew install --cask inkscape
brew install --cask discord
brew install --cask zoom

echo "code --version: $(code --version)"

# Remove outdated versions from the cellar.
brew cleanup
