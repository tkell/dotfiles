" The most general
syntax enable
set nu
set autoindent
set clipboard=unnamed

" Colors
set background=light
colorscheme solarized

" Speed up the <Esc> timeout so we leave insert mode faster
set timeoutlen=250
set ttimeoutlen=25

"file types and indentations
set backspace=indent,eol,start

" markdown annoyance
au BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" react annoyance
au BufNewFile,BufReadPost *.tsx, *.jsx set filetype=typescriptreact
autocmd FileType typescriptreact setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" other files
autocmd FileType bzl setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

if has("autocmd")
    filetype plugin indent on
endif

" Using Vim8+ native plugins, see ~/.vim/pack/plugins
" Lightline plugin tweak + config
set laststatus=2
let g:lightline = {'colorscheme': 'solarized'}

" ALE plugin + config, with ruff for Python
let g:ale_linters = {"python": ["ruff", "ruff_format"], "javascript": ["eslint"], "typescript": ["eslint"]}
let g:ale_fixers = {"python": ["ruff", "ruff_format"]}
let g:ale_sign_error = "❌"
let g:ale_sign_warning = "!"
let g:ale_fix_on_save = 1
highlight ALEErrorSign ctermbg=None ctermfg=red
highlight ALEWarningSign ctermbg=None ctermfg=yellow

