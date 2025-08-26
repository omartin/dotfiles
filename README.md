Install essentials : 
* Setup
    * iCloud
    * Keyboard Layout
    * 1Password
    * Karabiner
    * Alfred
* brew : `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* Docker : https://docs.docker.com/get-docker/

dotfiles
```
git clone https://github.com/omartin/dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install
```


3rd parties
```
    brew install asdf kitty neovim tmux
    brew install ripgrep ag caarlos0/tap/timer gnu-sed fzf
    brew install quicklook-json --cask
    brew install --cask font-noto-nerd-font font-fira-code-nerd-font
    asdf plugin add nodejs
    asdf install nodejs 18.20.8
    npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
```

Finally
```
sudo git config --system user.email "foo@bar.com"
```
