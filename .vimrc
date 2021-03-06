set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

"General Plugins
Plug 'VundleVim/Vundle.vim'
Plug 'mileszs/ack.vim' "ack search
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'rizzatti/dash.vim'
Plug 'mattn/emmet-vim' "emmet for vim
Plug 'sjl/gundo.vim' "undo tree
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdcommenter' " easy commenting
Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim' 
Plug 'ap/vim-buftabline'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive' " vim git wrapper
Plug 'airblade/vim-gitgutter' "git gutter
Plug 'pangloss/vim-javascript'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-surround' " surround text with quotes
Plug 'christoomey/vim-tmux-navigator'
Plug 'valloric/youcompleteme'
" Front End Specific
Plug 'kchmck/vim-coffee-script'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmhedberg/matchit'
Plug 'quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx'
"Python
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()
"Key Bindings
let mapleader = "," " leader is comma
inoremap jk <esc>
"Undo tree map
nnoremap <F5> :GundoToggle<CR>
"don't skip visual lines when wrapped
nnoremap j gj
nnoremap k gk
"close all open buffers
nnoremap <leader>bda :bufdo bd<CR>
"edit vim, zsh, source vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" leader space removes highlight
nnoremap <leader><space> :nohlsearch<CR>
"open ag.vim
nnoremap <leader>a :Ack
"map jsbeautify
map <c-f> :call JsBeautify()<cr>
"tree mapped to ctrl-n
map <C-n> :NERDTreeToggle<CR>
"you complete me definition jump
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"buffer navigation
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bd :bd<CR>
"Editor Settings
set background=dark "color scheme declarations 23-25
set incsearch  " search as text entered
set hlsearch  " highlight search
set laststatus=2
colorscheme nord
let g:airline_theme = 'nord'
" remap escape key
set number
set relativenumber
" show cursor
set cursorline
" word wrapping
set wrap
set breakindent
set linebreak
set nolist
"git gutter vim updatetime change
set updatetime=250
set autoindent
set smartindent
"set temporary file location
set backup
"tell vim where to put its backup files
set backupdir=/private/tmp
" tell vim where to put swap files
set dir=/private/tmp
" syntax highlighting
syntax on
syntax enable
set hidden " buffers can exist in background
set showmatch " show matching parentheses
"open tree if directory opened
autocmd StdinReadPre * let s:std_in=1
set wildmenu " autocomplete vim commands
set clipboard=unnamed
"Plugin Specific Settings
"remap silver search
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" The Silver Searcher
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep\
  let g:ackprg='rg --vimgrep'
endif"search settings

"javascript libs
let g:used_javascript_libs = 'underscore,angularjs, angularui,angularuirouter,jquery,d3'
"Beautifier mapping
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" for less
autocmd FileType less noremap <buffer> <c-f> :call CSSBeautify()<cr>
"tab options
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"close autocomplete preview window when exit insert mode
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
"backspace issues
set backspace=2
"python location
let g:ycm_collect_identifiers_from_tags_files = 1
" Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string"

"fzf to ctrl p
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

"html highlighting for .template
augroup filetypedetect
    au BufRead,BufNewFile *.template setfiletype html
    " associate *.template with html filetype
augroup END


if has('autocmd')
    autocmd FileType javascript.jsx JsPreTmpl html
    autocmd FileType javascript JsPreTmpl html
endif

"ale dictionary
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python':['flake8']
\}
let g:ale_open_list=1

"Buffer Line

let g:buftabline_numbers = 2
let g:buftabline_indicators=1
let g:buftabline_separators=1

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

"gitgutter grep
let g:gitgutter_grep='rg'

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"

let g:lightline = {
\ 'colorscheme': 'nord',
\ 'tabline': {
\   'left': [['buffers']],
\   'right': [[]]
\ },
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
\   'right': [['linter_checking', 'linter_errors',
\              'linter_warnings']]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\ },
\ 'component_type': {
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }
