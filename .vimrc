" Basic configuration

set nocompatible          " compatibility with vi OFF
set number                " show line numbering
set backspace=2           " backspace to normal mode
set tabstop=4             " tabstop to 4 spaces
set shiftwidth=4          " shiftwidth to 4 spaces
set nowrap                " no lines wraping
set autoindent            " auto indenting
set scrolloff=3           " show 3 lines when scrolling
set laststatus=2          " always show statusline
set noeb vb t_vb=         " turn off bell and blink
set hlsearch              " highlight search
set incsearch             " search while typing
set ignorecase            " ignore case in search 
set smartcase             " don't ignore if uppercase in search term

" Syntax coloring
syntax on
hi comment ctermfg=LightBlue
hi search ctermfg=white ctermbg=blue
hi statusline ctermbg=white ctermfg=blue
hi linenr ctermfg=darkcyan

" Status line
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=line[%l/%L]   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Change status line color when in insert mode
if version >= 700
  au InsertEnter * hi statusline ctermbg=white ctermfg=red
  au InsertLeave * hi statusline ctermbg=white ctermfg=blue
endif


""" KEY MAPPING "
let mapleader = ","
nmap <c-space> :nohl

" Disable help menu
map  <F1> <esc>
imap <F1> <esc>
nmap <F1> <esc>

" Moving keys
nmap J 15j
nmap K 15k

" Folding
nmap <F9>  za   " toggle fold
nmap <F12> zfa} " create fold

au BufWinLeave * silent! mkview    	" store folds on exit
au BufWinEnter * silent! loadview	" reload folds 

" C Programming shortcuts
map <leader>f ofor( i=0 ;; i++ ) {<ESC>o}<ESC>kI<ESC>f;a<SPACE>
map <leader>w owhile() {<ESC>o}<ESC>kI<ESC>f(a
map <leader>i oif() {<ESC>o}<ESC>kf(a
map <leader>s oswitch() {<ESC>ocase:<CR>break;<CR>case:<CR>break;<CR>default:<CR>}<ESC>6kf(a
map <leader>c i/*  */<ESC><C-v>=0f*la
map <leader>h 0i/<ESC>80a*<ESC>0o*     FUNCTION:<ESC>0o*        INPUT:<ESC>0o*       OUTPUT:<ESC>0o*  DESCRIPTION:<ESC>0o/<ESC>080i*<ESC>4kA

" Tabs
nnoremap <silent> <leader>n :tabnext<CR>
nnoremap <silent> <leader>m :tabprevious<CR>
nnoremap <silent> <leader>t :tabnew<CR>


