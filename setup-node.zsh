#!/usr/bin/env zsh

# Inatall Node JS ecosystem locally, otherwise, use a dev container.
# Learn more at https://www.youtube.com/watch?v=b1RavPr_878

echo "Installing NVM and a few CLI tools"
brew install nvm

# Initialize new settings.
source ~/.zshrc

# Install Node via NVM.
echo "nvm --version: $(nvm --version)"
if [ -f .nvmrc ];
then
    # Install specific version.
    nvm install $(cat ~/.nvmrc)
else
    # Install default lts.
    nvm install
fi
echo "node --version: $(node --version)"

# Install a few CLI tools.
brew install yarn
# brew install pnpm
