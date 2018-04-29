""""""""""""""""""""""""""""""
" => .vimrc of Chuma McPhoy
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Core Essentials
""""""""""""""""""""""""""""""
set nocompatible                         " be iMproved
let mapleader = "\<Space>"               " <leader> for all mappings                                       

""""""""""""""""""""""""""""""
" => Vundle Plugin Setup 
""""""""""""""""""""""""""""""
filetype off " Required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                            " let Vundle manage Vundle, required

" COLORS
Plugin 'tyrannicaltoucan/vim-deep-space'		 " Colorscheme: Deep Space
Plugin 'yuttie/hydrangea-vim'				 " Colorscheme: Hydrangea
Plugin 'junegunn/seoul256.vim'				 " Colorscheme: Seoul256
Plugin 'davidklsn/vim-sialoquent'			 " Colorscheme: Sialoquent
Plugin 'lifepillar/vim-solarized8'			 " Colorscheme: Solarized8
Plugin 'tyrannicaltoucan/vim-quantum'			 " Colorscheme: Quantum
Plugin 'arcticicestudio/nord-vim'

" SYNTAX
Plugin 'othree/html5.vim'                                " HTML syntax
Plugin 'hail2u/vim-css3-syntax'                          " CSS syntax
Plugin 'cakebaker/scss-syntax.vim'                       " SASS syntax
Plugin 'kchmck/vim-coffee-script'                        " CoffeeScript syntax
Plugin 'pangloss/vim-javascript'                         " JS syntax
Plugin 'othree/javascript-libraries-syntax.vim'          " JS libs & frameworks
Plugin 'elzr/vim-json'                                   " JSON syntax
Plugin 'digitaltoad/vim-pug'				 " Pug syntax
Plugin 'posva/vim-vue'					 " Vue syntax

" FILE NAVIGATION & EDITING
Plugin 'mileszs/ack.vim'                                 " Search in code and filenames
Plugin 'ctrlpvim/ctrlp.vim'                              " Fuzzy file finder
Plugin 'scrooloose/nerdtree'                             " Tree-like file navigation

Plugin 'mattn/emmet-vim'                                 " Faster HTML & CSS workflow
Plugin 'tpope/vim-surround'                              " Faster Quoting/parenthesizing
Plugin 'raimondi/delimitmate'			         " Insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'tpope/vim-fugitive'                              " a Git wrapper so awesome, it should be illegal
Plugin 'andrewradev/splitjoin.vim'			 " Simplify switching between single and multi-line statements
Plugin 'w0rp/ale'					 " Asynchronus linting for Vim!

Plugin 'junegunn/goyo.vim'				 " Distraction-free writing in Vim
Plugin 'junegunn/limelight.vim'				 " Hyperfocus-writing in Vim
Plugin 'junegunn/vim-journal'                            " markdown-like syntax for plain-text notes


" OTHER
Plugin 'itchyny/lightline.vim'                           " minimal statusbar
"Plugin 'fatih/vim-go'                                    " Go development plugin
"Plugin 'ashisha/image.vim'
"Plugin 'tpope/vim-afterimage'

call vundle#end() " make sure your plugins are before this line

filetype plugin indent on

""""""""""""""""""""""""""""""
" => Vim UI
""""""""""""""""""""""""""""""
syntax on 
"set t_Co=256
set background=dark
set termguicolors

" colorscheme configurations
let g:seoul256_background = 239 " range: 233 (darkest) ~ 239 (lightest)
"let g:quantum_black=1
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" current colorscheme
colorscheme nord

""""""""""""""""""""""""""""""
" => Main Configuration (a-z)
""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set nobackup
set cursorline  
set encoding=utf-8 
set expandtab
set nofoldenable
set history=200
set hlsearch
set ignorecase
set laststatus=2
set number
set ruler
set shiftwidth=2
set showcmd
set smartcase
set smartindent
set softtabstop=2
set noswapfile
set textwidth=80
set title
set nowrap
set noet

""""""""""""""""""""""""""""""
" => File Configs
""""""""""""""""""""""""""""""
autocmd FileType html,css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript,coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4

""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""
" faster saves and quits
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>       

" extremely useful with multi-split windows
nmap <leader>o :only<CR>

" source current file
nmap <leader>s :so %<CR>

" splits
nmap <leader>v :vsp<CR><C-w><C-w>
nmap <leader>h :sp<CR><C-w><C-w>

" fast escapes from insert, visual and command-line mode
inoremap jk <esc>
xnoremap h <esc>
cnoremap jk <esc>

" fast & intuitive finds
nmap <leader>f /

" move lines with C-(hjkl)
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" clear all search highlighting
nnoremap <leader>c :nohl<CR>

" tabular navigation
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>t :tabnew<cr>

""""""""""""""""""""""""""""""
" => Plugin Configs (a-z)
""""""""""""""""""""""""""""""
" => Ack
nmap <leader>a <CR>:Ack ""<left>
nmap <leader>A :tab split<CR>:Ack "\W<C-r><C-w>\W"<CR>

" => ALE
let g:ale_fixers = {}
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_pattern_options = {
      \   '.*\.html$': {'ale_enabled': 0},
      \}

" => CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|coverage|target|dist|build|bin|vendor)|(\.(swp|ico|git|svn|png|jpg|gif|ttf))$'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_regexp_search = 1
let g:ctrlp_by_filename = 0

" => Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" => Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Git branch<CR>

" => Limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" => NERDTree
nmap <silent> <C-N> :NERDTreeToggle<CR>
