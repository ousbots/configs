set nocompatible

let g:python_host_prog="/usr/local/bin/python3"

" Dein package manager
let g:dein_repo = 'https://github.com/Shougo/dein.vim.git'
let g:dein_dir = '~/.cache/dein'
let g:dein_install_dir = '~/.cache/dein/repos/github.com/Shuogo/dein/vim'

if empty(glob(g:dein_install_dir))
	exec 'silent !mkdir -p '.g:dein_install_dir
	exec '!git clone '.g:dein_repo' '.g:dein_install_dir
endif

exec 'set runtimepath+='.g:dein_install_dir

if dein#load_state(''.g:dein_dir)
	call dein#begin(''.g:dein_dir)

	" Dein tools
	call dein#add(''.g:dein_install_dir)
	call dein#add('Shougo/deoplete.nvim')

    " Utilities
    call dein#add('dense-analysis/ale')
    call dein#add('farmergreg/vim-lastplace')
    call dein#add('KorySchneider/vim-trim')

    " UI
	"call dein#add('vim-airline/vim-airline')
    call dein#add('scrooloose/nerdtree')
    call dein#add('majutsushi/tagbar')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-scripts/buffet.vim')
    "call dein#add('https://bitbucket.org/sras/buffet.git')

    " Themes
    call dein#add('chriskempson/base16-vim')
    call dein#add('tomasr/molokai')

    " Syntax
	call dein#add('rust-lang/rust.vim')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('fatih/vim-go')

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

" Display filename in titlebar
set title

" Set tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smarttab
"set expandtab

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
set background=dark
colorscheme base16-monokai
"colorscheme base16-gruvbox-dark-pale
"colorscheme base16-chalk
"colorscheme base16-outrun-dark
"colorscheme base16-black-metal-bathory
"colorscheme molokai
"colorscheme base16-isotope
"colorscheme base16-tomorrow
"colorscheme base16-cupcake
"colorscheme base16-summerfruit-light
"colorscheme base16-harmonic-light
"colorscheme base16-material-lighter
"colorscheme base16-one-light
"colorscheme base16-shapeshifter

" Clipboard
set clipboard+=unnamedplus

" Optimization
set lazyredraw

" Key mappings
map <C-t> :TagbarToggle<CR>
map <F8> :TagbarOpenAutoClose<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-b> :Bufferlist<CR>


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

" Airline configuration
"let g:airline_extensions = []

" ALE (async language server)
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
"let g:airline#extensions#ale#enabled = 1

"let g:ale_linters = {'python': ['flake8','mypy']}
"let g:ale_python_flake8_options = '--ignore=E501'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"""""""""""""""""""
" Autocmd entries "
"""""""""""""""""""

" Update plugins on start
"autocmd VimEnter * call dein#update()

" Fix overriding tabstop WTF?!
autocmd FileType rust setlocal tabstop=4
