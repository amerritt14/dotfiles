
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"
. "$HOME/.cargo/env"
