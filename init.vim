call plug#begin('~/.config/nvim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/NERDTree'
Plug 'junegunn/fzf'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax enable

set background=dark
colorscheme gruvbox


""""""
" coc
""""""
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
	\ 'coc-git'
	\ ]

set hidden

set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable " delays and poor user experience.
set updatetime=300
set timeoutlen=200
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



"""" coc-git
nmap gs <Plug>(coc-git-chunkinfo)
nmap gc <Plug>(coc-git-commit)
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>


"""""""""
" airline
"""""""""
let g:airline_powline_fonts = 1
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3v %{strftime("%H:%M")}'

"""""""""
"NERDTree
"""""""""
"autocmd vimenter * NERDTree

"close nerdtree automaticlly when vim closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"shortcut for toggling ctrl+n
map<silent><C-n> :NERDTreeToggle<CR>
map<silent>nf :NERDTreeFind<CR>


let NERDChrismas=1
let NERDTreeChDirMode=1
let NERDTreeDirArrows=0

"show bookmarks
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$','\.pyc$','\.swp$']
let NERDTreeWinSize=45


""""""""""""""""""""
" Rainbow parenthese
""""""""""""""""""""
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

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


"""""""""""""""
"Basic Settings
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
"Add a little margin to the left
set foldcolumn=1
set nofoldenable

" set foldmethod=syntax
set foldmethod=indent

set iskeyword=@,48-57,_,-,192-255

set ch=2

" set width of tabs
set shiftwidth=4
set softtabstop=2
set tabstop=2
set smarttab
set cindent
" always use spaces instead of tabs characters
set expandtab

set linebreak

set wrap

" show the damn hidden characters
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
set nolist

" make nvim background opaque
hi! Normal ctermbg=None guibg=None
hi! NonText ctermbg=None guibg=None guifg=None ctermfg=None



let g:rainbow_active = 1

""""""""""""
" Remapping"
""""""""""""

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap - $


nnoremap <F2> :setlocal paste!<cr>

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

command! Q execute "quit!"
command! W execute "write!"
command! QQ execute "quitall"
nmap <leader>w :w!<cr>

" disappear highlight of searching results 
map <silent> <leader><CR> :noh<CR>
" open a new tab with the current buffer's path
" map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>te :tabedit<cr> 

" change the working directory to the directory of the opening buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


"select all
nnoremap <leader><C-a> ggVG

" jump to start and end of the row using H and L
map H ^
map L $

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" display buffers and switch
nnoremap <leader>l :buffers<CR>:buffer<Space>
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <C-^>

" Close current buffer
map <leader>bd :bd<CR>

" Close all buffers
map <leader>ba :bufdo bd<CR>

" Create an empty buffer
map <leader>n :enew<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch between current tab and the last-active tab
"""""""""""""""""""""""""""""""""""""""""""""""""""" 
if !exists('g:lasttab')
      let g:lasttab = 1
  endif
nmap <Leade * let g:lasttab = tabpagenr()


"""""""""""
" vim-sneak
"""""""""""
let g:sneak#label = 1
