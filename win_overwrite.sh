#!/bin/sh

################################################################################
# copy new, since "Git Bash" seems to have problems with symlinks;
# it just copies
################################################################################

SCRIPT=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")
VIM_DIR="$HOME/.vim"
#NVIM_DIR="$LOCALAPPDATA/nvim"
NVIM_DIR="$HOME/AppData/Local/nvim"
#echo $SCRIPT
#echo $SCRIPT_DIR
#echo "$HOME_DIR"
#echo "$VIM_DIR"
#echo "$NVIM_DIR"

# remove current
cd ~
rm -rf .vim
rm -rf .vimrc
rm -rf "$NVIM_DIR"

# copy new
cp -r "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"
cp -r "$SCRIPT_DIR/vim" "$VIM_DIR"
cp -r "$SCRIPT_DIR/nvim" "$NVIM_DIR"

# remember ':PlugInstall'
