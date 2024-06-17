#!/usr/bin/env zsh

# Symlink .dotfiles into HOME
# Symlink instead of replacing.
# ln -s <source> <destination>
# E.g. ln -s ~/.dotfiles/.docker-compose ~/.docker-compose

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

DOTFILES_DIR="$HOME/.dotfiles"

# GitHub is special.
mkdir -p $HOME/config/gh
rm -rf $HOME/.config/gh/config.yml && ln -s $DOTFILES_DIR/.gh.c.yml $HOME/.config/gh/config.yml

# Oh-my-zsh custom.
for omzfile in {prompt,aliases,exports,functions}.zsh; do
  rm -rf $ZSH_CUSTOM/$omzfile && ln -s $DOTFILES_DIR/.oh-my-zsh/$omzfile $ZSH_CUSTOM/$omzfile
done;
unset omzfile;

# Symlink the rest.
for dotfile in .{zshrc,gitconfig,gitignore,npmrc,nvmrc}; do
  rm -rf $HOME/$dotfile && ln -s $DOTFILES_DIR/$dotfile $HOME/$dotfile
done;
unset dotfile;

# Initialize new settings.
source $HOME/.zshrc
