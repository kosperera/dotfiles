# Extend path
# export PATH="/usr/local/sbin:$PATH"
# export PATH="$PATH:/usr/local/bin/"
# export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/opt/libxml2/bin:$PATH"

# Changing directories
# https://zsh.sourceforge.io/Doc/Release/Options.html#Changing-Directories
setopt AUTO_CD

# History
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# ZSH case insensitive path-completion
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Completion System
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Completion-System
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Brew setup
eval "$(/opt/homebrew/bin/brew shellenv)"
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Load additional help/utilities.
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{path,zshrc-prompt,zshrc-exports,zshrc-aliases,zshrc-functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# # Android setup
# export ANDROID_HOME="$HOME/Library/Android/sdk"
# export PATH="$PATH:$ANDROID_HOME/emulator"
# export PATH="$PATH:$ANDROID_HOME/tools"
# export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"

# # ZSH auto cd
# setopt AUTO_CD

# # ZSH history
# HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# SAVEHIST=1000
# HISTSIZE=1000

# setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_IGNORE_DUPS
# setopt HIST_FIND_NO_DUPS
# setopt HIST_REDUCE_BLANKS
# setopt SHARE_HISTORY
# setopt APPEND_HISTORY

# autoload -Uz compinit && compinit
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
