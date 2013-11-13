"""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic configuration
"
set nocompatible          " compatibility with vi OFF
set encoding=utf-8        " text encoding
set number                " show line numbering
set hidden                " Hide file in new one is opened
set backspace=2           " backspace to normal mode
set tabstop=4             " tabstop to 4 spaces
set shiftwidth=4          " shiftwidth to 4 spaces
set nowrap                " no lines wraping
set autoindent            " auto indenting
set scrolloff=3           " show 3 lines when scrolling
set laststatus=2          " always show statusline
set vb t_vb=              " turn off bell and blink
set hlsearch              " highlight search
set incsearch             " search while typing
set ignorecase            " ignore case in search 
set smartcase             " don't ignore if uppercase in search term
set noswapfile 			  " don't use swap files
syntax enable             " syntax coloring

" Remember last edit position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"

" Detect filetype
filetype plugin indent on

" Pathogen plugin
call pathogen#infect()


" Airline plugin
if has('gui_running')
	let g:airline_powerline_fonts   = 1
	let g:airline_enable_syntastic  = 1
	let g:airline_enable_branch     = 1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI settings
"

if has('gui_running')
	
	" Set color scheme and fonts
	set background=light
	colorscheme kolor

	" NERDTree plugin
	autocmd VimEnter * NERDTree

	" Set fonts for windows
	if has('win32') || has('win64')
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
	else
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
	endif

	" Disable visual bell
	au GuiEnter * set visualbell t_vb= 
	
	" Remove toolbar and side scroll
	set guioptions-=T 
	set guioptions-=rL

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal settings
"

if ! has('gui_running')

	" Use 256 colors
	set t_Co=256
	
	" Set colorscheme
	colorscheme default 

	" Disable symbols for Airline plugin
	let g:airline_left_sep          = ' '
	let g:airline_left_alt_sep      = ' '
	let g:airline_right_sep         = ' '
	let g:airline_right_alt_sep     = ' '
	let g:airline_branch_prefix     = ' '
	let g:airline_readonly_symbol   = ' '
	let g:airline_linecolumn_prefix = ' '

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPING
"

" Leader key
let mapleader = ","

" Disable help menu
map  <F1> <esc>
imap <F1> <esc>
nmap <F1> <esc>

" Moving keys
nmap J 15j              " move down 15 lines
nmap K 15k              " move up 15 lines

" Toggle NERDTree
map <F2> :NERDTreeToggle<CR>
" Toggle Tagbar
map <F3> :Tagbar<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
