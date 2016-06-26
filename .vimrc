set shell=/bin/bash
set nocompatible

" show line numbers
set number
set numberwidth=5

" enable copying to osx
set clipboard=unnamed

" allow mouse
" :set mouse=a

" indentation settings
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround

" open new split panes to the right and bottom
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use one space, not two, after punctuation.
set nojoinspaces

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" map leaderkey to space
let mapleader = "\<Space>"

" switch between the last two files
nmap <leader><leader> <c-^>

" rails bindings
nmap <leader>rm :Rmodel
nmap <leader>rg :e Gemfile
" nmap <leader>

" buffer bindings
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bd :bd<cr>

" reload vim config without leaving vim
nnoremap <leader>vr :source $MYVIMRC<CR>

" map leader-d to goto definition
nmap <leader>d <C-]>

" go back
nmap <leader>o <C-o>

" map leader-f to recently opened files
map <leader>f :MRU<CR>

" save file with leader w
noremap <leader>c :close<cr>
noremap <leader>w :close<cr>

" quit
noremap <leader>q :wq<cr>

" leaderkey w/s to save # <cr> ist enter
noremap <leader>w :w<cr>
noremap <leader>s :w<cr>

" toggle nerd tree
noremap <leader>t :NERDTreeToggle<cr>

" find current file in tree
noremap <leader>a :NERDTreeFind<cr>

" run ruby code in buffer
nmap <leader>rr :w<cr>:!ruby %<cr>

" Rubocop
let g:vimrubocop_config = '~/Projects/mynewsdesk/.rubocop.yml'
let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop<CR>

" goto declaration
noremap <leader>j <C-]>

" go back from declaration
noremap <leader>k <C-t>

" faster : typing
noremap , :

" Go to tab by number
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 :tablast<cr>
nmap <leader>h :noh<cr> " hide search highlighting
nnoremap <C-c> :noh<return><esc> " hide search highlight when pressing esc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/mru.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'bbatsov/rubocop'
Plugin 'ngmy/vim-rubocop'
Plugin 'mitsuhiko/flask'
Plugin 'tpope/vim-eunuch' " remove, rename etc
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'junegunn/gv.vim'

" ctags plugin
Plugin 'craigemery/vim-autotag'

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
set ttimeoutlen=50
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let AirlineTheme='solarized'
let g:solarized_termcolors=256
let &t_Co=256 "fix airline background colors

" Vim colors
" syntax enable
" set background=dark
" colorscheme solarized

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}:@
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set nowritebackup
set autowrite
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set wildmenu
filetype indent on

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>
