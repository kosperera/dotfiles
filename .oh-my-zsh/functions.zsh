# Always list directory contents upon 'cd'
cd () { builtin cd "$@"; lsa; }

# mcd: Makes new Dir and jumps inside
mcd () { md "$1"; cd "$1"; }

# See https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/directories.zsh
# rd () { command rm -rf "$1"; ls -lAh; }

# trash: Moves a file to the MacOS trash        
trash () { command mv "$@" ~/.Trash ; }

# ql: Opens any file in MacOS Quicklook Preview
ql () { qlmanage -p "$*" >& /dev/null; }    

# zipf: To create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }          

# extract: Extract most know archives with one command
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

# Tierd of typing docker compose?
# doc() {
#     if [ -n $1 ] ; then
#       case $1 in
#         ll | list)

#           echo -e "\nList of all the containers"
#           docker ps --all --size
          
#           echo -e "\nList of all the images"
#           docker images --all
#           ;;

#         up)           docker compose ${@:2} up --build -d --quiet-pull ;;
#         stop | st)    docker compose ${@:2} stop ;;
#         restart | rs) docker compose ${@:2} restart ;;
#         down | d)     docker compose ${@:2} down --rmi "all" -v --remove-orphans ;;
#         clean | c)    # remove all exited containers and dangling images.

#           local containers=$(docker ps --all -q -f status=exited)
#           [ ! -z $containers ] && docker rm $containers || echo "No exited containers found."
          
#           local images=$(docker images -q -f dangling=true)
#           [ ! -z $images ] && docker rmi $images || echo "No dangling images found."
#           ;;

#         purge)        docker system prune -a -f --volumes ;;
#         sql)          sql ${@:2} ;;
#         help | h)
#           echo -e ""
#           echo -e "Tierd of typing `docker compose`?"
#           echo -e ""
#           echo -e "doc h  | help     : List all dc commands and aliases"
#           echo -e "doc ll | list     : List all containers and images"
#           echo -e "doc up            : Spin up a container, optionally pass config file path"
#           echo -e "doc rs | restart  : Restart a running or hanging server, optionally pass config file path"
#           echo -e "doc st | stop     : Stop a running container, optionally pass config file path"
#           echo -e "doc d  | down     : Shutdown a running or hanging container, then remove all images and orphans, optionally pass config file path"
#           echo -e "doc c  | clean    : Remove all existed containers and dangling images"
#           echo -e "doc purge         : Remove everything, including volumes"
#           echo -e "doc sql           : Spin up a sql server in a container"
#           echo -e "doc *             : Short hand for 'docker compose'"
#           echo -e ""
#           ;;

#         *)            docker compose $* ;;
#       esac
#     else
#       echo "doc '$1' is not a valid command"
#     fi
# }

# Dead simple sql server running on docker
# compose file is .sql-server
sql() {
    if [ -n $1 ] ; then
      case $1 in
        up )          podc -f $DOTFILES_DIR/.sqlsvr.yml up --build -d --quiet-pull ;;
        stop | st)    podc -f ~/.dotfiles/.sqlsvr.yml stop ;;
        restart | rs) podc -f ~/.dotfiles/.sqlsvr.yml restart ;;
        down | d)     podc -f ~/.dotfiles/.sqlsvr.yml down --rmi "all" -v --remove-orphans ;;
        help | h)
          echo -e ""
          echo -e "Dead simple sql server running on docker"
          echo -e "The docker compose file is .sqlsvr.yml"
          echo -e ""
          echo -e "sql h  | help      : List all sql commands and aliases"
          echo -e "sql up             : Spin up a sql server in a container"
          echo -e "sql rs | restart   : Restart sql server"
          echo -e "sql st | stop      : Stop a running sql server"
          echo -e "sql d  | down      : Shutdown sql server, then remove sql images and orphans"
          echo -e ""
          ;;

        *)  echo "sql '$1' cannot be executed via sql() command"   ;;
      esac
    else
      echo "sql '$1' is not a valid command"
    fi
}
