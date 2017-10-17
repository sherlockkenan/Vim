"  keke vim config

"============================ vundle =============================================
" {

set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
"General {
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'majutsushi/tagbar'
"}
"theme {
    Plugin 'altercation/vim-colors-solarized'
"}


" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

" }


" ======================== General =====================================
" {

"设置leader键
let mapleader = ","

filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse-=a                 "禁用鼠标点击进入vasual模式
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
" 鼠标选择复制（securecrt）
set mouse=v
"打开文件光标在上次关闭的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on

"the ctag
set tags=./tags;/
" }



" ======================== Vim UI ======================================
" {

"主题
if( filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim")))
    set background=dark
    colorscheme solarized             " Load a colorscheme

endif


set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"}




" ========================== Formatting ==================================
" {

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F10>           " pastetoggle (sane indentation on pastes)

" }


" ========================== Plugin setting ==================================
" {
"=========nerdtree======================
"剩下nerdtree 时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"打开文件夹时打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"nerdtree
map <C-e> :NERDTreeToggle<CR>


"===============Ctrlp=================

let g:ctrlp_map =  '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <F2> : CtrlP<Space>
map <c-d> : CtrlPBuffer<CR>



"=========YouCompleteMe ===============
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1 

let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnipslet 
let g:iycm_collect_identifiers_from_comments_and_strings = 1

"开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR> " 跳转到定义处, 分屏打开 "引入，可以补全系统，以及python的第三方包
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"



"==========airline======================
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'

" ============tagbar ==================
nnoremap <silent> <leader>tt :TagbarToggle<CR>
nnoremap <F9> : TagbarToggle<CR>
" }




" ========================== Key Binding ==================================
" {



" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

imap jj <ESC>
"输入模式的上下左右
inoremap  <C-h> <Left>
inoremap  <C-j> <Down>
inoremap  <C-k> <Up>
inoremap  <C-l> <Right>


"不同输入框切换
noremap <C-J> <C-W>j<C-W>_
noremap <C-K> <C-W>k<C-W>_
noremap <C-L> <C-W>l<C-W>_
noremap <C-H> <C-W>h<C-W>_

"保存退出键设置
nmap <Leader>w :w!<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>q :q<CR>

"设置buffer的快捷键
nmap <leader>n :bn!<CR>
nmap <leader>b :bp!<CR>
nmap <leader>d :bd<CR>

"normal 模式下命令的输入
nmap <C-;> :<Space>
nmap <C-1> :!<Space>
" }


