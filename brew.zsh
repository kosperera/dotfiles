#!/bin/zsh

# Install brew
if [ ! -e "/usr/local/bin/brew" ]; then
  {
    /bin/zsh "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  } &> /dev/null
fi

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Uncomment to install a modern version of Bash.
# brew install bash
# brew install bash-completion2

# Switch to using brew-installed bash as default shell
# if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#   chsh -s "${BREW_PREFIX}/bin/bash";
# fi;

# Install CLI tools
# Uncomment if not installed via XCode
brew install git
brew install git-lfs
# Uncomment install locally, use devcontainers otherwise.
# brew install nvm
# brew install yarn

brew cask gh

brew tap microsoft/git
brew install --cask git-credential-manager-core

# brew cask install docker
# brew cask install figma
# brew cask install visual-studio-code

# Remove outdated versions from the cellar.
brew cleanup