# dotfiles

My personal machine configuration for macOS.

## Contents

| Path | Description |
|---|---|
| `.zshrc`, `.zshenv`, `.zprofile`, `.zlogin`, `.p10k.zsh` | Zsh + Oh My Zsh + Powerlevel10k |
| `.bash_profile`, `.bashrc` | Bash |
| `.gitconfig`, `.gitignore_global` | Git |
| `.tmux.conf` | Tmux |
| `.tool-versions` | asdf runtime versions |
| `ssh/config` | SSH host aliases (no keys) |
| `kitty/` | Kitty terminal + Catppuccin Macchiato theme |
| `vscode/` | VSCode settings and keybindings |
| `claude/` | Claude Code permissions, hooks, and plugins |

## Installation

```sh
git clone https://github.com/amerritt14/dotfiles.git ~/Projects/dotfiles
~/Projects/dotfiles/install.sh
```

`install.sh` creates symlinks from `$HOME` (and other config dirs) to each file in this repo. Existing files are backed up with a `.bak` extension before being replaced.

## Secrets

Sensitive tokens are stored in the **macOS Keychain** and loaded at shell startup — no plaintext values are committed to this repo. On a new machine, add them with:

```sh
# Tiptap pro npm registry token (tiptap.dev account → registry access)
security add-generic-password -s NPM_TIPTAP_REGISTRY_TOKEN -a $USER -w <value>

# Password for the dad-joke server
security add-generic-password -s DAD_JOKE_P -a $USER -w <value>

# GitHub PAT for GitHub Container Registry (ghcr.io) access
security add-generic-password -s CONTAINER_REGISTRY_PAT -a $USER -w <value>
```

## New Machine Setup Notes

- **Claude hooks**: paths in `claude/settings.json` are hardcoded to `~/`. Update if your username differs. Install the mempalace and ruby-lsp plugins before hooks will work.
- **SSH keys**: not tracked here — copy them manually to `~/.ssh/`.
- **Oh My Zsh**: install separately from [ohmyz.sh](https://ohmyz.sh).
- **Homebrew**: install separately from [brew.sh](https://brew.sh), then install packages as needed.
