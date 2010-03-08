# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PATH=$PATH:~/bin
PATH=$PATH:~/.gem/ruby/1.8/bin
PATH=$PATH:/home/howard/src/rabbitmq-server-1.7.2/scripts
PATH=$PATH:/home/howard/src/scala-2.8.0.Beta1-prerelease/bin
PATH=$PATH:/home/howard/src/jruby-1.4.0/bin

# erl_call
PATH=$PATH:/usr/local/lib/erlang/lib/erl_interface-3.6.1/bin

source /etc/bash_completion

PS1='
\w
> '
export PS1

# some more ls aliases
alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -CFh'
alias apt='aptitude'
alias rk='rake'
alias utgz='tar -xzf'
alias utgz2='tar -xjf'

alias gemi='gem install --no-ri --no-rdoc'
alias jgemi='jgem install --no-ri --no-rdoc'

if [[ `uname` == "Linux" ]] ; then
	  eval `dircolors -b $HOME/.ls_colors`
	  alias ls='ls --color=auto'
    xset b off # turn pc beeper off.
fi

reload()
{
 source ~/.bashrc
}