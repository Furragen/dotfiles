#
# .zshrc
#
# @author Alex König
#
# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Custom $PATH with extra locations.
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/share:$HOME/.krew/bin:$HOME/.toolbox/bin:$HOME/.cargo/bin:$PATH

ZSH_THEME="robbyrussell"

plugins=(aws git kubectl terraform)

source $ZSH/oh-my-zsh.sh

alias ls="eza"
alias cat="bat"
alias du="dust"
alias find="fd"
alias grep="rg"
alias vim="nvim"

arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    share_path="/usr/local/share"
elif [ "${arch_name}" = "arm64" ]; then
    share_path="/opt/homebrew/share"
else
    echo "Unknown architecture: ${arch_name}"
fi

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
