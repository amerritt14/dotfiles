# Copied and modified from the oh-my-zsh theme from geoffgarside
# Red server name, green cwd, blue git status

PROMPT='%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %{$fg[red]%}%(!.#.⚡️)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"