karamellpelle-vim
=================

Vim 
    
    $ cd ~
    #$ rm -rf .vim .vimrc # erase current
    $ ln -s source/karamellpelle-vim/vimrc .vimrc
    $ ln -s source/karamellpelle-vim/vim .vim

# TODO
* add [echodoc.vim](https://github.com/Shougo/echodoc.vim`)?
* add [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)?
* add [goyo.vim](https://github.com/junegunn/goyo.vim)?
* add [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)?
* add something like Ctrl-m to force deoplete


# neovim

[To use in NeoVim](https://neovim.io/doc/user/nvim.html#nvim-from-vim):

```
Transitioning from Vim				*nvim-from-vim*

1. To start the transition, create your |init.vim| (user config) file:

    :call mkdir(stdpath('config'), 'p')
    :exe 'edit '.stdpath('config').'/init.vim'

2. Add these contents to the file:

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

3. Restart Nvim, your existing Vim config will be loaded.
```




