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
Plug 'tpope/vim-commentary'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'iamcco/markdown-preview.nvim', {'do': {->mkdp#util#install()}, 'for':['markdown', 'vim-plug']}
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
call plug#end()

set termguicolors

set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" Some basics
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

"With a map leader it's possible to do extra key combinations
"like <leader>w saves the current file
let mapleader=","
let maplocalleader=","

"Mapping for instant Goyo mode
nnoremap <leader>g :Goyo<cr> :set laststatus=0<cr>
let g:goyo_width = "80%"
let g:goyo_height = "80%"

"Settings for UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"Opens :UltiSnipsEdit in a split window
let g:UltiSnipsEditSplit="vertical"

"Sets absolute path for UltiSnips to find user-defined snippets
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']

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

" Highlights regex expression when using the :substitute command
set inccommand=nosplit

"Add a bit extra margin to the left
set foldcolumn=0

"Never show the status line
set laststatus=0

set lazyredraw

"Gets rid of default mode display
set noshowmode

let g:vimtex_view_method = "zathura"
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_method = "latexmk"

"" Airline settings
" Airline theme
let g:airline_theme='dark'

" let g:airline_symbols_ascii = 1
" let g:airline_powerline_fonts = 1
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
let g:airline_disable_statusline=0
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = 	['vimwiki', 'tex', 'rmarkdown', 'text']
" let g:airline#extensions#wordcount#formatter = 'default'
let g:airline#extensions#wordcount#formatter#default#fmt = '%s words'

" let g:airline_extensions = ['vimtex', 'whitespace', 'keymap', 'netrw']

let g:airline#extensions#default#layout = [
 			\ ['a', 'b', 'c'],
 			\ ['x', 'y', 'z']
 			\ ]


" Disables arrows in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" Split settings for a more natural feel
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Treats .rmd files as rmarkdown
autocmd BufNewFile,BufFilePre,BufRead *.rmd set filetype=rmarkdown

" Runs xrdb after making changes to .Xresources file
autocmd BufWritePost .Xresources !xrdb .Xresources

" " Make a copy of resume.pdf into website/ after updating it 
" autocmd BufWritePost resume.tex !rm ~/website/static/files/cv.pdf; cp resume.pdf ~/website/static/files/cv.pdf

" " Compiles R markdown files to pdf (Luke's script)
" autocmd Filetype rmd map <leader>c :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" " Compiles R markdown files to pdf using rmarkdown plugin
" autocmd Filetype rmarkdown nnoremap <leader>c :RMarkdown pdf<cr>

" Runs script to clean tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Compiles documents be it LaTeX, markdown or groff
map <leader>c :w! \| !compiler <c-r>%<CR>

" " Automatically deletes all trailing whitespace and newlines at end of file on save.
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritepre * %s/\n\+\%$//e

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Vim-pandoc settings
let g:pandoc#modules#disabled = ["folding"]

" Enables vim-pandoc syntax in *.md files
au FileType vimwiki set syntax=markdown.pandoc

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Markdown-preview.nvim settings
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'firefox'
nnoremap <leader>v :MarkdownPreview<cr>
