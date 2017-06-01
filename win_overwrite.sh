#!/bin/sh

################################################################################
# copy new, since "Git Bash" seems to have problems with symlinks;
# it just copies
################################################################################

# pull submodules (if any)
git submodule init
git submodule update

# remove current
cd ~
rm -rf .vim
rm -rf .vimrc

# create symlinks (i.e. copy)
ln -s source/karamellpelle-vim/vim .vim
ln -s source/karamellpelle-vim/vimrc .vimrc

