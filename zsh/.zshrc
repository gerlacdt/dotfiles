# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
DISABLE_AUTO_UPDATE="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# environment variables, used by CLI tools like git
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c"
export GIT_EDITOR="emacsclient -c"
export PAGER=less

# aliases
alias e='emacsclient -t'
alias ecc='emacsclient -c'
alias ew='emacs -nw -q'
alias edd='emacs --daemon'
alias ag='ag --path-to-ignore ~/.agignore'
alias k='kubectl'
alias kd='kubectl describe'
alias t='terraform'
alias gdl='git diff --no-index'
alias mux='tmuxinator'
alias npmlg='npm list -g --depth 0'

# nice looking shell, e.g. enable true color terminal support, set default language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# export TERM=xterm-256color
export COLORTERM=truecolor

# configure $PATH for all kind of tools
export GOPATH=$HOME/src/golang
export GOBIN=$GOPATH/bin
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export MVN_HOME=$HOME/.local/bin/maven
export GRADLE_HOME=$HOME/.local/bin/gradle

PATH=/usr/local/go/bin:$GOBIN:$MVN_HOME/bin:$GRADLE_HOME/bin:$HOME/.local/bin:$HOME/.config/emacs/bin:$HOME/.arkade/bin:$PATH

# auto-completions
source <(kubectl completion zsh)

# required for terraform completions
# see https://developer.hashicorp.com/terraform/cli/commands#shell-tab-completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/.local/bin/terraform terraform

# set default python environment
source $HOME/.virtualenv/data/bin/activate


# shows memory usage of a process
# USAGE: mem emacs # shows emacs memory consumption
mem()
{
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

# more stuff
source $HOME/.cargo/env
# source $HOME/.config/fzf/fzf-key-bindings.zsh # disabled CTRL-t, I like transpose char more
source $HOME/.config/skim/skim-key-bindings.zsh # disabled CTRL-t, I like transpose char more
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(~/.local/bin/mise activate zsh)"
