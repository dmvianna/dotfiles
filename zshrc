# ~/.zshrc

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
