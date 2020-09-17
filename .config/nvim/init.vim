if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master.plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'morhetz/gruvbox'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'tpope/vim-commentary'
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
set expandtab

let mapleader=","
let maplocalleader=","

" Vimtex settings
let g:tex_flavor = "latex"
let g:vimtex_view_method = "zathura"
let g:vimtex_view_automatic = 0

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

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
nnoremap S :%s//g/<Left><Left>

" Never show status line
set laststatus=0

"" Automating some stuff
" Deletes trailing whitespace on save
autocmd BufWritePre * %s/\n\+\%$//e

" Runs script to clean tex build files
autocmd VimLeave *.tex !texclear %

" Treats .rmd files as rmarkdown
autocmd BufNewFile,BufFilePre,BufRead *.rmd set filetype=rmd
