# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(pod heroku bundler osx brew pip npm gem redis-cli)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# fuction
function chpwd() {
    emulate -L zsh
    #l
    pwd
}

# aliases
if [ -e "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# env
export EDITOR=vim
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh
export PATH="/usr/local/sbin:$PATH"
export TERM=screen-256color

# OpenResty
export OPENRESTY_HOME=/usr/local/openresty
export MOOCHINE_HOME=$HOME/Documents/Server/moochine
export HADDIT_HOME=$HOME/Documents/Server/Haddit

export GIT_MERGE_AUTOEDIT=no

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
