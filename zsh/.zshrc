# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="eastwood"
ZSH_THEME="eastwood"

zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval ``keychain --eval --agents ssh id_rsa

# User configuration
. /usr/share/autojump/autojump.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags

# Normal Stuff
alias ll='ls -la'
alias c='clear'
alias myip='curl ipinfo.io/ip'
alias hs='history | grep'
alias ccat='pygmentize -g'

# Tmux Stuff
alias ts='tmux new -s ${PWD##*/}'

# 1Password
alias login='eval $(op signin)'
alias password-private='login && op item list --vault private'
alias password-all='login && op item list'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh