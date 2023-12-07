Install essentials : 
* Setup Keyboard / 1Password / iCloud
* brew, nvm (plus Node versions)

dotfiles
```
git clone https://github.com/omartin/dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install
```


3rd parties
```
    brew install kitty neovim tmux
    brew install nvm ripgrep ag caarlos0/tap/timer gnu-sed
    brew install quicklook-json --cask
    brew tap homebrew/cask-fonts && brew install --cask font-noto-nerd-font font-fira-code-nerd-font 
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
    git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
    git clone https://github.com/Sparragus/zsh-auto-nvm-use ~/.oh-my-zsh/custom/plugins/zsh-auto-nvm-use   
    npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
```

Finally
```
sudo git config --system user.email "foo@bar.com"
```
