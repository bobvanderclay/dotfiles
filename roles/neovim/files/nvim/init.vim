"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'fleischie/vim-styled-components'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-obsession'

Plug 'machakann/vim-sandwich'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
" Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'
Plug 'matze/vim-move'
Plug 'christoomey/vim-tmux-navigator'

Plug 'airblade/vim-gitgutter'

Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

" Completion manager / Linting / Fixing
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-github'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'ervandew/supertab'
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'w0rp/ale'

" Only for the transition.
Plug 'majutsushi/tagbar'
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Productivity
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
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI=1

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
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-completion-manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" smart tab for auto complete
inoremap <expr> <silent> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <silent> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let g:ultisnipsexpandtrigger		= "<C-U>"
let g:ultisnipsjumpforwardtrigger	= "<c-j>"
let g:ultisnipsjumpbackwardtrigger	= "<c-k>"
let g:ultisnipsremoveselectmodemappings = 0
" optional
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
map <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = {
    " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    " \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    " \ }

" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yggdroot/indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '⎸'
let g:indentLine_color_gui = '#3c3836'
let g:indentLine_bgcolor_gui = '#282828'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-abolish
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" See nvim/after/plugin/abolish 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haya14busa/incsearch.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" alvan/vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.

let g:closetag_filenames = '*.html,*.htm,*.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  silent ALEDisable
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  silent ALEEnable
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

" Zoom (make current vim zoomed in tmux, respace windows)
noremap <silent> <Leader>z :silent :!tmux resize-pane -Z<cr><c-w>=

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
set noshowmode
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
