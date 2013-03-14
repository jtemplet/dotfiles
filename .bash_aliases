# --------------------------------------------------------------------------
# general aliases
# --------------------------------------------------------------------------
alias aliases='vi ~/.aliases && source ~/.aliases'
alias bashrc='vi ~/.bashrc && source ~/.bashrc'
alias ipython='ipython -automagic -nobanner'
#alias ls='ls $LS_OPTIONS -hF'
alias lsd="ls -F | egrep '/$'"
alias l.="ls -d .*"
alias ll='ls $LS_OPTIONS -lhF'
#alias l='ls $LS_OPTIONS -lAhF'
alias ll.="ls -ld .*"
alias mkdir='mkdir -p'
alias rmpyc='find ./ -name "*.pyc" | xargs rm'
alias vi='vim'
alias whatismyip='echo `curl -s http://whatismyip.org/`'

alias c="clear"
alias ls="ls -F"
alias d="ls -laF"
alias h="history"
alias diffmerge="~/scripts/diffmerge.sh"
alias music="cd ~/Music/iTunes/iTunes\ Media/Music/"
alias lb="~/scripts/list_git_branches_in_order"
alias gomaster="core; git co master; basisd; git co master; basis; git co master; styx; git co master; plat; git co master; styx"

# --------------------------------------------------------------------------
# AMAZON S3 and EC2
# --------------------------------------------------------------------------
test -r "$HOME/amazon/s3/s3sync/s3sync.rb" && 
     alias s3='$HOME/amazon/s3/s3sync/s3cmd.rb'

alias show_sqs_int="aws gqa /308957848663/async_queue_int --attribute All"
alias show_sqs_qa="aws gqa /308957848663/async_queue_qa --attribute All"

# --------------------------------------------------------------------------
# GIT
# --------------------------------------------------------------------------
alias ga='git add'
alias gb='git branch -a -v'
alias gco='git checkout'
alias gci='git commit'
alias gd='git diff'
alias gl='git l'
alias glo='git log'
alias gm='git merge'
alias gp='git pull'
alias gpp='git pull --rebase && git push'
alias gs='git status'
#alias gbh='git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format=\'%(refname)\' | cut -d / -f 3-'



# --------------------------------------------------------------------------
# DJANGO ALIASES
# --------------------------------------------------------------------------
alias djm='manage.py'
alias djr='manage.py runserver'
alias djs='manage.py shell'
alias djt='manage.py test'

# --------------------------------------------------------------------------
# OSX
# --------------------------------------------------------------------------
if [ "$LOGNAME" = jtempleton ]; then
    
    # JAVA
    alias intellij='/Applications/IntelliJ\ IDEA\ 10.app/Contents/MacOS/idea'
    
    # TERMINAL COLORS
    alias blue='SetTerminalStyle Ocean'
    alias black='SetTerminalStyle black'
    alias default='SetTerminalStyle Default'
    alias djangoterm='SetTerminalStyle Django'
    alias green='SetTerminalStyle green'
    alias red='SetTerminalStyle Red\ Sands'
    alias white='SetTerminalStyle Basic'

    # RANDOM TERMINAL COLOR
    alias newcolor='osascript ~/bin/RandomColorTerminal.scpt'
    
    # UTILITIES
    alias bringalltofront='osascript $HOME/bin/bring-all-to-front'
    alias tm='/Applications/TextMate.app/Contents/MacOS/TextMate'

    alias jdev="cd ~/Dev/AMx_workspace/"
    alias dev="cd ~/Dev"
    alias rdev="cd ~/Dev/rails_projects"

    # Ace Metrix
    alias mis='mvn clean install -DskipTests=true -DcoberturaThreshold=0'
    alias mci='mvn clean install'
    alias mois='mvn -o clean install -DskipTests=true -DcoberturaThreshold=0'
    alias run_cas="cd ~/Dev/AMx_workspace/cas/server; mvn -o jetty:run"
    alias cas="cd /Users/jtempleton/Dev/AMx_workspace/cas/server"
    alias run_main="dev; cd analysis/java/analysis-webapp; mvn jetty:run-exploded -DskipTests=true -DcoberturaThreshold=0"
    alias run_styx="dev; cd styx/java/styx-webapp; mvn jetty:run"
    alias styx="cd ~/Dev/AMx_workspace/styx"
    alias basis="cd ~/Dev/AMx_workspace/basis"
    alias basisd="cd ~/Dev/AMx_workspace/basis-dal"
    alias plat="cd ~/Dev/AMx_workspace/analysis"
    alias survey="cd ~/Dev/AMx_workspace/survey/java"
    alias tools="cd ~/Dev/AMx_workspace/ace-tools"
    alias core="cd ~/Dev/AMx_workspace/core_util"
    alias ds="cd ~/Dev/AMx_workspace/dataservices"
fi

# ---------
#  Linux 
# ---------
if [ "$LOGNAME" = jtemplet ]; then

  alias web="cd /var/www"
  alias cgi="cd /usr/lib/cgi-bin"
  alias dev="cd ~/Development/rcp_workspace/"
  alias hinty="cd ~/Development/hinty_workspace/hinty/"
  alias weberrors="tail /var/log/apache2/error.log"
  alias restart_apache="sudo /etc/init.d/apache2 restart"

  alias weberrors="tail /var/log/apache2/error.log"
  alias restart_apache="sudo /etc/init.d/apache2 restart"
  alias ssh-hinty-stage="ssh -l root 184.106.147.27"
  alias rcp_dev="cd ~/Development/rcp_workspace/"
  alias android="cd ~/Development/android_workspace/"
  alias dev="cd ~/Development"
  alias words="cd ~/Development/wordsearch_game"
  alias tauri="cd ~/Development/rails_workspace/tauri/"
  alias laundry="cd ~/Development/rails_workspace/laundromat_service/"
  alias music="cd ~/Media/Music"
  alias clj='clj-env-dir'
fi

# --------------------------------------------------------------------------
# Development Utilities
# --------------------------------------------------------------------------
alias jsontool='python -m json.tool'
alias xmltool='python $HOME/bin/xmltool.py'

