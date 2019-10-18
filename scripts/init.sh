#!/usr/bin/env bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
STOW_DIR="$scriptdir/.."
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

stowfor() {
	stow -vv --dir=$STOW_DIR --target=$HOME $1
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

stowfor homebrew
status 'starting to install brew apps and casks'
brew bundle --global
success 'brew apps installed'

## Install oh-my-zsh
status 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install pure prompt
status 'Installing pure prompt'
npm install --global pure-prompt

# Install TPM
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Install vundle
status 'checking out vundle (vim bundler)'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
success 'vundle installed'

## Visual Studio Code
status 'Copying vscode settings...'
stowfor vscode
ln -s ~/.vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.vscode-keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.vscode-snippets/ ~/Library/Application\ Support/Code/User
success 'Done.'
status 'Installing vscode extensions...'
code --install-extension christian-kohler.npm-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension drKnoxy.eslint-disable-snippets
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension dunstontc.viml
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension mechatroner.rainbow-csv
code --install-extension ms-python.python
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-ssh-explorer
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.atom-keybindings
code --install-extension shinnn.stylelint
code --install-extension smeagolem.ayu-one-dark-pro
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension travisthetechie.write-good-linter
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension wix.vscode-import-cost
success 'Done.'


success 'Setup standardized.'
