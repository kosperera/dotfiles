#!/bin/zsh

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

brew tap homebrew/cask-versions
brew tap microsoft/git

# Install CLI tools
# Uncomment if not installed via XCode
brew install git
brew install git-lfs
brew install gh

# Uncomment install locally, use devcontainers otherwise.
# brew install nvm
# brew install yarn

brew install --cask git-credential-manager-core
brew install --cask docker
brew install safari-technology-preview
brew install firefox-developer-edition
brew install figma
brew install visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup