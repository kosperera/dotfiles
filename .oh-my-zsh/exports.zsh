# Preferred editor
export EDITOR=/opt/homebrew/bin/code

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# For compilers to find libxml2
export LDFLAGS="-L/usr/local/opt/libxml2/lib"  
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# For pkg-config to find libxml2
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"  
# For node version management
# export NVM_DIR="~/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Brew shell completion setup
# see https://github.com/Homebrew/brew/blob/master/docs/Shell-Completion.md#configuring-completions-in-zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
if type brew &>/dev/null
then
  # HOMEBREW_PREFIX="$(brew --prefix)"
  FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"

  rm -f ~/.zcompdump; compinit
  chmod -R go-w "$HOMEBREW_PREFIX/share"
fi

# For sdkman to work!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
