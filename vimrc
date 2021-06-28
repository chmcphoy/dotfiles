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
Plugin 'nightsense/cosmic_latte'
Plugin 'nightsense/seabird'
Plugin 'mhartington/oceanic-next'
Plugin 'arcticicestudio/nord-vim'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'junegunn/seoul256.vim'	
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'
Plugin 'b4skyx/serenade'
Plugin 'sainnhe/everforest'

" SYNTAX
Plugin 'sheerun/vim-polyglot'                            " Language pack - needed for nova
Plugin 'othree/html5.vim'                                " HTML syntax
Plugin 'hail2u/vim-css3-syntax'                          " CSS syntax
Plugin 'cakebaker/scss-syntax.vim'                       " SASS syntax
Plugin 'kchmck/vim-coffee-script'                        " CoffeeScript syntax
Plugin 'pangloss/vim-javascript'                         " JS syntax
Plugin 'othree/javascript-libraries-syntax.vim'          " JS libs & frameworks
Plugin 'elzr/vim-json'                                   " JSON syntax
Plugin 'digitaltoad/vim-pug'				 " Pug syntax
Plugin 'posva/vim-vue'					 " Vue syntax

" FILE NAVIGATION
Plugin 'junegunn/fzf.vim'                                " Fuzzy file finder

Plugin 'scrooloose/nerdtree'                             " Tree-like file navigation
Plugin 'mhinz/vim-tree'					 " Tree in vim
Plugin 'chrisbra/csv.vim'

" EDITING
Plugin 'mattn/emmet-vim'                                 " Faster HTML & CSS workflow
Plugin 'mattn/webapi-vim'				 " Vim interface to Web API's
Plugin 'raimondi/delimitmate'			         " Insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'tpope/vim-surround'                              " Faster Quoting/parenthesizing
Plugin 'andrewradev/splitjoin.vim'			 " Simplify switching between single and multi-line statements
Plugin 'tpope/vim-commentary'

Plugin 'junegunn/goyo.vim'				 " Distraction-free writing in Vim
Plugin 'junegunn/limelight.vim'				 " Hyperfocus-writing in Vim

" MISC UTILITIES
Plugin 'shime/vim-livedown'                              " Live Markdown previews - without leaving Vim.
Plugin 'w0rp/ale'					 " Asynchronus linting for Vim!
Plugin 'tpope/vim-fugitive'                              " a Git wrapper so awesome, it should be illegal
Plugin 'itchyny/lightline.vim'                           " minimal statusbar
Plugin 'ryanoasis/vim-devicons'                          " markdown-like syntax for plain-text notes
Plugin 'Yggdroot/indentLine'

call vundle#end() " make sure your plugins are before this line

filetype plugin indent on

""""""""""""""""""""""""""""""
" => Vim UI
""""""""""""""""""""""""""""""
syntax on 
set background=dark
" set t_Co=256 (Vim 7)
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " (vim 8)
set rtp+=/usr/local/opt/fzf

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253

" Colorscheme Configurations
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft" " Options: soft, medium, hard
let g:everforest_background = 'soft'
let g:seoul256_background = 252

" current colorscheme
colorscheme everforest

" Colorscheme Configurations
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

""""""""""""""""""""""""""""""
" => Main Configuration (a-z)
""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set nobackup
set cursorline  
" set encoding=utf-8 
set encoding=UTF-8
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
" nmap <leader>f /

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

" => Rename visual selected text
xnoremap <leader>r :<C-u>'{,'}s/<C-r>=GetVisualSelection()<CR>/
xnoremap <leader>R :<C-u>%s/<C-r>=GetVisualSelection()<CR>/

function! GetVisualSelection()
    let old_reg = @v
    normal! gv"vy
    let raw_search = @v
    let @v = old_reg
    return substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

""""""""""""""""""""""""""""""
" => Plugin Configs (a-z)
""""""""""""""""""""""""""""""

" => Asynchronous Lint Engine (ALE)
let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'vue': ['eslint'],
      \  'markdown': ['markdownlint'],
      \  'scss': ['stylelint']
      \}

let g:ale_fixers = {}

let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--single-quote'

let g:ale_fixers['vue'] = ['prettier', 'eslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_pattern_options = {
      \   '.*\.html$': {'ale_enabled': 0},
      \}

let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_fix_on_save = 1

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)j
let g:ale_sign_error = '👎'
let g:ale_sign_warning = '❓'
let g:ale_statusline_format = ['👎 %d', '❓ %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message

" => FZF 🌺
nnoremap <silent> <c-p> :GFiles<cr>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" => Emmet
let g:user_emmet_install_global = 1
autocmd FileType html,css,vue,javascript EmmetInstall
" trigger emmet with fewer keystrokes
imap <C-e> <C-y>, 
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.emmet-custom-snippets.json')), "\n"))


" => Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>

" => Limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" => Vim-Livedown
nmap gm :LivedownToggle<CR>

" => NERDTree
nmap <silent> <C-N> :NERDTreeToggle<CR>

" => Vim-Vue
let g:vue_disable_pre_processors=1 "prevent vim from slowing down vue files.
