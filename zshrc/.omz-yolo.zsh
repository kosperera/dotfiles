# `docker` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#aliases
alias dsprune='docker system prune -a -f --volumes'
# `tf` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/terraform#aliases
alias tfh='tf -h'
alias tfaa='tfa -auto-approve'
alias tfda='tfd -auto-approve'
alias tfada='tfa -destroy -auto-approve'
# yolo: Upgrade every-fuckin-thing!
alias -g yolo='zinit self-update && zinit update --parallel && \
               brew update && brew upgrade --greedy && brew autoremove && brew cleanup && brew doctor'

# Set standard shortcuts
alias -g cd..='cd ..'
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g .3='cd ../../..'
alias -g .4='cd ../../../..'
alias -g .5='cd ../../../../..'
alias -g .6='cd ../../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'

alias md='mkdir -pv'
alias rd=rmdir
alias cp='cp -riv'                          # Copy recursivve, safe, and verbose
alias mv='mv -iv'                           # Move safe and verbose
alias ln='ln -iv'                           # Link safe and verbose
alias rm='rm -iv'                           # Remove safe and verbose
# List directory contents
alias lsa='ls -lah --color'
alias l='ls -lah --color'
alias ll='ls -lh --color'
alias la='ls -lAh --color'
alias ls='ls -lAh --color'

alias -g c='clear'                          # c:            Clear terminal display
alias which='type -a'                       # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias shell='echo -e ${SHELL}'              # shell:        Echo current shell

alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
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
# ff: Find file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# ffs: Find file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# ffe: Find file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

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

# AWS profile selection
# `aws` aliases managed by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aws#plugin-commands
function awsenv() {
  if [[ "$1" == "config" ]]; then
    # awsenv config
    aws configure sso
  elif [[ "$1" == "login" ]]; then
    # awsenv login <profile>
    asp "$2" "$1"
  elif [[ "$1" == "refresh" ]]; then
    # awsenv refresh <profile>
    # Common Question https://stackoverflow.com/a/75632221
    # alias awsenv_refresh='eval "$(aws configure export-credentials --profile $1 --format env)"'
    aws configure export-credentials --profile "$2" --format env
  elif [[ "$1" == "logout" ]]; then
    # awsenv logout <profile>
    asp "$2" "$1"
  fi
}

# function azenv() {
#   if [[ "$1" == "config" ]]; then
#     # azenv config
#     az ad sp create-for-rbac \
#        --name "skol-digital-tofu-sandbox-sp-01" \
#        --role Contributor \
#        --scopes /subscriptions/$(az account show --query id --output tsv) \
#     | jq -r '
#       "ARM_CLIENT_ID=\(.appId)\n" +
#       "ARM_CLIENT_SECRET=\(.password)\n" +
#       "ARM_TENANT_ID=\(.tenant)\n" +
#       "ARM_SUBSCRIPTION_ID=\(.subscription)"
#       ' > ~/.azure/credentials
#   elif [[ "$1" == "login" ]]; then
#     # azenv login
#     az "$1"
#   elif [[ "$1" == "refresh" ]]; then
#     # azenv refresh <subscription>
#     # Common Question https://stackoverflow.com/a/75632221
#     # alias awsenv_refresh='eval "$(aws configure export-credentials --profile $1 --format env)"'
#     az config "$2" && \
#     source ~/.azure/credentials
#   elif [[ "$1" == "logout" ]]; then
#     # awsenv logout <profile>
#     az logout
#   fi
# }
