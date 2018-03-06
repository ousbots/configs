set nocompatible

" Dein package manager
let g:dein_repo = 'https://github.com/Shougo/dein.vim.git'
let g:dein_dir = '~/.config/nvim/dein/repos/github.com/Shuogo/dein.vim'

if empty(glob(g:dein_dir))
	exec 'silent !mkdir -p '.g:dein_dir
	exec '!git clone '.g:dein_repo' '.g:dein_dir
endif

exec 'set runtimepath^='.g:dein_dir

if dein#load_state(expand('~/.config/nvim/dein'))
	call dein#begin(expand('~/.config/nvim/dein'))

    " Utilities
	call dein#add('Shougo/dein.vim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/deoplete.nvim')
    call dein#add('jakedouglas/exuberant-ctags')
    call dein#add('vim-syntastic/syntastic')
    call dein#add('farmergreg/vim-lastplace')

    " UI
	call dein#add('vim-airline/vim-airline')
    call dein#add('scrooloose/nerdtree')
    call dein#add('majutsushi/tagbar')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-scripts/buffet.vim')
    "call dein#add('https://bitbucket.org/sras/buffet.git')

    " Themes
    call dein#add('chriskempson/base16-vim')
    call dein#add('tomasr/molokai')

    " Syntax
	"call dein#add('rust-lang/rust.vim')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('ntpeters/vim-better-whitespace')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif


""""""""""""""""""""""""""
" Configuration Settings "
""""""""""""""""""""""""""

" Set tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Backup and history settings
set nobackup
set history=50

" Display status and info
set laststatus=2
set ruler
set number

" Search settings
set ignorecase
set smartcase

" Syntax and search highlighting
if &t_Co > 2 || has('gui_running')
    syntax on
    set hlsearch
endif

" Syntax
set showmatch
set mat=2

" Colorscheme
set termguicolors
set background=light
"colorscheme base16-isotope
"colorscheme base16-tomorrow
"colorscheme base16-cupcake
colorscheme base16-summerfruit-light
"colorscheme molokai

" Clipboard
set clipboard+=unnamedplus

" Optimization
set lazyredraw

" Key mappings
map <F7> :TagbarToggle<CR>
map <F8> :TagbarOpenAutoClose<CR>
map <F9> :NERDTreeToggle<CR>
map <F10> :Bufferlist<CR>


"""""""""""""""""""""""""
" Plugin Configurations "
"""""""""""""""""""""""""

" GitGutter
if exists('&signcolumn')
    set signcolumn = "yes"
else
    let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_max_signs = 1000
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler_options = "-std=c++17 -Wall -Werror -Wextra -pedantic"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_lock_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""""""""
" Autocmd entries "
"""""""""""""""""""

" Update plugins on start
autocmd VimEnter * call dein#update()
