# loaded when using the shell interactively
# load bashrc from this file
# tools like Capistrano won't load .bash_profile; but will load .bashrc
# source
DOTFILES_PATH="$(dirname "${BASH_SOURCE}")"
source "$DOTFILES_PATH/bashrc"
source "$DOTFILES_PATH/bash/aliases"
source "$DOTFILES_PATH/bash/prompt"
