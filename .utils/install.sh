#!/usr/bin/env sh

# Reference
# https://www.atlassian.com/git/tutorials/dotfiles
# https://news.ycombinator.com/item?id=11070797
# https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles

# Clone dotfiles repo into a temporary directory
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/lemick465/.dotfiles.git dotfiles-tmp

# Copy dotfiles from the temporary directory to the home directory
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/

# Clean up the temporary directory
rm --recursive --force dotfiles-tmp

# Configure dotfiles repo to hide untracked files
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Source helper scripts
# . "$HOME/.utils/replace_placeholder.sh"
. "$HOME/.utils/setup.sh"
