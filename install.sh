#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Setup macOS
/bin/bash -c macos.sh;

# Symlink .dotfiles into HOME

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
for file in .{zsh_prompt,exports,aliases,functions,zshrc,gitconfig,gitignore,gh,npmrc}; do
  # Symlink instead of replacing.
  /bin/bash -ln -s $file ~/$file;
done;
unset file;

# GitHub is special
/bin/bash -ln -s ~/.config/gh/config.yml ~/.gh

# Install brew and some tools
if [[ ! -e "opt/homebrew/bin/brew" ]]; then /bin/bash -c brew.sh; &> /dev/null fi

source ~/.zshrc