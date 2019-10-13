# Path to your oh-my-zsh installation.
source ~/.bash_profile &>/dev/null
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Grab the .local conf, if it exists
if [ -r $HOME/.zshrc.local ]; then
	source $HOME/.zshrc.local
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

