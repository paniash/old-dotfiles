" Vim configuration
"
" Author: Ashish Panigrahi

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'SirVer/ultisnips', { 'for': 'tex' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Some basic stuff
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

" Colorscheme settings with personal modifications
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'hard'

set background=dark

function! AdjustGruvbox()
    highlight! EndOfBuffer gui=bold guibg=bg guifg=#7c6f64
    highlight! CursorLineNr guibg=bg
    highlight! SpecialKey guifg=#A9B4B2
endfunction

augroup gruvbox_colors
    autocmd!
    autocmd ColorScheme gruvbox call AdjustGruvbox()
augroup END

colorscheme gruvbox

" Python-syntax settings
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_doctests = 1
let g:python_highlight_operators = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_func_calls = 1

" C settings
augroup c_execute
    au!
    au FileType c nmap <leader>c :w! \| :!gcc % && ./a.out<CR>
    au FileType c nmap <leader>g :w! \| :!gcc -O -Wall -W -pedantic %<CR>
    au FileType c nmap <leader>l :w! \| :!splint %<CR>
augroup END

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_preview = 1

augroup netrw_mapping
    au!
    au FileType * nmap <buffer><silent> <C-x> :Lex<CR>
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
set laststatus=0

" Disables pipe cursor when in insert mode (vim like)
set guicursor=

"" Autocommands
" Runs script to clean tex build files
autocmd VimLeave *.tex !texclear %

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically deletes all trailing whitespace and newlines at end of file on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
