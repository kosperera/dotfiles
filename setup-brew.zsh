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

brew tap homebrew/cask-versions \
         microsoft/git

# Install Git tools
# Uncomment if not installed via XCode
echo "Installing git tools"
brew install git \
             git-lfs \
             gh

# Inatall Node and the like locally, otherwise, use a devcontainer.
# Learn more at https://www.youtube.com/watch?v=b1RavPr_878
echo "Installing NVM and Yarn"
brew install nvm \
             yarn

echo "nvm --version: $(nvm --version)"
echo "yarn --version: $(yarn --version)"

echo "Installing a few apps with brew --cask"
brew install --cask git-credential-manager-core \
                    docker \
                    discord \
                    zoom

echo "Installing web browsers and a few apps"
brew install safari-technology-preview \
             firefox-developer-edition \
             figma \
             visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup