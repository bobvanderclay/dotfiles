"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'airblade/vim-gitgutter'

Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

Plug 'neomake/neomake'

Plug 'christoomey/vim-tmux-navigator'

Plug 'matze/vim-move'

" Only for the transition.
Plug 'majutsushi/tagbar'


" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_javascript_enabled_makers = ['eslint']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf / rg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse dragging splits
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" OS X clipboard.
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
" CSS 
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
" JavaScript 
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

" Line length.
set colorcolumn=80
set nowrap

" Line numbers
set number
set relativenumber

" Whitespace
set listchars=tab:▸\ ,trail:·
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <esc>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Space> <Leader>

" select all text in buffer
map <Leader>a ggVG


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Truecolor
if has("termguicolors")
set termguicolors
endif

" Theme
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" Airline
let g:airline_powerline_fonts = 1
