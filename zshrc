# Main configuration
export ZSH="/Users/olive/.oh-my-zsh"
ZSH_THEME="sorin"
DEFAULT_USER=olive
DISABLE_AUTO_UPDATE="true"
plugins=(evalcache git colored-man-pages vi-mode tmux zsh-autosuggestions)
bindkey '  ' autosuggest-accept
source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)
setopt no_share_history
unsetopt share_history

export LANG=en_US.UTF-8
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files'

alias vi=nvim
alias vim=nvim
alias k=kubectl
alias rgf='rg --files | rg'
alias nr='npm run'

# NVM
 export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Local bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc-local ] && source ~/.zshrc-local
