" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Bundle 'edkolev/promptline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" Autoreload .vimrc on change.
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"" Theme
" https://github.com/Lokaltog/powerline/blob/develop/docs/source/installation/troubleshooting-common.rst#my-vim-statusline-is-hiddenonly-appears-in-split-windows
set t_Co=256
set laststatus=2
syntax enable
set background=dark
colorscheme solarized

set hidden
set title
set scrolloff=3

set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Backups and recovery
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"" Keyboard overrides
inoremap jj <ESC>

"" Movement 
nnoremap j gj
nnoremap k gk

"" Plugins

"" CoffeeScript
autocmd FileType litcoffee runtime ftplugin/coffee.vim

"" NERDTree
let g:NERDTreeShowHidden=1

"" Airline
set ttimeoutlen=50  " Fix ESC key delay.
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"" Promptline
" To generate prompt script in the right location, run:
" :PromptlineSnapshot ~/.zsh/promptline-prompt.sh 
let g:promptline_preset = {
        \'a' : [ '$vim_mode' ],
        \'b' : [ promptline#slices#user(), promptline#slices#host() ],
        \'c' : [ promptline#slices#cwd() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'y': [ promptline#slices#vcs_branch(), promptline#slices#git_status(), promptline#slices#jobs() ]
        \}

"" tmuxline.vim
" To generate prompt script in the right location, run:
" :Tmuxline airline
" :TmuxlineSnapshot ~/.tmux/tmuxline-statusline

