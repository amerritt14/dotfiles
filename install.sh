#!/usr/bin/env zsh
# Creates symlinks from $HOME to each dotfile in this repo.
# Run from anywhere: ~/Projects/dotfiles/install.sh

set -e

DOTFILES="$( cd "$( dirname "$0" )" && pwd )"

link() {
  local src="$1" dst="$2"
  if [[ -L "$dst" ]]; then
    echo "  skip  $dst (already symlinked)"
  elif [[ -e "$dst" ]]; then
    echo "backup $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
    ln -s "$src" "$dst"
  else
    ln -s "$src" "$dst"
    echo "linked $dst"
  fi
}

# Shell
link "$DOTFILES/.zshrc"           "$HOME/.zshrc"
link "$DOTFILES/.zshenv"          "$HOME/.zshenv"
link "$DOTFILES/.zprofile"        "$HOME/.zprofile"
link "$DOTFILES/.zlogin"          "$HOME/.zlogin"
link "$DOTFILES/.p10k.zsh"        "$HOME/.p10k.zsh"
link "$DOTFILES/.bash_profile"    "$HOME/.bash_profile"
link "$DOTFILES/.bashrc"          "$HOME/.bashrc"

# Git
link "$DOTFILES/.gitconfig"       "$HOME/.gitconfig"
link "$DOTFILES/.gitignore_global" "$HOME/.gitignore_global"

# Tmux
link "$DOTFILES/.tmux.conf"       "$HOME/.tmux.conf"

# Tool versions
link "$DOTFILES/.tool-versions"   "$HOME/.tool-versions"

# SSH config (keys stay on machine, only config is tracked)
mkdir -p "$HOME/.ssh"
link "$DOTFILES/ssh/config"       "$HOME/.ssh/config"

# Kitty
mkdir -p "$HOME/.config/kitty"
link "$DOTFILES/kitty/kitty.conf"               "$HOME/.config/kitty/kitty.conf"
link "$DOTFILES/kitty/current-theme.conf"       "$HOME/.config/kitty/current-theme.conf"
link "$DOTFILES/kitty/catppuccin-macchiato.conf" "$HOME/.config/kitty/catppuccin-macchiato.conf"

echo "\nDone. Open a new shell or run: source ~/.zshrc"

# Remind about Keychain secrets on a new machine
echo "\nOn a new machine, add secrets to Keychain:"
echo "  security add-generic-password -s NPM_TIPTAP_REGISTRY_TOKEN -a \$USER -w <value>"
echo "  security add-generic-password -s DAD_JOKE_P               -a \$USER -w <value>"
echo "  security add-generic-password -s CONTAINER_REGISTRY_PAT   -a \$USER -w <value>"
