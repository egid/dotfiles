#!/usr/bin/env bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
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

## Startup
status 'Starting installs...'

## Homebrew
if [[ $(which brew) == "" ]]; then
    status 'Installing homebrew...'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    success 'Homebrew installed.'
else
	success 'Homebrew already installed.'
fi


## Stow + Homebrew
cd $scriptdir/..
stow homebrew
status 'starting to install brew apps and casks'
brew bundle --global
success 'brew apps installed'

## Install oh-my-zsh


## Install vundle
status 'checking out vundle (vim bundler)'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
success 'vundle installed'
