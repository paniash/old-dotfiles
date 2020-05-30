""*************************************
 " _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|

"My vimrc file to add plugins and such
"**************************************
if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

let g:sneak#label = 1

set termguicolors

"With a map leader it's possible to do extra key combinations
"like <leader>w saves the current file
let mapleader=","
let maplocalleader=","

"Fast saving
nmap <leader>w :w!<cr>

"Settings for UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"Opens :UltiSnipsEdit in a split window
let g:UltiSnipsEditSplit="vertical"

"Sets absolute path for UltiSnips to find user-defined snippets
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']

"Enables numbered lines on startup
set number relativenumber

"enable syntax highlighting
syntax enable

set nocompatible

" enables syntax colours
syntax on

" enabling utf-8
set encoding=utf-8

" enables bold text
let g:gruvbox_bold = 1

""enables italics
"let g:gruvbox_italic = 1

" changes dark mode contrast
let g:gruvbox_contrast_dark = 'hard'

set background=dark

colorscheme gruvbox

"Some basics:
filetype plugin on
filetype indent on
"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Ignore case when searching
set ignorecase

"Highlight search results
:set hlsearch

"Add a bit extra margin to the left
set foldcolumn=0

set lazyredraw

"Always show the status line
set laststatus=2

"Gets rid of default mode display
set noshowmode

let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_method = "latexmk"
" let g:vimtex_compiler_latexmk_engines = "xelatex"

" set smarttab
set tabstop=4

"" Airline settings
" Airline theme
let g:airline_theme='dark'

" let g:airline_powerline_fonts = 1
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
let g:airline_disable_statusline=0
let g:airline_extensions = ['vimtex', 'whitespace', 'keymap', 'netrw']

let g:airline#extensions#default#layout = [
 			\ ['a', 'b', 'c'],
 			\ ['x', 'y', 'z']
 			\ ]


" Goyo shortcut
nmap <leader>g :Goyo<cr>

" Disables arrows in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set timeoutlen=1000

set ttimeoutlen=0

"" Split settings for a more natural feel
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" " split windows horizontally
" nnoremap <C-S> <C-W><C-S>
" " split windows vertically
" nnoremap <C-V> <C-W><C-V>

"" PEP 8 indentation for python
au BufNewFile,BufRead .py
 	\ set tabstop=4
 	\ set softtabstop=4
 	\ set shiftwidth=4
 	\ set textwidth=79
 	\ set expandtab
 	\ set autoindent
        \ set fileformat=unix

" makes .py files look pretty
let python_highlight_all=1

" opens link within the terminal using urlview
:noremap <leader>u :w<Home>silent <End> !urlview<CR>

" Adds parentheses around a word
:map \p bi(<Esc>ea)<Esc>

" Adds curly braces around a word
:map \c bi{<Esc>ea}<Esc>

" Adds italics in markdown files
:map \i bi*<Esc>ea*<Esc>

" Adds bold in markdown files
:map \b bi**<Esc>ea**<Esc>

set wrapmargin=1

" Treats .rmd files as rmarkdown
autocmd BufNewFile,BufFilePre,BufRead *.rmd set filetype=rmarkdown

" Runs xrdb after making changes to .Xresources file
autocmd BufWritePost .Xresources !xrdb .Xresources

" Make a copy of resume.pdf into website/ after updating it 
autocmd BufWritePost resume.tex !rm ~/website/static/files/cv.pdf; cp resume.pdf ~/website/static/files/cv.pdf

" Compiles R markdown files to pdf (Luke's script)
autocmd Filetype rmd map <leader>c :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" " Compiles R markdown files to pdf using rmarkdown plugin
" autocmd Filetype rmarkdown nnoremap <leader>c :RMarkdown pdf<cr>

" Opens corresponding .pdf file (Luke's script)
map <leader>p :!opout <c-r>%<CR><CR>

" Toggles autocompiler
map <leader>a :!setsid autocomp % &<CR>

" Runs script to clean tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" " Compiles and relaunches dwmblocks after editing blocks.h file
" autocmd BufWritePost ~/suckless/dwmblocks/blocks.h !cd ~/suckless/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }

" Disables automatic folding in markdown documents
let g:pandoc#folding#level = 0
let g:pandoc#folding#fdc = 0

" " Automatically deletes all trailing whitespace and newlines at end of file on save.
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritepre * %s/\n\+\%$//e

" Replace ex mode with gq
map Q gq
