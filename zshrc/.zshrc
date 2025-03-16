# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Brew shell completion setup
# see https://github.com/Homebrew/brew/blob/master/docs/Shell-Completion.md#configuring-completions-in-zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
# if type brew &>/dev/null; then
#   # HOMEBREW_PREFIX="$(brew --prefix)"
#   FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"

#   rm -rf ~/.zcompdump; compinit;
#   chmod -R go-w "$HOMEBREW_PREFIX/share"
# fi

# For sdkman to work!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Preferred editor
export EDITOR=/opt/homebrew/bin/code
# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';
# For compilers to find libxml2
export LDFLAGS="-L/usr/local/opt/libxml2/lib"  
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# For pkg-config to find libxml2
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# Set the directory we want to store zinit and plugins
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download zinit, if it's not there yet.
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load powerlevel10k theme
zinit ice depth "1"
zinit light romkatv/powerlevel10k

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# Add zsh snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo
# zinit snippet OMZP::gh
zinit snippet OMZP::sdk
zinit snippet OMZP::aws
# zinit snippet OMZP::docker
zinit snippet OMZP::opentofu
zinit snippet OMZP::dotenv

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Prompt Style? Pure
# Non-permanent Content Location? Right
# Show Current Time? No
# Prompt Height? Two Lines
# Prompt Spacing? Sparse
# Enable Transient Prompt? YES
# Instant Prompt Mode? Verbose (Recommended)
# Overwrite ~/.p10k.zsh? Yes
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# Completion styling
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -la $realpath'
zstyle ':fzf-tab:complete:__zoxide:*' fzf-preview 'ls -la $realpath'

# Aliases and the likes.
source ~/.omz-yolo.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
