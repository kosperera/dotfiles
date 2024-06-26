#!/usr/bin/env zsh

# ZSH prompt

# Load vcs_info function
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Gathering-information-from-version-control-systems
autoload -Uz vcs_info

# Hook Functions
# http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
# Executed before each prompt
precmd () {
  # Add vsc_info to executed before each prompt
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  vcs_info
}

# Executed whenever the current working directory is changed
# See https://zsh.sourceforge.io/Doc/Release/Functions.html#Hook-Functions
chpwd () {
  # Install node using nvm when .nvmrc config file exists in a directory
  # Simplified version of https://github.com/nvm-sh/nvm#zsh
  if [ -f .nvmrc ]; then
    pnpm env use --global $(cat ~/.nvmrc)
  fi;
}

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
# http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting
setopt PROMPT_SUBST

# Enable git only (i don't use anything else)
# Enable info about uncommited changes in working directory
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Quickstart
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{242} (staged)%f"
zstyle ':vcs_info:*' unstagedstr "%F{242} (dirty)%f"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Format vsc info message
# zstyle ':vcs_info:git:*' formats "%F{yellow}%r > %b%f vcs: %F{yellow}%s%f "
zstyle ':vcs_info:git:*' formats "%F{yellow}%r → %b%F{242}%u%c%m%f%f "

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{242} (untracked)%f'
  fi
}

prompt() {
  if [ -d .git ]; then
    echo ${vcs_info_msg_0_}
  else
    echo '%F{yellow}%3~%f '
  fi;
}

PROMPT='%U%F{4}%~%f%u '
RPROMPT='${vcs_info_msg_0_}'


# Completion System
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Completion-System
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Minimal Prompt
# https://typewritten.dev/#/
autoload -U promptinit; promptinit
prompt typewritten

# Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
