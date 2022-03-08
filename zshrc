# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gh bgnotify z macos)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
ulimit -n 8192

function zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf --height 40%)"
}

# env
# export https_proxy=http://127.0.0.1:1080;export http_proxy=http://127.0.0.1:1080
export HOMEBREW_BOOTSNAP=1;
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/bottles
export HOMEBREW_PREFIX="/opt/homebrew"
# export HOMEBREW_PREFIX="/usr/local"

export CARGO_HTTP_MULTIPLEXING=false
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PUB_HOSTED_URL=https://pub.flutter-io.cn

export EDITOR=nvim
export KEYTIMEOUT=1
export GIT_MERGE_AUTOEDIT=no

export CDPATH=$HOME/src
export NEXTWORD_DATA_PATH=$HOME/nextword-data
export MOCWORD_DATA=$HOME/mocword.sqlite
export JAVA_HOME=$HOME/bin/OpenJDK/Contents/Home

export GO111MODULE=on
export GOPATH="$HOME"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.yarn/bin"
export GEM_HOME="$HOME/.gem"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/bin/nvim-osx64/bin"
export PATH="$PATH:$HOME/bin/AdGuardHome"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="${HOMEBREW_PREFIX}/opt/curl/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :100 {}'"

if [ -r "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [ -r "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [ -r "$HOME/.zsh-autopair/autopair.zsh" ]; then
    source "$HOME/.zsh-autopair/autopair.zsh"
    autopair-init
fi
if [ -r "${HOMEBREW_PREFIX}/share/zsh/site-functions" ]; then
    fpath=("${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath)
    compinit
fi

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

function setup_gcloud() {
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

    # The next line enables shell command completion for gcloud.
    if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
}

function miniforge() {
    __conda_setup="$($HOME'/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniforge3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniforge3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

