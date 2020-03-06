"""""""""""""""
"Basi Settings
""""""""""""""""
set history=500

filetype plugin on
filetype indent on

set autoread

set ruler

set nu
set rnu

filetype on

set cmdheight=1

set hid

set backspace=eol,start,indent

set whichwrap+=<,>,h,l

set ignorecase

set smartcase

set hlsearch

set magic

set showmatch

set mat=2

set mouse=a

set confirm

set cursorline

set scrolloff=5

set encoding=UTF-8
set nolist
set listchars=tab:>-,trail:-
"Add a little margin to the left
set foldcolumn=1
set nofoldenable

" set foldmethod=syntax
set foldmethod=indent

set iskeyword=@,48-57,_,-,192-255

set ch=2
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"""""""
"Plugin
"""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ycm-core/YouCompleteMe'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/NERDTree'
Plugin 'junegunn/fzf'
Plugin 'preservim/nerdcommenter'
Plugin 'rust-lang/rust.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'flazz/vim-colorschemes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'itchyny/lightline.vim'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_min_num_of_chars_for_completetion = 2
"let g:ycm_key_invoke_completion = ['<C-Space>']
"let g:ycm_key_list_stop_completion = ['<C-y>']




call vundle#end()
filetype plugin indent on

""""""""""""
" Lightline
""""""""""""
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
      \ 'active': {
      \   'right': [['clock'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
      \  },
      \  'component': {
      \    'clock': '%{strftime("%H:%M")}'
      \  },
      \ }

"""""""""""""""""""""""""
" CPP syntax highlighting
"""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1

let g:cpp_member_variable_highlight = 1

let g:cpp_class_decl_highlight = 1

let g:cpp_concepts_highlight = 1

"""""""""
"NERDTree
"""""""""
"autocmd vimenter * NERDTree

"close nerdtree automaticlly when vim closes
autocmd bufenter * if(winnr("$")==1&&exists("b:NERDTreeType")&&b:NERDTreeType=="primary")|q|endif


"shortcut for toggling ctrl+n
map<silent><C-n> :NERDTreeToggle<CR>


let NERDChrismas=1
let NERDTreeChDirMode=1
let NERDTreeDirArrows=0

"show bookmarks
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$','\.pyc$','\.swp$']
let NERDTreeWinSize=25

""""""""""""
" VCSCommand
""""""""""""

nmap <leader>cll <Plug>VCSLog
nmap <leader>css <Plug>VCSStatus
nmap <leader>cuu <Plug>VCSUpdate
nmap <leader>caa <Plug>VCSAnnotate

"""""""""""""""
" NERDCommenter
"""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


"""""
"Fzf"
"""""
set rtp+=~/.fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['188','fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


map <Space> <Leader>
map <leader><cr> :noh<cr>
nmap <C-p> :FZF<CR>

"""""""
"Color"
"""""""

syntax enable

set background=dark

colorscheme molokai
hi CursorLine cterm=None ctermbg=brown 
hi Visual cterm=None ctermbg=brown 

""""""""""""""""""""""""""
"Files, backups and undos"
""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
"Text, tab and indent related"
""""""""""""""""""""""""""""""

set smarttab

set shiftwidth=4
set tabstop=4

set lbr
set tw=500

"auto indent
set ai
"smrat indent
 set si
"set ci
"wrap lines
set wrap
set showcmd

"""""""""""""
"Status line"
"""""""""""""
set laststatus=2

""""""
"Json"
""""""

autocmd	FileType json call s:json()

function! s:json()
    %!python -m json.tool
endfunction	

""""""""""""
"Javascript"
""""""""""""

" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" au FileType javascript setl nocindent
"
" function! JavaScriptFold()
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=\{\ end=\}\ transparent fold keepend extend
"
"     function! FoldText()
"         return substitute(getline(v:foldstart),'{.*','{...}','')
"     endfunction
"     setl foldtext=FoldText()
" endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch between current tab and the last-active tab
"""""""""""""""""""""""""""""""""""""""""""""""""""" 
if !exists('g:lasttab')
      let g:lasttab = 1
  endif
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

""""""""""""
" Remapping"
""""""""""""

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l


function TogglePaste()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunction
nnoremap <F2> :call TogglePaste()<cr>

imap jk <Esc>
imap kj <Esc>
map j gj
map k gk

" fix home/end keys in all mdoes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

command Q execute "quit!"
command W execute "write!"
command QQ execute "quitall"
nmap <leader>w :w!<cr>
