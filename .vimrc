
""""""""""""""""""""""""""""""
" Vundle setting
""""""""""""""""""""""""""""""
set nocompatible        " be iMproved
set backspace=indent,eol,start
filetype off            " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" 可以通过以下四种方式指定插件的来源
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
"Bundle 'L9'
Bundle 'taglist.vim'
Bundle 'winmanager'

" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'vim-airline/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'


" c) 指定非Github的Git仓库的插件，需要使用git地址
"Bundle 'git://git.wincent.com/command-t.git'

" d) 指定本地Git仓库中的插件
"Bundle 'file:///Users/gmarik/path/to/plugin'

filetype plugin indent on     " required!



""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
nnoremap <F5> :TlistToggle<CR>
let Tlist_Show_One_File=1      "只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1    "tagList窗口是最后一个窗口，则退出Vim

nmap , 
nmap . 



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

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap k g
nmap l c
nmap ; s
nmap / *



""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:AutoOpenWinManager = 1
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth = 30
nmap <F6> :WMToggle<CR>
nmap <F2> :Explore<CR>


""""""""""""""""""""""""""""""
" nerdtree setting
""""""""""""""""""""""""""""""
let g:NERDTree_title = "[NERDTree]"
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=1 " 改变tree目录的同时改变工程的目录
function! NERDTree_Start()
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction


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
" \cc 注释当前行和选中行
" \cu 取消注释
" \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
" \cA 跳转到该行结尾添加注释，并进入编辑模式
" \cs 添加性感的注释，代码开头介绍部分通常使用该注释
""""""""""""""""""""""""""""""
nmap  <leader>ci


""""""""""""""""""""""""""""""
" supertab setting
""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-8>"

"add by qv
syntax enable                   "语法高亮
set autoindent                  "自动缩进与C语言风格缩进
set cindent                     "以C/C++的模式缩进
set hlsearch                    "搜索高亮
set tabstop=4                   "设定 tab 长度为 4
set softtabstop=4               "使得按退格键时可以一次删掉 4 个空格,不足 4 个时删掉所有剩下的空格）
set shiftwidth=4                "设定 << 和 >> 命令移动时的宽度为 4
set nu                          "显示行号
set cursorline                  "突出显示当前行
let &termencoding=&encoding     "显示中文
set fileencodings=utf-8,gbk
set expandtab                   "建议开启expandtab选项，会自动将tab扩展很空格，代码缩进会更美观
"set noexpandtab
set cino=g0,:0                  "switch case 对齐风格
set mouse=n                     "普通模式使用鼠标

colorscheme molokai             "主题配色
set t_Co=256

" diff color
if &diff
    colorscheme evening
    set noreadonly
endif

" KEY MAP
nmap <F4> :set nonu<CR>
nmap [26~ :set nu<CR>

nnoremap <F7> :q<CR>
nnoremap <F8> :w<CR>

nmap <F11> 
nmap <F12> 


