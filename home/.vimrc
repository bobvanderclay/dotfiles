set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
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
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

set encoding=utf-8                    " In case $LANG doesn't have a sensible value.

" Colors
syntax on                             " Syntax highlighting.
set background=dark                   " Inquiring plugins want to know.
colorscheme takitapart                " Default colorscheme.
set t_Co=256                          " Convince Vim it can use 256 colors inside Gnome Terminal.

set backspace=indent,eol,start        " Allow backspacing over everything in insert mode.
set fillchars=vert:\                  " No pipes in vertical split separators.
set laststatus=2                      " Always show status bar.
set listchars=nbsp:·,tab:▸\ ,trail:·  " Configure how invisibles appear.
set list!                             " Show invisibles.
set modelines=1                       " Use modeline overrides.
set nojoinspaces                      " 1 space, not 2, when joining sentences.
set number                            " Show gutter with line numbers.
set ruler                             " Show line, column and scroll info in status line.
set scrolljump=5                      " lines to scroll when cursor leaves screen
set scrolloff=3                       " Minimum number of lines to always show above/below the caret.
set showcmd                           " Show partially typed command sequences.
set showmode                          " Display the mode you're in.
set visualbell                        " Don't beep.
set wildmenu                          " show list instead of just completing
set wildmode=list:longest,full        " command <Tab> completion, list matches, then longest common part, then all.

" Indentation & Formatting
set expandtab                         " Replace tabs with spaces.
set shiftwidth=4                      " Spaces used for autoindent and commands like >>.
set softtabstop=4                     " Spaces inserted by <Tab>
set tabstop=4                         " Global tab width.
set smarttab                          " Uses shiftwidth instead of tabstop at start of lines
set autoindent                        " Does nothing more than copy the indentation from the previous line
set smartindent                       " Automatically inserts one extra level of indentation in some cases, and works for C-like files
set nowrap                            " No wrapping.

" Folding
set nofoldenable                      " dont fold by default

" Searching.
set gdefault                          " Global search by default (/g turns it off).
set hlsearch                          " Highlight results.
set incsearch                         " Search-as-you-type.
set ignorecase                        " Case-insensitive…
set smartcase                         " …unless phrase includes uppercase.

" Hide away backup and swap files. Or just don't use them.
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup
set nobackup
set noswapfile

" Reload file without prompting if it has changed on disk.
" Will still prompt if there is unsaved text in the buffer.
set autoread
" MacVim checks for autoread when it gains focus; terminal Vim
" must trigger checks. Do so when switching buffers, or after
" 2 secs (the value of updatetime) of pressing nothing.
set updatetime=2000
au WinEnter,BufWinEnter,CursorHold * checktime

" Automatically save changes before switching buffer with some
" commands, like :cnfile (mapped to g+) etc.
set autowrite

set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title

set showmatch                     " Highlights the matching braces|brackets|parenthesis when the cursor is on a bracket
set matchtime=3                   " Showmatch for 3 milliseconds

set magic                         " Allows pattern matching with special characters

set history=1000                  " Keeps a thousand lines of history
set ofu=syntaxcomplete#Complete   " To turn on omnicompletion

" Keys and mapping
" change the mapleader from \ to ,
let mapleader=","
inoremap jj <Esc>

