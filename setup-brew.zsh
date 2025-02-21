#!/usr/bin/env zsh

# First, make sure to install Homebrew
# from https://github.com/Homebrew/brew/releases

# Settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `setup-*` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for potential problems.
brew doctor
# Update recipes and formulae.
brew update && brew upgrade

# Nerd Fonts for the Terminal and the Editors.
# Once installed, you can select them in the Terminal preferences.
echo "Installing Nerd Fonts"
brew search '/font-jetbrains.*-nerd-font/' | awk '{ print $1 }' | xargs brew install

echo "Installing a few Terminal stuff"
brew install fzf
brew install zoxide && echo "zoxide version: $(zoxide --version)"
brew install httpie && echo "httpie version: $(httpie --version)"

# Uncomment if not installed via xcode
echo "Installing git tools"
brew install --cask git-credential-manager
brew install gh && echo "git version: $(git version)" && echo "gh version: $(gh version)"

echo "Installing cloud and cloud infra tools"
brew install awscli && echo "aws version: $(aws --version)"
brew install opentofu && echo "tofu version: $(tofu version)"

echo "Installing container tools"
# Replace podman from Docker.
# See https://github.com/localstack/localstack/issues/5304
brew install --cask docker && echo "docker version: $(docker version)"
brew install localstack/tap/localstack-cli

echo "Installing a few apps with brew --cask"
brew install --cask visual-studio-code
brew install --cask intellij-idea-ce
brew install --cask typora@dev

# Uninstalls unnecessary formulae.
brew autoremove
brew cleanup
