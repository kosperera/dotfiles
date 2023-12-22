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

brew tap homebrew/homebrew-cask-versions \
         microsoft/git

# Install Web Browsers
echo "Installing a few web browsers"
brew install --cask firefox-developer-edition \
                    safari-technology-preview

# Install Git tools
# Uncomment if not installed via XCode
echo "Installing git tools"
brew install git \
             git-lfs \
             gh

echo "git --version: $(git --version)"
echo "gh --version: $(gh --version)"

# Inatall Node ecosystem locally, otherwise, use a dev container.
# Learn more at https://www.youtube.com/watch?v=b1RavPr_878
echo "Installing NVM and a few CLI tools"
# brew install nvm \
#              yarn \
#              pnpm

# echo "nvm --version: $(nvm --version)"
# echo "yarn --version: $(yarn --version)"
# echo "pnpm --version: $(pnpm --version)"

# Replace docker with rancher for ent/professional use.
# See https://www.docker.com/blog/updating-product-subscriptions/
echo "Installing a few apps with brew --cask"
brew install --cask git-credential-manager \
                    docker \
                    visual-studio-code \
                    homebrew/cask-versions/typora-dev \
                    figma \
                    inkscape \
                    discord \
                    zoom

echo "docker --version: $(docker --version)"
echo "code --version: $(code --version)"

# Remove outdated versions from the cellar.
brew cleanup
