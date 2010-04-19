# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin
PATH=$PATH:~/bin
PATH=$PATH:~/.gem/ruby/1.8/bin
PATH=$PATH:~/src/rabbitmq-server-1.7.2/scripts
PATH=$PATH:~/src/scala-2.8.0.Beta1-prerelease/bin
PATH=$PATH:~/src/jruby-1.4.0/bin
PATH=$PATH:/opt/local/lib/postgresql84/bin


# erl_call
PATH=$PATH:/opt/local/lib/erlang/lib/erl_interface-3.6.4/bin

export PATH

# rvm

if [[ -s /Users/howard/.rvm/scripts/rvm ]] ; then source /Users/howard/.rvm/scripts/rvm ; fi

# bash_comletion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
  # source /etc/bash_completion
fi

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

alias apt='aptitude'
alias rk='rake'
alias utgz='tar -xzf'
alias utgz2='tar -xjf'

alias porti='sudo port install'
alias ports='port search'

alias geml='gem list --local'
alias gems='gem search -r'
alias gemi='gem install --no-ri --no-rdoc'
alias jgemi='jgem install --no-ri --no-rdoc'
alias gemdir="cd $(rvm gemdir)"

# rvm stuff
alias rb='rvm info'
alias gset='rvm gemset'
alias gsetu='rvm gemset use'


# some directory aliases

alias acc='cd ~/acc'

# set terminal emulator's tab
## magic.
tabis() {
 echo -ne "\033]0;"$@"\007"
}

reload() {
 source ~/.bashrc
}

