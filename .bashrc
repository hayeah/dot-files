# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin
PATH=$PATH:~/bin
PATH=$PATH:~/.rvm/gems/jruby-1.5.1/bin
PATH=$PATH:~/.gem/ruby/1.8/bin
PATH=$PATH:~/src/rabbitmq-server-1.7.2/scripts
PATH=$PATH:~/src/scala-2.8.0.Beta1-prerelease/bin
PATH=$PATH:/opt/local/lib/postgresql84/bin
PATH=$PATH:~/local/bin
# ec2
export EC2_HOME=~/ec2
export EC2_PRIVATE_KEY=`ls ~/ec2/pk-*.pem`
export EC2_CERT=`ls ~/ec2/cert-*.pem`
PATH=$PATH:~/ec2/bin

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
\w
> '
export PS1


# some more ls aliases
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -CFh'

export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad

alias rk='rake'
alias utgz='tar -xzf'
alias utgz2='tar -xjf'

alias porti='sudo port install'
alias ports='port search'

alias geml='gem list --local'
alias gems='gem search -r'
alias gemi='gem install --no-ri --no-rdoc'

alias ec2='ssh -i ~/.ssh/ec2_id_rsa ubuntu@rere'
alias bess='ssh bess@69.164.222.28'

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
        case $cmd in
            fuss)
                git rebase -i HEAD~"$2";;
            *)
                git "$@";;
        esac
    fi
}

git-now() {
    git cma "`date`"
}
        

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
