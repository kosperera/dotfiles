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
# See aliases https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew#aliases
# Update Homebrew data, then list outdated formulae and casks.
# Upgrade outdated formulae and casks, then run cleanup.
bubu

echo "Installing a few Terminal stuff"
bi zoxide && echo "zoxide version: $(zoxide --version)"
bi httpie && echo "httpie version: $(httpie --version)"

# Uncomment if not installed via xcode
echo "Installing git tools"
bcin git-credential-manager
bi gh

echo "git version: $(git version)"
echo "gh version: $(gh version)"

echo "Installing cloud and cloud infra tools"
bi awscli && echo "aws version: $(aws --version)"
bi opentofu && echo "tofu version: $(tofu version)"

echo "Installing container tools"
# Replace podman from Docker.
# See https://github.com/localstack/localstack/issues/5304
bcin docker && echo "docker version: $(docker version)"
bi localstack/tap/localstack-cli

echo "Installing a few apps with brew --cask"
bcin visual-studio-code && echo "vscode version: $(code --version)"
bcin intellij-idea-ce
bcin typora@dev

# Remove unused versions of the installed formulae.
ba  # Autoremove
bcn # Cleanup
