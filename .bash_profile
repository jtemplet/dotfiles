#!/bin/bash

# -------------------------------------------------------------------------
# This is my .bashrc, a lot of the format and ideas were borrowed from
# http://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc.  Although, 
# I have heavily customized for my environment.
# -------------------------------------------------------------------------


# -------------------------------------------------------------------------
# SHELL VARIABLES
# -------------------------------------------------------------------------

: ${HOME=~}

# -------------------------------------------------------------------------
# SHELL SETUP
# -------------------------------------------------------------------------
# bring in system bashrc
test -r /etc/bashrc && . /etc/bashrc
      
# notify of bg job completion immediately
set -o notify

# default umask
umask 0022


# -------------------------------------------------------------------------
# PATH & MANPATH
# -------------------------------------------------------------------------

# usr/local/sbin
test -d "/usr/local/sbin" && PATH="$PATH:/usr/local/sbin"

# critical homebrew path
if test -n "$(command -v brew)" ; then
    PATH="/usr/local/bin:$PATH"
else
# critical macports paths
    test -d "/opt/local/bin" && PATH="/opt/local/bin:$PATH"
    test -d "/opt/local/sbin" && PATH="/opt/local/sbin:$PATH"
    test -d "/opt/local/share/man" && MANPATH="/opt/local/share/man:$MANPATH"
fi

# include our custom scripts
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"

# include our ruby gems
test -d "$HOME/.gem/ruby/1.8/bin" && PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

# include mysql executables for custom mysql installation
test -d "/usr/local/mysql/bin" && PATH="/usr/local/mysql/bin:$PATH"
test -d "/usr/local/mysql/share/man" && MANPATH="/usr/local/mysql/share/man:$MANPATH"

# include subversion client for custme svn installation
test -d "/opt/subversion/bin" && PATH="/opt/subversion/bin:$PATH"
test -d "/opt/subversion/man" && MANPATH="/opt/subversion/man:$MANPATH"

# include current directory
PATH=".:$PATH"


# -------------------------------------------------------------------------
# ENVIRONMENT
# -------------------------------------------------------------------------
echo "Setting up environment"
echo "Setting up virtual environment wrapper"
# virtualenv wrapper
if test -r "/usr/local/bin/virtualenvwrapper.sh" ; then
    test -d "$HOME/.virtualenvs" || mkdir "$HOME/.virtualenvs"
    export WORKON_HOME="$HOME/.virtualenvs"
    export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"
    echo "Going to source virtualenvwrapper.sh"
    . "/usr/local/bin/virtualenvwrapper.sh"
fi
echo "Setting up git helper functions"
# git helper functions
if test -r "$HOME/bin/git_bashrc" ; then
    . "$HOME/bin/git_bashrc"
fi
echo "Setting up Java"
# java & related services and utilities
if [ "$UNAME" = Darwin ]; then
    export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
fi

if test -n "$(command -v pylint)" && test -r "$HOME/.pylintrc"; then
    export PYLINTRC="$HOME/.pylintrc"
fi


# -------------------------------------------------------------------------
# PAGER & EDITOR
# -------------------------------------------------------------------------
# EDITOR
test -n "$(command -v vim)" && EDITOR=vim || EDITOR=vi
export EDITOR

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER

# -------------------------------------------------------------------------
# LS AND DIRCOLORS (from http://github.com/rtomayko/dotfiles/)
# -------------------------------------------------------------------------

# we always pass these to ls(1)
LS_COMMON="--color=auto -hB"
#LS_COMMON="-hBG"

# setup the main ls alias if we've established common args
test -n "$LS_COMMON" &&
    alias ls="command ls $LS_COMMON"
 
# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# -------------------------------------------------------------------------
# PROMPT HAWTNESS
# -------------------------------------------------------------------------

test -r "$HOME/bin/prompt_bashrc" && . $HOME/bin/prompt_bashrc


# -------------------------------------------------------------------------
# CUSTOM ALIASES FUNCTIONS
# -------------------------------------------------------------------------
# bring in aliases
test -r "$HOME/.bash_aliases" && . $HOME/.bash_aliases

# markdown
function md {
    now=`date +"%Y%m%d-%H%M%S"`

    perl $HOME/bin/Markdown.pl --html4tags $* > /tmp/$now.html
    cat $HOME/.markdown/head.html /tmp/$now.html $HOME/.markdown/foot.html

    rm /tmp/$now.html
}

# distribute ssh keys
# from http://github.com/rtomayko/dotfiles/.bashrc
push_ssh_cert(){
    local _host
    test -f ~/.ssh/id_dsa.pub || ssh-keygen -t dsa
    for _host in "$@";
    do
        echo $_host
        ssh $_host 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_dsa.pub
    done
}

# OSX specific functions
if [ "$LOGNAME" = jtempleton ] && [ "$TERM_PROGRAM" = Apple_Terminal ]; then
    
    # change the color of our ssh'd terminal
    test -r "$HOME/bin/SetTerminalStyle" && {
        function ssh {
            $HOME/bin/SetTerminalStyle ssh
            /usr/bin/ssh "$@"
            $HOME/bin/SetTerminalStyle default 
        }
    }

    # change the color of a mysql terminal
    test -r "$HOME/bin/SetTerminalStyle" && {
        function mysql {
            $HOME/bin/SetTerminalStyle Ocean
            /usr/local/bin/mysql "$@"
            $HOME/bin/SetTerminalStyle default
        }
    }
    
fi

#export PS1="\u-\W$ "
. ~/.git-completion.bash
#PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
PS1='[\u-\W$(__git_ps1 "(%s)")]$ '
export PATH="$PATH:/Library/PostgreSQL/9.0/bin"
#export PATH="$PATH:/Applications/Flash Player.app/Contents/MacOS"
 
# Env Vars
export MAVEN_OPTS="-Xmx1536M -XX:MaxPermSize=256M -Dsun.lang.ClassLoader.allowArraySyntax=true"
export M2_HOME=/usr/share/maven
export M2=$M2_HOME/bin

# -------------------------------------------------------------------------
# bring in other dev environments
# -------------------------------------------------------------------------
# django
test -r "$HOME/bin/django_bash_completion" && . $HOME/bin/django_bash_completion

# git
test -r "$HOME/bin/git-completion.bash" && . $HOME/bin/git-completion.bash


##
# Your previous /Users/jtempleton/.bash_profile file was backed up as /Users/jtempleton/.bash_profile.macports-saved_2011-07-14_at_15:56:01
##

# MacPorts Installer addition on 2011-07-14_at_15:56:01: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

