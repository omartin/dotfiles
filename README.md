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
    ln -s ~/.dotfiles/ctags ~/.ctags
    ln -s ~/.dotfiles/prettierrc ~/.prettierrc
    ln -s ~/.dotfiles/mongorc.js ~/.mongorc.js
    ln -s ~/.dotfiles/xvimrc ~/.xvimrc
    ln -s ~/.dotfiles/alacritty.yml ~/.alacritty.yml
```

Useful 3rd parties:
```
    brew cask install quicklook-json
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


```

Finally :
```
sudo git config --system user.email "foo@bar.com"
```
