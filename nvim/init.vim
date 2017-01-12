" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
"set undofile		" keep an undo file (undo changes after closing)
"set undodir=$HOME/.vim/undo
"set undolevels=1000
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set number		" show line numbers
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"set cmdheight=2		" set command bar height of 2
set laststatus=2


" Tabs are displayed as 4 columns
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set noexpandtab

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"   set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
"if has("autocmd")
"
"  " Enable file type detection.
"  " Use the default filetype settings, so that mail gets 'tw' set to 72,
"  " 'cindent' is on in C files, etc.
"  " Also load indent files, to automatically do language-dependent indenting.
"  filetype plugin indent on
"
"  " Put these in an autocmd group, so that we can delete them easily.
"  augroup vimrcEx
"  au!
"
"  " For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78
"
"  " When editing a file, always jump to the last known cursor position.
"  " Don't do it when the position is invalid or when inside an event handler
"  " (happens when dropping a file on gvim).
"  autocmd BufReadPost *
"    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif
"
"  augroup END
"
"else
"
"  set autoindent		" always set autoindenting on
"
"endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Wild menu (command autocompletion list)
set wildmenu
set wildmode=list:longest,full

" Ignore case in searches
set ignorecase
set smartcase

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
set mat=2

" All operations use the clipboard
set clipboard+=unnamedplus

" Pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable colorscheme
set background=dark
" colorscheme base16-ir-black
colorscheme base16-isotope
" colorscheme base16-monokai
" colorscheme base16-bright
" colorscheme jellybeans
" let g:solarized_termcolors=256
"colorscheme solarized

" Airline configuration
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" GitGutter configuration
let g:gitgutter_max_signs = 5000
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime = 0

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 8

" True color (24-bit)
set termguicolors

" Buffet command
map <F2> :Bufferlist<CR>
