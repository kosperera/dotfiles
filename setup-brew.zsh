#!/usr/bin/env zsh

# First, make sure to install Homebrew from https://brew.sh
# or download from https://github.com/Homebrew/brew/releases

# Run without downloading:
# curl https://raw.githubusercontent.com/kosalanuwan/dotfiles/HEAD/setup-brew.zsh | zsh
# Close any open System Preferences panes, to prevent them from overriding

# Settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `setup-*` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

brew tap homebrew/homebrew-cask-versions
brew tap microsoft/git

# Install a few web browsers
echo "Installing a few web browsers"
brew install --cask firefox-developer-edition
brew install --cask safari-technology-preview

# Install git tools
# Uncomment if not installed via xcode
echo "Installing git tools"
brew install git
brew install git-lfs
brew install --cask git-credential-manager
brew install gh

echo "git --version: $(git --version)"
echo "gh --version: $(gh --version)"

# Replace docker with rancher for ent/professional use.
# See https://www.docker.com/blog/updating-product-subscriptions/
echo "Installing a few apps with brew --cask"
brew install --cask podman-desktop
# brew install --cask docker
# brew install --cask rancher
brew install --cask visual-studio-code
brew install --cask homebrew/cask-versions/typora-dev
brew install --cask canva
brew install --cask zed
brew install --cask figma
brew install --cask inkscape
brew install --cask discord
brew install --cask zoom

# echo "docker --version: $(docker --version)"
echo "podman --version: $(podman --version)"
echo "code --version: $(code --version)"
echo "zed --version: $(zed --version)"

# Remove outdated versions from the cellar.
brew cleanup
