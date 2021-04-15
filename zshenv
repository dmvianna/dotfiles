eval "$(direnv hook zsh)"
eval "$(ssh-agent -s)"

# pyenv
export PATH="/home/dmvianna/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
