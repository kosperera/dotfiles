#!/usr/bin/env zsh

# Symlink .dotfiles into HOME
# Symlink instead of replacing.
# ln -s <source> <destination>
# E.g. ln -s ~/.dotfiles/.docker-compose ~/.docker-compose

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

DOTFILES_DIR="$HOME/.dotfiles"

# Make the terminal smarter.
ln -s -f $DOTFILES_DIR/.oh-my-zsh/makesmarter.zsh ${ZSH_CUSTOM:-"~/.oh-my-zsh/custom"}/makesmarter.zsh

# GitHub is very special.
mkdir -p $HOME/.config/gh
ln -s -f $DOTFILES_DIR/.gh.c.yml $HOME/.config/gh/config.yml

# Symlink the rest.
ln -s -f $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
ln -s -f $DOTFILES_DIR/.gitignore $HOME/.gitignore

# Symlink the zsh config files.
# To customize prompt, run `p10k configure` or edit .p10k.zsh.
ln -s -f $DOTFILES_DIR/.p10k.zsh $HOME/.p10k.zsh
ln -s -f $DOTFILES_DIR/.zshrc $HOME/.zshrc

# Initialize new settings.
source $HOME/.zshrc
