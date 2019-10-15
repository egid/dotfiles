#!/usr/bin/env bash


## Colors, because readability

rf=$(tput setaf 1)
rb=$(tput setab 1)
gf=$(tput setaf 2)
bf=$(tput setaf 4)
wf=$(tput setaf 7)
yf=$(tput setaf 3)
reset=$(tput op)

success() {
    echo -e "${gf}==>${reset} $1"
}

warn() {
    echo -e "${yf}==>${reset} $1"
}

error() {
    echo -e "${rf}==> ${rb}${wf} ERROR ${reset} $1"
    exit 1
}

status() {
    echo -e "${bf}==>${reset} $1"
}

log() {
    echo -e "    $1"
}

## Handle input
confirm () {
	read -r -p "${1:-Are you sure? [y/N]} " response
	case $response in
		[yY][eE][sS]|[Y]|[y])
			true
			;;
		*)
			false
			;;
	esac
}


## Install homebrew, if it's missing
if [[ $(which brew) == "" ]]; then
    status "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    success "Brew installed."
fi

## Install homebrew basics
BREW_CLI="coreutils git git-lfs nginx openconnect python rsync stow tmux zsh wget mas"
brew install ${BREW_CLI}
success "Command line tools installed using brew:" 
status "${BREW_CLI}"

## Install homebrew cask apps
BREW_APP="1password alfred bartender brave-browser dropbox firefox iterm2 slack sublime-merge sublime-text the-unarchiver tuntap visual-studio-code"
brew cask install ${BREW_APP}
success "Apps installed using brew cask:"
status "${BREW_APP}"

## Install oh-my-zsh


## Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
