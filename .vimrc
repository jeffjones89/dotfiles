set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" General Utilities
Plugin 'VundleVim/Vundle.vim'
"Plugins
Plugin 'mileszs/ack.vim' "ack search
"Plugin 'jiangmiao/auto-pairs'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rizzatti/dash.vim'
Plugin 'mattn/emmet-vim' "emmet for vim
Plugin 'sjl/gundo.vim' "undo tree
Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdcommenter' " easy commenting
Plugin 'scrooloose/nerdtree'
Plugin 'arcticicestudio/nord-vim' 
Plugin 'scrooloose/syntastic'	" linter
Plugin 'vim-airline/vim-airline' "status bar
Plugin 'vim-airline/vim-airline-themes' " airline-themes
Plugin 'flazz/vim-colorschemes' " colorscheme package
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive' " vim git wrapper
Plugin 'airblade/vim-gitgutter' "git gutter
Plugin 'tpope/vim-surround' " surround text with quotes
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'valloric/youcompleteme'
" Front End Specific
Plugin 'kchmck/vim-coffee-script'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'matchit.zip' "match html tags
Plugin 'quramy/tsuquyomi'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less' "less indentation
Plugin 'marijnh/tern_for_vim'
"Python
Plugin 'Vimjas/vim-python-pep8-indent'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
colorscheme nord
let g:airline_theme = 'nord'
" remap escape key
set number
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
set laststatus=2 " airline by default
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
  " Use ag over grep
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
" tell syntastic to ignore proprierty attributes i.e. ng-model
let g:syntastic_html_tidy_ignore_errors=[
    \'proprietary attribute "ng-',
    \'proprietary attribute "uib-',
    \'proprietary attribute "tooltip-'
\]
let g:syntastic_javascript_checkers  = ['eslint']
let g:syntastic_python_checkers = ['flake8']
" close syntastic window 
nnoremap <leader>lc :lclose<CR>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"enable tab line in airline
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
"close autocomplete preview window when exit insert mode
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
"backspace issues
set backspace=2
"typescript indentation
let g:typescript_indent_disable=1
"python location
let g:ycm_python_binary_path = 'python3'
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
