dotfiles
```
git clone https://github.com/omartin/dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install
```


3rd parties
```
    brew install nvm ripgrep ag
    brew install quicklook-json --cask
    brew tap homebrew/cask-fonts && brew install --cask font-noto-nerd-font
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
    git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
    npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
```

Finally
```
sudo git config --system user.email "foo@bar.com"
```
