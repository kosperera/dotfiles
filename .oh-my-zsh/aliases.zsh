# Set personal aliases

# `docker` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#aliases
alias dsprune='docker system prune -a -f --volumes'
# `aws` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aws#plugin-commands
alias aws_config='aws configure sso'
alias aws_login='asp admin login'
# Common Question https://stackoverflow.com/a/75632221
alias aws_export_creds='eval "$(aws configure export-credentials --profile admin --format env)"'
# `tf` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/terraform#aliases
alias tfh='tf -h'
alias tfaa='tfa -auto-approve'
alias tfda='tfd -auto-approve'
alias tfada='tfa -destroy -auto-approve'

# utility shortcuts improved
alias -g yolo='omz update && sdk selfupdate force && sdk update && bubu && bugbc' # Upgrade every-fuckin-thing

alias -g reload='omz reload'                # Reload the zshrc

alias cp='cp -riv'                          # Copy recursivve, safe, and verbose
alias mv='mv -iv'                           # Move safe and verbose
# alias md='mkdir -vp'                      # Make directory
# Use `l` instead.
# alias ll='ls -FGlAhp'                     # Show all including hidden files, folders, etc.
alias less='less -FSRXc'                    # Preferred 'less' implementation

# alias cd..='cd ../'                       # Go back 1 directory level (for fast typers)
alias -g ..='cd ../'                           # Go back 1 directory level
# alias ...='cd ../../'                     # Go back 2 directory levels
alias -g .3='....'                             # Go back 3 directory levels
alias -g .4='.....'                            # Go back 4 directory levels
alias -g .5='......'                           # Go back 5 directory levels
alias -g .6='cd ../../../../../..'             # Go back 6 directory levels
alias -g edit='code'                           # edit:         Opens any file in VS Code editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias -g ~="cd ~"                              # ~:            Go Home
alias -g c='clear'                             # c:            Clear terminal display
alias -g cls='clear'                           # cls:          Clear terminal display (for fast typers)
alias which='type -a'                       # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

# Folder management
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

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

# Why your mac is so slow?
alias top="top -o vsize"
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias -g stats='zsh_stats'