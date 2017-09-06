fpath=(/usr/local/share/zsh-completions $fpath)

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
plugins=(ansible docker pod k go npm extract osx brew safe-paste zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

# Customize to your needs...
ulimit -n 8192
unsetopt inc_append_history
unsetopt share_history

# fuction
function chpwd() {
    emulate -L zsh
    #l
    pwd
}

function todo() {
    touch ~/Desktop/"$*"
}

function csindex() {
    find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.py" -o -name "*.lua" -o -name "*.go" > cscope.files
    cscope -bk
    ctags --fields=+iaSl -L cscope.files
    rm cscope.files
}

# zsh buildin
autoload -U zmv

# aliases
if [ -e "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# env
export https_proxy=http://127.0.0.1:1080;export http_proxy=http://127.0.0.1:1080
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
export EDITOR=/usr/local/bin/nvim
export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh
export TERM=xterm-256color
export ENHANCD_FILTER=fzf

export GOPATH="$HOME"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/openresty/bin:$PATH"

# Docker
#export DOCKER_CERT_PATH=/Users/fannheyward/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1

# OpenResty
export OPENRESTY_HOME=/usr/local/openresty
export MOOCHINE_HOME=$HOME/Documents/Server/moochine
export HADDIT_HOME=$HOME/Documents/Server/Haddit

export GIT_MERGE_AUTOEDIT=no

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function mkicns() {
    if [[ -z "$@" ]]; then
        echo "Input file missing"
    else
        filename=${1%.*}
        mkdir $filename.iconset
        sips -z 16 16   $1 --out $filename.iconset/icon_16x16.png
        sips -z 28 28   $1 --out $filename.iconset/icon_28x28.png
        sips -z 32 32   $1 --out $filename.iconset/icon_16x16@2x.png
        sips -z 32 32   $1 --out $filename.iconset/icon_32x32.png
        sips -z 64 64   $1 --out $filename.iconset/icon_32x32@2x.png
        sips -z 80 80   $1 --out $filename.iconset/icon_80x80.png
        sips -z 120 120 $1 --out $filename.iconset/icon_120x120.png
        sips -z 128 128 $1 --out $filename.iconset/icon_128x128.png
        sips -z 108 108 $1 --out $filename.iconset/icon_108x108.png
        sips -z 256 256 $1 --out $filename.iconset/icon_128x128@2x.png
        sips -z 256 256 $1 --out $filename.iconset/icon_256x256.png
        sips -z 512 512 $1 --out $filename.iconset/icon_256x256@2x.png
        sips -z 512 512 $1 --out $filename.iconset/icon_512x512.png
        cp $1 $filename.iconset/icon_512x512@2x.png
        iconutil -c icns $filename.iconset
        #rm -r $filename.iconset
    fi
}

# eval "$(direnv hook zsh)"

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
