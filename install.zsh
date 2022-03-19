# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Setup macOS
/bin/zsh macos.zsh;

# Create simlinks for dotfiles
/bin/zsh symlink.zsh;

# Install brew and some tools
if [ ! -e "opt/homebrew/bin/brew" ]; then /bin/zsh brew.zsh; &> /dev/null fi

# Reload the zsh profile from home.
source ~/.zshrc