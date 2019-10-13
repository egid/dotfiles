# ag
alias ag='\ag --pager="less -RS"'

# Git
alias g="git"
alias gs="git status -s"
alias gsl="git status --long"
alias gr="git checkout"
alias gb="git checkout -b "
alias gp="git push"
alias gf="git fetch"
alias gcm="git commit -m "			# commit staged + message
alias gcam="git commit -am "		# commit all (except untracked) + message
alias gadda="git add -A"
alias gsp="git stash pop"
alias gl="git checkout @{-1}"		# previous branch
alias master="git checkout master && git pull"

## list the most recent branches viewed
alias grb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) %(authoremail) %(color:green)%(committerdate:relative)%(color:reset)' --count=10"

## Get the latest of the branch, stash around
alias gups="git stash && git pull --rebase && git stash pop"

## Drop master onto the current branch
alias gpom="git pull origin master"

## Drop master onto the current branch via rebase
alias gprom="git pull --rebase origin master"

## Drop master onto the current branch, but stash / stash pop around the pull
alias gpoms="git stash && git pull origin master && git stash pop"

## show commit-ish for diff between master & branch
alias ish="git log --pretty=oneline origin/master.."

## show files changed in each commit
alias commits="git log --stat"
alias glog="git log --stat"

## show changes in current staged commits
alias staged="git show --pretty=\"format:\" --stat"

## show unstaged ++--
alias files="git diff --stat"

## Gah. 			Undo commit, keeping changes intact
alias oops="git reset --soft HEAD^"

## Welp. 			Reset previous commit, but keep all the associated changes.
alias dammit="git reset --hard HEAD"

## Fack. 			Make master look like origin/master, since you broke everything.
alias ffuuu="git fetch origin && git reset --hard origin/master"

## Open any files marked as “modified” in your default editor.
alias changed='open `git status --porcelain | sed -ne "s/^ M //p"`'


# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

# Fix Thunderbolt Camera
alias fixcam="sudo killall VDCAssistant"


# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"


# SYSTEM TOOLS
CASKTOOLS="1password alfred appzapper bartender coconutbattery controlplane flux istat-menus onyx the-unarchiver"

# FONTS
CASKFONTS="font-source-code-pro font-source-code-pro-for-powerline"

# CODE / DEVELOPMENT
CASKCODE="atom dropbox firefox google-chrome iterm2 macdown screenhero slack sublime-text3 vagrant virtualbox virtualbox-extension-pack"

# DESIGN
CASKDESIGN="adobe-creative-cloud imageoptim xscope sketch"

# MISC
CASKMISC="vlc steam air-video-server-hd"

# Reinstall all those apps
alias recask="brew cask install $(echo $CASKTOOLS $CASKFONTS $CASKCODE $CASKDESIGN $CASKMISC)"


alias sd="SwitchAudioSource -c"
