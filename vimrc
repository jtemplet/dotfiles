call plug#begin('~/.vim/plugged')
  Plug 'ayu-theme/ayu-vim' " 
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" enable syntax highlighting
syntax on

" setup correct spacing and tab widths
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

"set autoindent                 " automatic indent new lines
"set smartindent                


" enable filetype detection
filetype on


" ignore case, unless uppercase when searching
set ignorecase
set smartcase


" show the best match so far as search is typed
set incsearch


" change teh to the
abbreviate teh the


" change the color scheme to something i like
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
set background=dark
colorscheme PaperColor

" more nifty ux settings
set ruler               " always show cursor
set number              " line numbers
set backspace=2         " allow backspace in insert mode
set nostartofline       " don't jump to start of line when scrolling
set showmatch           " show matching brackes and braces
set visualbell          " no noise

