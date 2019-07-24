# Installation
```
    git clone git@github.com:omartin/dotfiles.git ~/.dotfiles
    touch ~/.zshrc-local
    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/gitignore ~/.gitignore
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/tmuxinator ~/.tmuxinator
    ln -s ~/.dotfiles/tern-config ~/.tern-config
    ln -s ~/.dotfiles/oni ~/.config/oni
    ln -s ~/.dotfiles/ctags ~/.ctags
    ln -s ~/.dotfiles/prettierrc ~/.prettierrc
    ln -s ~/.dotfiles/mongorc.js ~/.mongorc.js
```

Useful 3rd parties:
```
    brew cask install quicklook-json
```

Finally :
```
sudo git config --system user.email "foo@bar.com"
```
