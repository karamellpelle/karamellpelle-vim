karamellpelle-vim
=================

    $ cd ~
    #$ rm -rf .vim .vimrc # erase current
    $ ln -s source/karamellpelle-vim/vimrc .vimrc
    $ ln -s source/karamellpelle-vim/vim .vim

# TODO

* add [echodoc.vim](https://github.com/Shougo/echodoc.vim`)?
* add [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)?
* add [goyo.vim](https://github.com/junegunn/goyo.vim)?
* add [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)?
* add snippets?


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

# resources

* [https://vimawesome.com/](https://vimawesome.com/)
* [http://bestofvim.com/](http://bestofvim.com/)
* [http://vimcasts.org/](http://vimcasts.org/)
* [https://www.reddit.com/r/vim](https://www.reddit.com/r/vim)
* [http://vim.wikia.com/wiki/Vim_Tips_Wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki)
* [https://pragprog.com/book/dnvim/practical-vim](https://pragprog.com/book/dnvim/practical-vim)
* [https://el-tramo.be/blog/my-favorite-vim-plugins/](https://el-tramo.be/blog/my-favorite-vim-plugins/)
* [https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
* [http://stevelosh.com/blog/2010/09/coming-home-to-vim/](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)




