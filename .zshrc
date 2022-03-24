# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/andrew.merritt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vscode git bundler macos rake ruby rails gitfast zsh-autosuggestions docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

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
alias add_dock_spacer="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"
alias b="bundle"
alias bwds="./bin/webpack-dev-server"
alias clean_branches="git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"
alias ctags="/usr/local/bin/ctags -R --exclude=public --exclude=tmp --exclude=.git --exclude=node_modules --exclude=vendor --exclude=dist"
alias dev='~/Documents/Scripts/run_servers.sh'
git_cut() { g branch -vv | cut -c 3- | awk "\$3 !~/\[/ { print \$1 }" | xargs -n 1 git branch -D; }
git_prune() { g remote prune upstream && git br -vv | grep gone | awk "{print $1}" | xargs -n 1 git branch -D; }
alias mysql="/usr/local/bin/mysql"
alias mysqladmin="/usr/local/bin/mysqladmin"
alias ohmyzsh="code ~/.oh-my-zsh"
alias show_mysql_db="mysql -u root -p$MYSQL_ROOT_PASSWORD -e 'show databases;'"
alias zshconfig="code ~/.zshrc"

# Docker Alias
alias da="docker attach"
alias daid="docker-compose ps -q app"
alias dcab="docker-compose exec app bash"
alias dcbundle="docker-compose exec app bundle"
alias dctb="docker-compose exec test bash"
alias dcyarn="docker-compose exec app yarn"
alias drbundle="docker-compose run app bundle"
alias drc="docker-compose exec app bin/rails c"
alias drrc="docker-compose run app bin/rails c"
alias drrt="docker-compose run app bin/rails test"
alias drst="docker-compose exec app bin/rails test:system"
alias drt="docker-compose exec app bin/rails test"
alias dryarn="docker-compose run app yarn"
alias dtid="docker-compose ps -q test"
alias gbrd="git branch | grep -v "master" | xargs git branch -D"
alias dev-stack-down='(cd /Users/andrew.merritt/Projects/dev-stack && docker-compose -f docker-compose.yml -f docker-compose.hub.yml down)'
alias dev-stack-up='(cd /Users/andrew.merritt/Projects/dev-stack && docker-compose -f docker-compose.yml -f docker-compose.hub.yml up -d)'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ddeploy-s='N2_DEPLOY_TOKEN=1337dce665bda66628741cfea2013a3fc407d4f8 ENVIRONMENT=staging bin/deploy'
alias ddeploy='N2_DEPLOY_TOKEN=1337dce665bda66628741cfea2013a3fc407d4f8 ENVIRONMENT=production bin/deploy'

# Tmux Alias
alias tmuxn="tmux new -s"
alias tmuxa="tmux attach -t"

# Scripts
. ~/Documents/Scripts/z.sh

# Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Misc
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
    'local-directories named-directories'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ENV Variables
export BUNDLE_GEM__FURY__IO="CAQh9VBraVZ6FwSMtQVa"

# Ligature support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
