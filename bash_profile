set EDITOR="/usr/local/bin/vim"

# aliases
if [ -e "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

umask 022
#PS1='[\h]$ '
#export PS1="\e[32;1m\]\u\e[33;1m\]@\[\e[35;1m\]\h \[\e[01;34m\]\W \[\e[0m\]$ "
export PS1="\[\e[32;1m\]\u\[\e[33;1m\]@\w \[\e[35;1m\]\h \[\e[01;34m\] \[\e[0m\]$ "
#export PS1="\u@\W\$ "

export PYTHONSTARTUP=/Users/fannheyward/.pythonstartup

echo -n -e "\033]0;`hostname`\007"
