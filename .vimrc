""""""""""""""""
"Basic Settings"
""""""""""""""""
set history=500

filetype plugin on
filetype indent on

set autoread

set ruler

set nu

filetype on

set cmdheight=2

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

"Add a little margin to the left
set foldcolumn=1

"""""""
"Color"
"""""""

syntax enable

set background=dark

colorscheme desert

""""""""""""""""""""""""""
"Files, backups and undos"
""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
"Text, tab and indent related"
""""""""""""""""""""""""""""""
"set smarttab

"set shiftwidth=4
set tabstop=4

set lbr
set tw=500

"auto indent
set ai
"smrat indent
set si
"wrap lines
set wrap


"""""""""""""
"Status line"
"""""""""""""
set laststatus=2

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


function! HasPaste()
    if &paste
        return 'PASTE MODE '
    endif
    return ''
endfunction

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

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=\{\ end=\}\ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart),'{.*','{...}','')
    endfunction
    setl foldtext=FoldText()
endfunction


