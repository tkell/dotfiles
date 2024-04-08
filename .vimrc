set nu
set autoindent
set clipboard=unnamed

syntax enable
set background=light
set number
colorscheme solarized

set backspace=indent,eol,start

"file types
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

if has("autocmd")
    filetype plugin indent on
endif

" Using Vim8+ native plugins, see ~/.vim/pack/plugins
" Lightline plugin tweak + config
set laststatus=2
let g:lightline = {'colorscheme': 'solarized'}

" ALE plugin + config, with ruff and black for Python
let g:ale_linters = {"python": ["ruff"]}
let g:ale_fixers = {"python": ["ruff", "black"]}
let g:ale_fix_on_save = 1

