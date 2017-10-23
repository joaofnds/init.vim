" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Set encoding
set encoding=utf8

" Enable line Numbers
set number

" Disable line wrap
set nowrap

" Enable relative line numbers
set relativenumber

" 'autoindent' does nothing more than copy the indentation from the previous
"  line, when starting a new line.
set autoindent

" 'smartindent' automatically inserts one extra level of indentation in some
"  cases, and works for C-like files. 
set smartindent
filetype plugin indent on

" Set tab lenght
set tabstop=2
set shiftwidth=2

" Enable show commands
set showcmd

" map jj -> <Esc>
imap jj <Esc>

" Detect filetype and set syntax
filetype plugin on

" Set CWD when as rootdir when opening vim
set autochdir


" Access colors present in 256 colorspace"
let base16colorspace=256

" remap ',c' to open current file in chromium
nnoremap ,c :exe ':silent !chromium-browser %'<CR>

" Enable syntax highlight
syntax enable

" Map control-n to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" Set airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

""" vim-plug config

" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Javascript plugins
Plug 'pangloss/vim-javascript'

" JSON plugins
Plug 'elzr/vim-json'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" General plugins
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

" Config deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

" Set colorscheme
colorscheme base16-onedark

" CtrlP ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '[\/]node_modules/*',
  \ }
