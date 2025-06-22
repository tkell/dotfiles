set nu
set autoindent
set clipboard=unnamed

syntax enable
set background=light
set number
colorscheme solarized

set backspace=indent,eol,start

"file types
au BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufEnter *.md setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

if has("autocmd")
    filetype plugin indent on
endif

" Copliot Things
" Turn copilot off by filetype
let g:copilot_filetypes = {'markdown': v:false, 'text': v:false}
" Turn copilot off when I start a Python comment ...
augroup copilot_off_when_commenting
    autocmd!
    autocmd InsertCharPre *.py if v:char =~'#' | let b:copilot_enabled = 0 | endif 
augroup END
" ... and back on when I leave Insert mode
augroup copilot_on_when_leaving_insert
    autocmd!
    autocmd InsertLeave *.py let b:copilot_enabled = 1
augroup END

" Using Vim8+ native plugins, see ~/.vim/pack/plugins
" Lightline plugin tweak + config
set laststatus=2
let g:lightline = {'colorscheme': 'solarized'}

" ALE plugin + config, with ruff for Python
let g:ale_linters = {"python": ["ruff"]}
let g:ale_fixers = {"python": ["ruff"]}
let g:ale_fix_on_save = 1

