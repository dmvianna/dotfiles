eval "$(direnv hook zsh)"
eval "$(ssh-agent -s)"

# pyenv
export PATH="$HOME/.local/bin:$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

DIRENV_ALLOW_NIX=1

if [ -e /home/dmvianna/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dmvianna/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -f /home/dmvianna/.secret_env ]; then source ~/.secret_env; fi

# pipx
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"
