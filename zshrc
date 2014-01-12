# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bower pod go vagrant rbenv npm gem redis-cli pip extract osx brew safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# fuction
function chpwd() {
    emulate -L zsh
    #l
    pwd
}

function todo() {
    touch ~/Desktop/"$*"
}

# aliases
if [ -e "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# env
export PATH="/usr/local/bin:$PATH"
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export TERM=xterm-256color
eval "$(rbenv init -)"

export GOPATH="$HOME/Documents/Golang"

# OpenResty
export OPENRESTY_HOME=/usr/local/openresty
export MOOCHINE_HOME=$HOME/Documents/Server/moochine
export HADDIT_HOME=$HOME/Documents/Server/Haddit

export GIT_MERGE_AUTOEDIT=no

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#alias for cnpm
alias cnpm="npm --registry=http://registry.cnpmjs.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=http://dist.u.qiniudn.com \
  --userconfig=$HOME/.cnpmrc"

