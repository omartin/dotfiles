# Main configuration
export ZSH="/Users/olive/.oh-my-zsh"
ZSH_THEME="agnoster"
DEFAULT_USER=olive
DISABLE_AUTO_UPDATE="true"
plugins=(git colored-man-pages vi-mode tmux heroku)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias vi=nvim
alias vim=nvim

# Local bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc-local ] && source ~/.zshrc-local
