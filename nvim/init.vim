set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup vim-snippy
"
" see `:h snippy-setup-options`
" TIPS: 
"     * snipmate syntax :`:h snippy-snipmate-syntax`
"     * examples  gThttps://github.com/dcampos/nvim-snippy#adding-snippets
"     * use `!lua <CMD>` for lua commands in snippets (or !vim which is default),
"       see `:h snippy-snipmate-eval`
"     * `${<stop or variable>/<replacement>/<flags>}` to tranform using regex
"     * SnitMate has variables $TM_XXX for use, see https://macromates.com/manual/en/environment_variables
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

highlight SnippyHighlight cterm=underline,bold ctermfg=11 gui=bold guifg=Yellow 

lua << EOF
require( 'snippy' ).setup({
        local_snippet_dir = '.snippets',
        hl_group = 'SnippyHighlight'
})

EOF
