set shell=/bin/bash
set nocompatible

" show line numbers
set number

" enable copying to osx
set clipboard=unnamed

" allow mouse
" :set mouse=a

" indentation settings
set expandtab
set shiftwidth=2
set softtabstop=2

" map leaderkey to space
let mapleader = "\<Space>"
"
" reload vim config without leaving vim
nnoremap <leader>rv :source $MYVIMRC<CR>

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

" goto declaration
noremap <leader>j <C-]>

" go back from declaration
noremap <leader>k <C-t>

" faster : typing
noremap , :

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" hide search highlighting
noremap <leader>h :noh<cr>

" window management
" noremap <leader>wj <C-W>h
" noremap <leader>wk <C-W>j
" noremap <leader>wl <C-W>k
" noremap <leader>wö <C-W>l
"
" noremap <leader>wJ <C-W>H
" noremap <leader>wK <C-W>J
" noremap <leader>wL <C-W>K
" noremap <leader>wÖ <C-W>L

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Bling/vim-airline'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
"Plugin 'mileszs/ack.vim'
Plugin 'bbatsov/rubocop'
Plugin 'ngmy/vim-rubocop'
Plugin 'mitsuhiko/flask'

" Rubocop
let g:vimrubocop_config = '~/Projects/mynewsdesk/.rubocop.yml'
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
set ttimeoutlen=50
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let AirlineTheme='solarized'
let &t_Co=256

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
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
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

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
