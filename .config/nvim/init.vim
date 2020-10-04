if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master.plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'morhetz/gruvbox'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

set termguicolors
set nohlsearch
set clipboard+=unnamedplus

set encoding=utf-8
set noswapfile
set noerrorbells
set number relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Highlights regex epression when using :substitute (only works on neovim)
set inccommand=nosplit

" Assigns leader and localleader keys
let mapleader=","
let maplocalleader=","

" Vimtex settings
let g:tex_flavor = "latex"
let g:vimtex_view_method = "zathura"
let g:vimtex_view_automatic = 0
let g:vimtex_quickfix_open_on_warning = 0

augroup vimrc_tex
    au!
    au FileType tex nmap <buffer><silent> <localleader>c <plug>(vimtex-compile)
    au FileType tex nmap <buffer><silent> <localleader>v <plug>(vimtex-view)
    au FileType tex nmap <buffer><silent> <localleader>b <plug>(vimtex-errors)
    au FileType tex nmap <buffer><silent> <localleader>g :VimtexCountWord<CR>
augroup END

" UltiSnips settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-Tab>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']
map <leader>u :UltiSnipsEdit<CR>

" Gruvbox settings
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

" Python-syntax settings
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_doctests = 1
let g:python_highlight_operators = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_func_calls = 1

augroup python_execute
    au!
    au FileType python nmap <leader>c :w! \| :!python %<CR>
augroup END

" Lightline settings
let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ }

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:netrw_browse_split = 4

augroup netrw_mapping
    au!
    au FileType * nmap <buffer><silent> <leader>e :Lex<CR>
augroup END

" Enables vim-pandoc syntax in markdown files
augroup pandoc_syntax
    au! FileType markdown set syntax=markdown.pandoc
augroup END

" Ignore case when searching
set ignorecase

" Split windows in a more natural way
set splitbelow
set splitright

" Sane keybindings for moving around windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fast saving
nnoremap <leader>w :w<CR>

" Replace all aliased to S
nnoremap S :%s//g<Left><Left>

" Never show statusline (0) or always show statusline (2)
set laststatus=2

" Disable default mode indicator
set noshowmode

" Disables pipe cursor in insert mode
set guicursor=

"" Autocommands
" Runs script to clean tex build files
autocmd VimLeave *.tex !texclear %

" Treats .rmd files as rmarkdown
autocmd BufNewFile,BufFilePre,BufRead *.rmd set filetype=rmd

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace and newlines at end of file on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
