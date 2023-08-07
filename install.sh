#!/bin/bash

#==============================================================================
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	OS="MinGW"
elif [[ "$(uname)" == "Darwin" ]]; then
	OS="Mac"
fi

#==============================================================================
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_FILES=(
	".config/nvim"
	".config/rofi"
	".config/ranger"
	".config/tmux"
	".tmux.conf"
	".config/zsh"
	".zshrc"
	".profile"
	".bashrc"
	".bash_profile"
	".xinitrc"
	".Xmodmap"
	".xprofile"
	".Xresources"

)

# remove old links or backup old files/dirs
for FILE in "${BACKUP_FILES[@]}"; do
	if [[ -L $HOME/$FILE ]]; then
		rm $HOME/$FILE
	elif [[ -r $HOME/$FILE ]]; then
		mv $HOME/$FILE $HOME/$FILE.bak-$(date +"%F-%R")
	fi
done

AUTO_LINK_FILES=(
	".config/nvim"
	".config/rofi"
	".config/ranger"
	".config/tmux"
	".tmux.conf"
	".config/zsh"
	".zshrc"
	".profile"
	".xinitrc"
	".Xmodmap"
	".xprofile"
	".Xresources"
)

# add symlinks
for FILE in "${AUTO_LINK_FILES[@]}"; do
	ln -s $DIR/$FILE $HOME/$FILE
done

#==============================================================================
# zsh plugins

# auto suggestion
# mkdir -p $HOME/.zsh
# if [[ ! -d ~/.zsh/zsh-autosuggestions ]]; then
# 	git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# fi

#==============================================================================
