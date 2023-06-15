#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER=$USER

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster-custom-wip"


# Reimplements OMZ's work_in_progress to customize the echo
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "[WIP!!] "
  fi
}

function get_node_version() {
  echo "node -v"
}

NEWLINE=$'\n'

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local git_branch='$(git_prompt_info)%{$reset_color%}'
local git_wip='%{$fg[red]%}$(work_in_progress)%{$reset_color%}'
local node_version='%{$fg[green]%}$(get_node_version)%{$reset_color%}'

#PROMPT="${ret_status} %{$fg[cyan]%}%c%{$reset_color%} ${git_branch}${git_wip}${NEWLINE}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

alias webstorm="open -na \"WebStorm.app\""

# Custom "tree" command
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Custom test script aliases for GrandVision project
alias t="yarn test"
alias tt="yarn test:watch"

function env-repos-run {
    # shellcheck disable=2010
    ls | grep env- | run "$*"
}

alias er="env-repos-run"

# Own aliases
alias x="xargs -I {}"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Hopefully improve speed when pasting into the shell 
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/.oh-my-zsh--custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  node
  npm
  github
  zsh-autosuggestions
  fasd
  history-substring-search
  zsh-syntax-highlighting
)

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

source ~/.profile
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yap="yarn add --peer"
alias yga="yarn global add"
alias gpum="git pull upstream master"
alias gfu="git fetch upstream"
alias gfo="git fetch origin"
alias zshconfig="vim ~/.zshrc"
alias gcu="git-crypt unlock"
alias gcl="git-crypt lock"
alias t="yarn test"
alias ntl="netlify"
alias w="yarn test --watch"
alias nv="nvim"
alias p="pnpm"

function omp() {
  opcos-run "gh pr list --state=merged -S $1 -L 1"
}
function oop() {
  opcos-run "gh pr list --state=open -S $1 -L 1"
}

function yw() {
  yarn workspace @grandvisionhq/$1 $2
}
function yww() {
  yarn workspace @grandvisionhq/$1 watch
}
function ywb() {
  yarn workspace @grandvisionhq/$1 build
}
function iw() {
  yarn workspace @iris-ui/$@
}


alias j="jazelle"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Other personal aliases
alias nr="npm run"
alias gcl="git-crypt lock"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdn="git diff --no-index"
alias gbn="git branch --show-current"

alias f1="f1viewer"

source ~/.dotfiles/.git-aliases.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##########################
### GrandVision aliases ##
##########################
# export GITHUB_TOKEN="$GPR_TOKEN"
source ~/_INCENTRO/opcos/utils.sh
source ~/_INCENTRO/opcos/yannicks_utils.sh



alias surf='echo "🏄 Running yarn serve"; yarn serve'
alias config='/usr/bin/git --git-dir=/Users/yannick/.cfg/ --work-tree=/Users/yannick'
