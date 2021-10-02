# Installation
```
    git clone git@github.com:omartin/dotfiles.git ~/.dotfiles
    touch ~/.zshrc-local
    #ln -sf ~/.dotfiles/zshrc ~/.zshrc
    ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
    ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
    ln -sf ~/.dotfiles/gitignore ~/.gitignore
    ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -sf ~/.dotfiles/tmuxinator ~/.tmuxinator
    ln -sf ~/.dotfiles/tern-config ~/.tern-config
    ln -sf ~/.dotfiles/ctags ~/.ctags
    ln -sf ~/.dotfiles/prettierrc ~/.prettierrc
    ln -sf ~/.dotfiles/mongorc.js ~/.mongorc.js
    ln -sf ~/.dotfiles/xvimrc ~/.xvimrc
    ln -sf ~/.dotfiles/alacritty.yml ~/.alacritty.yml
```

3rd parties:
```
    brew cask install quicklook-json
    brew tap homebrew/cask-fonts && brew install --cask font-noto-nerd-font
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
    git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache

```

Finally :
```
sudo git config --system user.email "foo@bar.com"
```
