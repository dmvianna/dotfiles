# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dmvianna/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zsh-users/zsh-completions \
    zsh-users/zsh-history-substring-search

### End of Zinit's installer chunk

### starship
export STARSHIP_CONFIG=~/.config/dotfiles/starship.toml
zinit ice as"command" from"gh-r" \
      atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
      atpull"%atclone" src"init.zsh"
zinit light starship/starship

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pipx
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# autocompletion
# zinit light marlonrichert/zsh-autocomplete
zinit snippet /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## z
zinit snippet /usr/libexec/z.sh

## highlight syntax (must be last thing in zshrc)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
