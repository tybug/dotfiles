######################
## Customize Colors ##
######################

export PS1="\[\e[00;96m\] \w \[\e[0m\]\[\e[00;92m\]λ \[\e[0m\]"
#export PS1="________________________________________________________________________________\n| \[\033[36m\]\u:\[\033[33;1m\]\w\[\033[m\] => "
export PS2="| => "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx



#####################
## Eternal History ##
#####################

# from https://stackoverflow.com/a/19533853/12164878
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] " # only matters for the ``history`` command, doesn't actually change the ~/.bash_history file format which is always unix time
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"



########################
## Path Modifications ##
########################

# scripts in .local/bin
export PATH=/Users/tybug/.local/bin:$PATH
# python 3.7
export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH
# python 3.9
export PATH=/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH
# racket + racket tools
export PATH=/Applications/Racket\ v7.8/bin:$PATH
# prolog + prolog tools
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH
# ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
# coq
export PATH=/Applications/Coq.app/Contents/Resources/bin:$PATH



###########################
## Environment Variables ##
###########################

# see https://stackoverflow.com/a/17886334/12164878 and https://stackoverflow.com/a/1348940/12164878.
# Change if you want to use java 11 instead of 8
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home"
# remove annoying "please change to zsh" warning (I should probably switch to zsh at some point,
# but a task for another day)
export BASH_SILENCE_DEPRECATION_WARNING=1



#############
## Aliases ##
#############

# I store all my aliases in a separate file, so add them now
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# sensitive / private aliases go in a separate file; I publicize everything else
if [ -f ~/.bash_aliases_private ]; then
  source ~/.bash_aliases_private
fi

# use our current shell for this script so we can immediately add our new alias to our shell when we call this
# https://stackoverflow.com/a/44122806
# alias alias='. alias-permanent'



##########
## Misc ##
##########

# start at desktop, not the home directory. This is where I want to be most of the time
# https://superuser.com/a/193516
if [[ $PWD/ = $HOME/ ]]; then
	cd Desktop/
fi

# set up thefuck https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"

# https://apple.stackexchange.com/a/55886
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi