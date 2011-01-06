umask 022
#PS1='[\h]$ '
#export PS1="\e[32;1m\]\u\e[33;1m\]@\[\e[35;1m\]\h \[\e[01;34m\]\W \[\e[0m\]$ "
export PS1="\[\e[32;1m\]\u\[\e[33;1m\]@\w \[\e[35;1m\]\h \[\e[01;34m\] \[\e[0m\]$ "
#export PS1="\u@\W\$ "

#export LS_OPTIONS='--color=auto'
export LS_OPTIONS='-hG'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -lA'

alias ql='qlmanage -p 2>/dev/null'
alias -- .='pwd'
alias -- ..="cd .."
alias rm="rm -i"
alias find="find . -iname"
alias p="python"
alias vim="/usr/local/bin/vim"
alias vimdiff="/usr/local/bin/vimdiff"
set EDITOR="/usr/local/bin/vim"

export PYTHONSTARTUP=/Users/fannheyward/.pythonstartup

echo -n -e "\033]0;`hostname`\007"
