# Aliases
alias ls='ls -G'
alias ll='ls -Ao -G'
alias l='ll'
alias vi='nvim'
alias vim='nvim'
alias tmux='tmux -u'
alias py='python3'
alias ctags='`brew --prefix`/bin/ctags'
alias g='git'

# Environment variables
export LANG=en_US.UTF8
export VISUAL=nvim
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/.nvim/pack/bundle/start/fzf/bin"

alias loc='find . \( -iname '*.swift' -or -iname '*.m' -or -iname '*.java' -or -iname '*.kt' \) -not -path "*Pods*" -not  -path "*Tests*" -not -iname 'R.java' -not -path "*build*" -not -path "*test*" -exec cat {} \; | wc -l'

# Ignore spelling mistakes
shopt -s cdspell

# Git
source ~/.dotfiles/git-completion.bash
 
# Colors
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Prompt
function prompt
{
local DARKBLUE="\[\033[38;5;25m\]"
local BLUE="\[\033[38;5;75m\]"
local PINK="\[\033[38;5;206m\]"
local GRAY="\[\033[0;37m\]"
local BRANCH='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\-\\\\\1/`'
PS1="${DARKBLUE}[${BLUE}\w${PINK}${BRANCH}${DARKBLUE}]${GRAY} "
}
prompt

# Recursive nvim
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    if [ -x "$(command -v nvr)" ]; then
	alias nvim=nvr
    else
	alias nvim='echo "Avoid nesting !"'
    fi
fi

# Kotlin
function kotlinr() {
  kotlinc $1 -include-runtime -d out.jar
  java -jar out.jar
}
