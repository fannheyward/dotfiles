umask 022
#PS1='[\h]$ '
#export PS1="\e[32;1m\]\u\e[33;1m\]@\[\e[35;1m\]\h \[\e[01;34m\]\W \[\e[0m\]$ "
export PS1="\[\e[32;1m\]\u\[\e[33;1m\]@\w \[\e[35;1m\]\h \[\e[01;34m\] \[\e[0m\]$ "
#export PS1="\u@\W\$ "

#export LS_OPTIONS='--color=auto'
export LS_OPTIONS='-hG'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -lA'

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH
export PATH="/Applications/XAMPP/xamppfiles/bin/:${PATH}"
#export PATH="/usr/local/mysql-5.1.49-osx10.6-x86/bin/:${PATH}"
export PATH="/usr/local/lib/:${PATH}"
export PATH="/usr/local/google_appengine/:${PATH}"
export PATH="/usr/local/google_appengine/google/appengine/ext/webapp/:${PATH}"

#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
export PYTHONSTARTUP=/Users/appwill1/.pythonstartup
alias ql='qlmanage -p 2>/dev/null'
alias -- .='pwd'
alias -- ..="cd .."
alias rm="rm -i"
alias find="find . -iname"
alias p="python"
alias vim="/usr/local/bin/vim"
set EDITOR="/usr/local/bin/vim"

echo -n -e "\033]0;`hostname`\007"

##
# Your previous /Users/appwill1/.bash_profile file was backed up as /Users/appwill1/.bash_profile.macports-saved_2010-09-06_at_10:45:07
##

# MacPorts Installer addition on 2010-09-06_at_10:45:07: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

