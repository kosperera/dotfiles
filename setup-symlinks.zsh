#!/usr/bin/env zsh

# Symlink .dotfiles into HOME
# Symlink instead of replacing.
# ln -s <source> <destination>
# E.g. ln -s ~/.dotfiles/.docker-compose ~/.docker-compose

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# GitHub is special.
mkdir -p ~/.config/gh
rm -rf ~/.config/gh/config.yml && ln -s ~/.dotfiles/.gh.c.yml ~/.config/gh/config.yml
# Zed is too new to sync.
# mkdir -p ~/.config/zed
# rm -rf ~/.config/zed/settings.json && ln -s ~/.dotfiles/.zed.s.json ~/.config/zed/settings.json

# Symlink the rest.
for file in .{zshrc-prompt,zshrc,gitconfig,gitignore,npmrc,nvmrc}; do
  rm -rf ~/$file && ln -s ~/.dotfiles/$file ~/$file
done;
unset file;

# Initialize new settings.
source ~/.zshrc
