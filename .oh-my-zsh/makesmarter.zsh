# Preferred editor
export EDITOR=/opt/homebrew/bin/code
# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';
# For compilers to find libxml2
export LDFLAGS="-L/usr/local/opt/libxml2/lib"  
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# For pkg-config to find libxml2
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"  

# Set personal aliases

# `docker` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#aliases
alias dsprune='docker system prune -a -f --volumes'
# `aws` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aws#plugin-commands
alias aws_config='aws configure sso'
alias aws_login='asp admin login'
# Common Question https://stackoverflow.com/a/75632221
alias aws_refresh='eval "$(aws configure export-credentials --profile admin --format env)"'
# `tf` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/terraform#aliases
alias tfh='tf -h'
alias tfaa='tfa -auto-approve'
alias tfda='tfd -auto-approve'
alias tfada='tfa -destroy -auto-approve'
# yolo: Upgrade every-fuckin-thing
alias -g yolo='omz update && \
                       sdk selfupdate force && sdk update && \
                       bubo && bup --greedy && \
                       ba && bcn'

# Set standard shortcuts
alias -g reload='omz reload'                # Reload the zshrc
alias -g cd..='cd ..'
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'
alias cp='cp -riv'                          # Copy recursivve, safe, and verbose
alias mv='mv -iv'                           # Move safe and verbose
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias -g edit='code'                        # edit: Opens any file in VS Code editor
alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
alias -g c='clear'                          # c:            Clear terminal display
alias -g cls='clear'                        # cls:          Clear terminal display (for fast typers)
alias which='type -a'                       # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
# Folder management
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
# Networking
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
# Why my mac is so slow?
alias top="top -o vsize"
alias cleanup_DS="find . -type f -name '*.DS_Store' -ls -delete"
alias -g stats='zsh_stats'

# trash: Moves a file to the MacOS trash        
trash () { command mv "$@" ~/.Trash ; }
# ql: Opens any file in MacOS Quicklook Preview
ql () { qlmanage -p "$*" >& /dev/null; }    
# zipf: To create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }          
# extract: Extract most known archives with one command
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
          esac
      else
          echo "'$1' is not a valid file"
      fi
}
# ff: Find file under the current directory
ff () { /usr/bin/find . -name "$@" ; }      
# ffs: Find file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }  
# ffe: Find file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  
# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

# findPid: find out the pid of a specified process
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
findPid () { lsof -t -c "$@" ; }
# my_ps: List processes owned by my user:
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
# ii: display useful host related informaton
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ; myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

# serve: run a dead simple web server
# E.g. serve 4049
serve() {
    echo "Your cool server is running on http://localhost:$1"
    open http://localhost:$1/ && python3 -m http.server $1
}

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

# For `zoxide` commands to work with `cd`
export ZOXIDE_CMD_OVERRIDE="cd"
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init --cmd ${ZOXIDE_CMD_OVERRIDE:-z} zsh)"

# For sdkman to work!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

