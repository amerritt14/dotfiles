# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/andrewmerritt/.oh-my-zsh
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  ZSH_THEME="agnoster"
fi
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW

    # POWERLEVEL10K or Other Unsupported Custom Prompt Code

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  # Set name of the theme to load --- if set to "random", it will
  # load a random theme each time oh-my-zsh is loaded, in which case,
  # to know which specific one was loaded, run: echo $RANDOM_THEME
  # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
  ZSH_THEME="powerlevel10k/powerlevel10k"

##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

bindkey -e
bindkey '^[b' backward-word
bindkey '^[f' forward-word

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

export UNBUNDLED_COMMANDS=(ruby rubocop)
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

# EXPORT ENV VARS
export DISABLE_SPRING=true
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Compilation flags
export ARCHFLAGS="-arch ARM64"

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
alias clean_branches="git branch -vv | grep 'origin/.*: gone]' | awk '{$1=$1; print $1}' | xargs -r -I {} git branch -d '{}'"
alias delete_local_merged_branches="git branch --merged | grep -v '^\*\\|main' | xargs -n 1 git branch -d"
alias delete_remote_merged_branches="git branch -r --merged | grep -v '^\*\\|main' | xargs -n 1 git branch -d -r"
alias ctags="/usr/local/bin/ctags -R --exclude=public --exclude=tmp --exclude=.git --exclude=node_modules --exclude=vendor --exclude=dist"
alias dev='~/Documents/Scripts/run_servers.sh'
alias mysql="/usr/local/bin/mysql"
alias mysqladmin="/usr/local/bin/mysqladmin"
alias ohmyzsh="code ~/.oh-my-zsh"
alias show_mysql_db="mysql -u root -p$MYSQL_ROOT_PASSWORD -e 'show databases;'"
alias zshconfig="code ~/.zshrc"
alias dr="doppler run --"
alias drbr="doppler run -- bin/rails"
alias drspec="doppler run -- bundle exec rspec"

alias gbrd="git branch | grep -v "main" | xargs git branch -D"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gprune='prune_merged_branches'
alias clean_git_blame='git fetch --unshallow'

alias prod_swarm='cd /Users/andrewmerritt/Projects/Rails/Beehiiv/swarm; heroku run bash --app beehiiv-swarm  --size Performance-L --env="SWARM_STATEMENT_TIMEOUT=300000;SWARM_FOLLOWER_STATEMENT_TIMEOUT=3000000;HONEYCOMB_STATEMENT_TIMEOUT=3000000"'
alias prod_swarm_db='psql $(heroku config:get DATABASE_URL -a beehiiv-swarm)'
alias h8='pnpm'

# Tmux Alias
alias tmuxn="tmux new -s"
alias tmuxa="tmux attach -t"

# Scripts
. ~/Documents/Scripts/z.sh

# Export navigation shortcuts
export CDPATH=.:~:~/Documents:~/Projects/Rails/Beehiiv:~/Projects/Rails/N2

# Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Misc
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
    'local-directories named-directories'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Ligature support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Postgres
export PGDATA='/opt/homebrew/var/postgres'
export PGHOST=localhost
alias pg-info='brew services info postgresql'
alias pg-start='brew services start postgresql'
alias pg-stop='brew services stop postgresql'
alias pg-restart='brew services restart postgresql'

# ASDF
. "$HOME/.asdf/asdf.sh"
## append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
## initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Secrets — loaded from macOS Keychain (never stored in plain text)
export NPM_TIPTAP_REGISTRY_TOKEN=$(security find-generic-password -s "NPM_TIPTAP_REGISTRY_TOKEN" -a "$USER" -w 2>/dev/null)
export DAD_JOKE_P=$(security find-generic-password -s "DAD_JOKE_P" -a "$USER" -w 2>/dev/null)
export CONTAINER_REGISTRY_PAT=$(security find-generic-password -s "CONTAINER_REGISTRY_PAT" -a "$USER" -w 2>/dev/null)

# For compilers to find llvm@14 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/llvm@14/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm@14/include"

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
# export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"
eval "$(gh copilot alias -- zsh)"

source ~/Documents/Scripts/prune-branches.zsh

[[ "$TERM_PROGRAM" == "vscode" ]] && . "/Applications/Visual Studio Code.app/Contents/Resources/app/out/vs/workbench/contrib/terminal/common/scripts/shellIntegration-rc.zsh"

# Created by `pipx` on 2026-04-23 10:40:05
export PATH="$PATH:/Users/andrewmerritt/.local/bin"
