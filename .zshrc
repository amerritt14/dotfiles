# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# export PATH="$HOME/.rbenv/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/andrewmerritt/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="daveverwer"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler osx rake ruby rails gitfast zsh-autosuggestions docker docker-compose)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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
alias git_cut='g branch -vv | cut -c 3- | awk "\$3 !~/\[/ { print \$1 }" | xargs -n 1 git branch -D'
alias git_prune='g remote prune upstream && git br -vv | grep gone | awk "{print $1}" | xargs -n 1 git branch -D'
alias kill_dev='~/Documents/Scripts/kill_servers.sh'
alias matrix='~/Documents/Scripts/matrix.sh'
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
alias portal-down='(cd ~/Documents/RubyPrograms/n2publishing/dev-stack && docker-compose -f docker-compose.yml -f docker-compose.portal.yml down)'
alias portal-up='(cd ~/Documents/RubyPrograms/n2publishing/dev-stack && docker-compose -f docker-compose.yml -f docker-compose.portal.yml up -d)'
alias dev-stack-down='(cd ~/Documents/RubyPrograms/n2publishing/dev-stack && docker-compose -f docker-compose.yml -f docker-compose.portal.yml -f docker-compose.hub.yml down)'
alias dev-stack-up='(cd ~/Documents/RubyPrograms/n2publishing/dev-stack && docker-compose -f docker-compose.yml -f docker-compose.portal.yml -f docker-compose.hub.yml up -d)'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
# eval "$(rbenv init -)"

# Slack Theme from https://github.com/mykeels/slack-theme-cli
export PATH=$PATH:/Users/andrewmerritt/bin/slack-theme
export SLACK_THEME_SHELL_PROFILE="/Users/andrewmerritt/.zshrc"
alias config='/usr/bin/git --git-dir=/Users/andrewmerritt/.cfg/ --work-tree=/Users/andrewmerritt'
