Install essentials : 
* Setup Keyboard / 1Password / iCloud
* brew : `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

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
    npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
```

Finally
```
sudo git config --system user.email "foo@bar.com"
```
