#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/kosalanuwan/dotfiles/main/macos.sh)";

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
for file in ~/.{bash_profile,gitconfig,gitignore}; do
    curl https://raw.githubusercontent.com/kosalanuwan/dotfiles/master/.$file > $HOME/.$file && source $HOME/.$file;
done;
unset file;

if [[ ! -e "/usr/local/bin/brew" ]]; then
  {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/main/install.sh)" &&
                 "$(curl -fsSL https://raw.githubusercontent.com/kosalanuwan/dotfiles/main/brew.sh)";
  } &> /dev/null
fi
