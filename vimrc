" Set mapleader
let mapleader = ","
" Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
" Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
" NoHighlight
map <silent> <leader>n :noh<cr>
" Chinese encodingcoding
set encoding=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1
set fileencoding=utf-8

runtime macros/matchit.vim
set guifont=Monaco:h15
set guifontwide=Monaco:h15
colorscheme slate

set undofile
set undodir=~/.undodir
set undolevels=1000
" MRU
let MRU_Max_Entries = 50
map <F1> :MRU <CR>
set number
setlocal noswapfile
" tab
set autoindent        "always set autoindenting on
set smartindent       "set smart indent
set smarttab          "use tabs at the start of a line, spaces elsewhere
set expandtab
set tabstop=4
set shiftwidth=4
set wildmenu
"set foldmethod=indent
set showmatch
set mat=2
set matchpairs+=<:>
" statusline
"set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
let statusHead ="%-.50f\ %h%m%r"
let statusBreakPoint ="%<"
let statusSeparator ="|"
let statusFileType ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii ="\{%b:0x%B\}"
let statusCwd ="%-.50{getcwd()}"
let statusBody =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank ="%="
let statusKeymap ="%k"
let statusRuler ="%-12.(%lL,%c%VC%)\ %P"
let statusTime ="%{strftime(\"%y-%m-%d\",getftime(expand(\"%\")))}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString 
""""""""""""""""""""""""""""""""
filetype plugin indent on
"set ofu=syntaxcomplete#Complete
"set lbr
syntax on
set hlsearch
set ignorecase smartcase incsearch 
set completeopt=longest,menu
set backspace=indent,eol,start
"set clipboard+=unnamed
let do_syntax_sel_menu=1
"set autochdir
set ut=200
" Do not increase the windows width in taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:Tlist_Inc_Winwidth=0
let g:Tlist_Use_Right_Window=1
"let g:Tlist_Auto_Open=1
let g:Tlist_Show_One_File=1
"let g:Tlist_Compact_Format=1
"let g:Tlist_Enable_Fold_Column=0

" Tasklist
let g:tlTokenList = ['TODO' , 'WTF']

" acp.vim
let g:acp_behaviorPythonOmniLength = -1

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
map <F7> :NERDTree<cr>

""""""""""""""""""""""""""""""
" Python
" http://vim.sourceforge.net/scripts/script.php?script_id=850
""""""""""""""""""""""""""""""
autocmd FileType python map <F8> :!python %<CR>
"""""PHP"""""
"autocmd FileType php map <F12> :!php.exe %<CR>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
 
""""""""""""""""""""""""""""""
" mark setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear

""""""""""""""""""""""""""""""""""""""""
" IAB
""""""""""""""""""""""""""""""""""""""""
iab vim: <!-- vim: set fdm=marker sw=4 ts=4 et: -->
iab xda <c-r>=strftime("20%y%m%d %H:%M:%S")<C-I>

""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
