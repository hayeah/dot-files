# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin
PATH=$PATH:~/bin
PATH=$PATH:~/.rvm/gems/jruby-1.5.1/bin
PATH=$PATH:~/.gem/ruby/1.8/bin
PATH=$PATH:~/src/rabbitmq-server-1.7.2/scripts
PATH=$PATH:/opt/local/lib/postgresql84/bin
PATH=$PATH:~/local/bin
# android
PATH=$PATH:~/java/android-sdk/tools:~/java/android-sdk/platform-tools

# ec2
export EC2_HOME=~/ec2
export EC2_PRIVATE_KEY=`ls ~/ec2/pk-*.pem`
export EC2_CERT=`ls ~/ec2/cert-*.pem`
PATH=$PATH:~/ec2/bin

# scala
# PATH=$PATH:~/src/scala-2.8.0.Beta1-prerelease/bin
SCALA_HOME=/usr/local/Cellar/scala/2.8.1/

#node.js
PATH=$PATH:/usr/local/lib/node/.npm/expresso/0.6.1/package/bin/

# erl_call
PATH=$PATH:/opt/local/lib/erlang/lib/erl_interface-3.6.4/bin

export PATH

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# load rvm
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# bash_comletion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
  # source /etc/bash_completion
fi

HISTIGNORE="&:[ ]*:exit"

# prompt
PS1='
# \w
'
export PS1


# some more ls aliases
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -CFh'

export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad

alias porti='sudo port install'
alias ports='port search'

alias geml='gem list --local'
alias gems='gem search -r'
alias gemi='gem install --no-ri --no-rdoc'

c(){
  cd ~/"$1"
}

rmt() {
  rm $@ && touch $@
}

gemd() {
  if [[ ! -z "$1" ]] ; then
      gemfile=$(gem which $1)
      if [[ ! -z "$gemfile" ]] ; then
          pushd `pwd`
          cd $(dirname $gemfile)
      fi
  else
      echo 'which gemdir you want to go?'
  fi
}

# some directory aliases
alias acc='cd ~/acc'
alias edit='/Applications/Emacs.app/Contents/MacOS/Emacs &'

# rvm stuff
r() {
    if [[ $# == '0' ]]; then
        rvm info
    else
        rvm $@
    fi
}

unset -f gemset
gemset() {
  if [[ $# == 1 ]] ; then
      rvm 'gemset' use $1
  else
      echo "current: $(rvm gemset name)"
      rvm 'gemset' list
  fi
}

g() {
    if [[ $# == '0' ]]; then
        git status
    else
        case $1 in
            fuss)
                shift
                git rebase -i HEAD~"$1";;
            now)
                shift
                git cma "`date`";;
            *)
                git "$@";;
        esac
    fi
}


# rvm use 1.8.7-p330 --default
alias bess='gemset besspot; cd ~/bess'
alias quikpiq='gemset quikpiq; cd ~/quikpiq'
alias rubish='gemset rubish; cd ~/rubish'
alias contly='gemset contly; cd ~/contly'
alias pvd='rvm use ruby-1.9.2-p136; gemset pvd; cd ~/pvd'

alias snake='gemset snake; cd ~/snake'
alias fork2='gemset fork2; cd ~/fork2'
alias fork2w='fork2; cd web'
alias bandoru='gemset bandoru; cd ~/bandoru'
alias bandoruw='bandoru; cd web'

alias photoshare='cd ~/PhotoShare; rvm use 1.8.7; rvm gemset use global'
alias faceoff='cd ~/FaceOff; rvm gemset use global'
alias comalisp='cd ~/comalisp; rvm use ruby-1.9.2-p136; rvm gemset use global'
alias cupidu='cd ~/CupidYou; rvm use 1.8.7; rvm gemset use global'

alias SpreadThisLink='cd ~/SpreadThisLink; rvm use ruby-1.9.3-rc1; rvm gemset use global'
alias linkcastr='cd ~/linkcastr; rvm use ruby-1.9.3-rc1; rvm gemset use global'

alias blog='cd ~/blog; rvm use ruby-1.8.7-p334; rvm gemset use global'

# alias be='bundle exec'

# to init a project, create the gemset
init_project() {
 PROJECT=$1
 rvm gemset create $PROJECT
 mkdir ~/$PROJECT
}

with_project() {
 PROJECT=$1
 # gemset $PROJECT
 gemset global
 cd ~/$PROJECT
}

j() {
 javac $1.java && java $1
}

alias scalai='rlwrap scala -Xnojline'

alias reremind='with_project reremind'
alias jummpp='with_project jummpp'

# mac
flushdns() {
 dscacheutil -flushcache
}

# set terminal emulator's tab
## magic.
tabis() {
 echo -ne "\033]0;"$@"\007"
}

reload() {
 source ~/.bashrc
}
export PATH=$HOME/local/bin:$PATH
