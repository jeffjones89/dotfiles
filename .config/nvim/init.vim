set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged')

"General Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter' "git gutter
Plug 'ap/vim-buftabline'
Plug 'arcticicestudio/nord-vim' 
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'mattn/emmet-vim' "emmet for vim
Plug 'maximbaz/lightline-ale'
Plug 'mileszs/ack.vim' "ack search
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter' " easy commenting
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo' "undo tree
Plug 'tpope/vim-fugitive' " vim git wrapper
Plug 'tpope/vim-surround' " surround text with quotes
Plug 'w0rp/ale'
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
" 
"Use Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"Key Bindings
let mapleader = "," " leader is comma
inoremap jk <esc>
"Undo tree map
nnoremap <F5> :MundoToggle<CR>
"close quick list
nnoremap <leader>lc :ccl<CR>
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

"backspace issues
set backspace=indent,eol,start
"NERD Commenter add spaces
let g:NERDSpaceDelims = 1

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
\    'jsx': ['stylelint', 'eslint'],
\   'python':['flake8']
\}
let g:ale_patter_options ={
\   '.*.spec.js': {'ale_enabled': 0},
\}

let g:ale_linter_aliases = {'jsx': 'css'}

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:ale_open_list=1
nmap <silent> <C-9> <Plug>(ale_previous_wrap)
nmap <silent> <C-0> <Plug>(ale_next_wrap)
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
\   'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\   'lightline_ok': 'left',
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }
