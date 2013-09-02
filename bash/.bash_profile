PATH=$HOME/dev/tools/mvn/bin:$PATH
PATH=$HOME/dev/tools/jruby/bin:$PATH
PATH=$PATH:$HOME/dev/tools/grails/bin
PATH=$PATH:$HOME/dev/tools/groovy/bin
PATH=$PATH:$HOME/dev/tools/play
PATH=$PATH:$HOME/dev/tools/oracle/client
PATH=$PATH:$HOME/dev/tools/bin
PATH=$PATH:$HOME/dev/tools/sbt/bin
PATH=$PATH:$HOME/dev/tools/opends/bin
PATH=$PATH:$HOME/dev/tools/mongodb/bin
PATH=$PATH:$HOME/dev/tools/gradle/bin
PATH=$PATH:$HOME/dev/tools/scala/bin
PATH=$PATH:$HOME/dev/tools/pmd/bin
PATH=$PATH:$HOME/dev/tools/maestro-cli/bin
PATH=$PATH:$HOME/dev/tools/android_sdk/tools
PATH=$PATH:$HOME/dev/tools/android_sdk/platform-tools
PATH=$PATH:$HOME/dev/appservers/ATG/home/bin
PATH=$PATH:/opt/subversion/bin
PATH=$PATH:/Applications/Utils/kdiff3.app/Contents/MacOS
PATH=$PATH:/usr/local/mysql/bin
PATH=/usr/local/git/bin:$PATH
PATH=$PATH:/Applications/Vagrant/bin

export PATH

export ATG_DIR=$HOME/dev/appservers/ATG
export ATG_HOME=$HOME/dev/appservers/ATG
export DYNAMO_HOME=$ATG_DIR/home
export JBOSS_HOME=$HOME/dev/appservers/jboss-eap-5.1/jboss-as

alias ll='ls -laG'
alias ctail='grc tail'
alias aq='aquamacs'
alias e='emacsclient -t'
alias ec='emacsclient -c'

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$HOME/dev/tools/oracle/client

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export USER=im
export SB_ENABLED=true

source $HOME/dev/tools/bin/git-completion.bash
source /opt/boxen/env.sh

#source $HOME/.grcat
#source "`brew --prefix`/etc/grc.bashrc"
