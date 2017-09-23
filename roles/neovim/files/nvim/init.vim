"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'fleischie/vim-styled-components'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'

Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'

Plug 'airblade/vim-gitgutter'


" Completion manager
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-github'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ervandew/supertab'
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'

Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'

Plug 'christoomey/vim-tmux-navigator'

" Only for the transition.
Plug 'majutsushi/tagbar'

" Productivity
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'itspriddle/vim-marked'
Plug 'reedes/vim-pencil'

" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
" set autoindent
" set smartindent

" CSS / SASS
autocmd FileType css,sass,scss,html,blade set sw=2
autocmd FileType css,sass,scss,html,blade set ts=2
autocmd FileType css,sass,scss,html,blade set sts=2

" JavaScript
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin
" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END

" PHP
autocmd FileType php set sw=4
autocmd FileType php set ts=4
autocmd FileType php set sts=4

" Line length.
" set colorcolumn=80
set nowrap

" Line numbers
set number
" set relativenumber

" Whitespace
set listchars=tab:▸\ ,trail:·
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '>'
hi! link ALEErrorSign GruvboxRed
hi! link ALEWarningSign GruvboxYellow

let g:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'jsx': ['stylelint', 'eslint'],
        \ 'php': ['phpcs'],
    \ }
let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_fixers = {}
let g:ale_fixers = {
        \ 'javascript': ['eslint'],
        \ 'php': ['phpcbf'],
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
command! -bang -nargs=* Fzf call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#enable_at_startup = 1
" " Why does <tab> navigate the completion menu from bottom to top?
" let g:SuperTabDefaultCompletionType = "<c-n>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-completion-manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" smart tab for auto complete
inoremap <expr> <silent> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <silent> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" optional
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
"     \ }

" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  
  " Statusline
  hi StatusLine guibg=NONE gui=NONE
  hi StatusLineNC guibg=NONE gui=NONE
  set statusline=%=%f

  " General colors
  hi vertsplit guifg='#3c3836' guibg='#282828'
  hi LineNr guifg='#3c3836'

  " GitGutter
  set signcolumn=yes
  hi clear SignColumn
  hi! link GitGutterAdd GruvboxGreen
  hi! link GitGutterChange GruvboxAqua
  hi! link GitGutterDelete GruvboxRed
  hi! link GitGutterChangeDelete GruvboxAqua

  " Remove ~ from empty lines.
  hi NonText guifg=bg
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

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
" Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>

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

" Quit file
noremap <leader>q :q<cr>

" Save file.
noremap <leader>s :w<cr>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" Goyo (Focus / Fullscreen)
map <Leader>f :Goyo<cr>

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

" Statusline
" hi StatusLine guibg=NONE gui=NONE
" hi StatusLineNC guibg=NONE gui=NONE
" set statusline=%=%f

" General colors
hi vertsplit guifg='#3c3836' guibg='#282828'
hi LineNr guifg='#3c3836'

" Airline
let g:airline_powerline_fonts = 1

" GitGutter
set signcolumn=yes
hi clear SignColumn
hi! link GitGutterAdd GruvboxGreen
hi! link GitGutterChange GruvboxAqua
hi! link GitGutterDelete GruvboxRed
hi! link GitGutterChangeDelete GruvboxAqua

" Remove ~ from empty lines.
hi NonText guifg=bg
