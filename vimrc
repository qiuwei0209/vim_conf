"""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'

Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/winmanager'
Plug 'preservim/nerdtree'

Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vim-which-key'
Plug 'ervandew/supertab'

"Plug 'vim-scripts/cscope.vim'

call plug#end()



""""""""""""""""""""""""""""""
"" myself setting
""""""""""""""""""""""""""""""
filetype plugin on
syntax enable                   " 语法高亮
colorscheme molokai             " 主题配色
set hlsearch                    " 搜索高亮
set autoindent                  " 自动缩进与C语言风格缩进
set cindent                     " 以C/C++的模式缩进
set tabstop=4                   " 设定 tab 长度为 4
set softtabstop=4               " 使得按退格键时可以一次删掉 4 个空格,不足 4 个时删掉所有剩下的空格
set shiftwidth=4                " 设定 << 和 >> 命令移动时的宽度为 4
set nu                          " 显示行号
set cursorline                  " 突出显示当前行
set expandtab                   " 建议开启expandtab选项，会自动将tab扩展很空格，代码缩进会更美观
"set noexpandtab
set cino=g0,:0                  " switch case 对齐风格
set mouse=n                     " 普通模式使用鼠标
let &termencoding=&encoding     " 显示中文
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set nocompatible                " 修复backspace无效问题
set backspace=indent,eol,start
set timeoutlen=500
set t_Co=256

"diff color
if &diff
    colorscheme evening
    set noreadonly
endif

"KEY MAP
nnoremap <F7> :q<CR>
nnoremap <F8> :w<CR>

nnoremap <F11> 
nnoremap <F12> 




""""""""""""""""""""""""""""""
"" vim-which-key setting
""""""""""""""""""""""""""""""
let g:mapleader="\<Space>"
let g:maplocalleader = ","

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:qv_map")

let g:qv_map = {}
let g:qv_map.s = {
      \ 'name'  : '+source' ,
      \ '<Tab>' : ['WMToggle'  , 'Tree-Window']       ,
      \ }



let g:which_key_map = {}

let g:which_key_map.f = {
    \ 'name' : '+File',
    \ 'f' : [':q!'    ,  'Force Quit']      ,
    \ 'q' : [':q'     ,  'Quit']            ,
    \ 's' : [':wq'    ,  'Save Quit']       ,
    \ 'w' : [':w'     ,  'Save']            ,
    \ }

let g:which_key_map.w = {
    \ 'name'  : '+Window' ,
    \ 'w' : ['WMToggle'         ,  'Winmanager']            ,
    \ 'n' : ['NERDTreeToggle'   ,  'Nerdtree']              ,
    \ 't' : ['TlistToggle'      ,  'Tlist']           ,
    \ 'e' : ['Explore'          ,  'Explore']               ,
    \ '2' : ['<C-W>v'           ,  'split-window']    ,
    \ }



""""""""""""""""""""""""""""""
"" molokai setting
""""""""""""""""""""""""""""""
let g:molokai_original=1
let g:rehash256=1


""""""""""""""""""""""""""""""
" cscope setting
""""""""""""""""""""""""""""""
if has("cscope")
set csprg=/usr/bin/cscope
set csto=1
set cst
set nocsverb

if filereadable("cscope.out")
cs add cscope.out
elseif $CSCOPE_DB  != ""
cs add $CSCOPE_DB
endif
set csverb
endif

nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nnoremap k g
nnoremap l c
nnoremap ; s
nnoremap / *


""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1      "只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1    "tagList窗口是最后一个窗口，则退出Vim

nnoremap [[E :TlistToggle<CR>
nnoremap , 
nnoremap . 


""""""""""""""""""""""""""""""
" nerdtree setting
" https://github.com/preservim/nerdtree
""""""""""""""""""""""""""""""
let g:NERDTree_title = "[NERDTree]"
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=1 " 改变tree目录的同时改变工程的目录
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTree_Start()
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:AutoOpenWinManager = 1
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth = 30
nnoremap <F6> :WMToggle<CR>


""""""""""""""""""""""""""""""
" vim-airline setting
""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <F9> :bp<CR>
nnoremap <F10> :bn<CR>


""""""""""""""""""""""""""""""
" nerdcommenter setting
" https://github.com/preservim/nerdcommenter
""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }
nmap  <leader>c<space>


""""""""""""""""""""""""""""""
" supertab setting
""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-8>"


""""""""""""""""""""""""""""""
" rainbow setting
" https://github.com/luochen1990/rainbow
""""""""""""""""""""""""""""""
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


""""""""""""""""""""""""""""""
" vim-easy-align setting
" https://github.com/junegunn/vim-easy-align
""""""""""""""""""""""""""""""
