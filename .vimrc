
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
 " set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

syntax enable

set background=dark

colorscheme solarized 


  
   set nu
   syntax on
   set ruler
   set backspace=2
   set mouse=nv
   set smartindent
   " colorscheme industry
   set ignorecase
   
   "tab
   set ts=4
   set expandtab
   set softtabstop=4
   set shiftwidth=4


   set nocompatible              " 去除VI一致性,必须
   filetype off                  " 必须

   "用浅色高亮当前行
   set cursorline
   set guifont =monaco\ 18



   " 设置包括vundle和初始化相关的runtime path
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " 另一种选择, 指定一个vundle安装插件的路径
   "call vundle#begin('~/some/path/here')

   " 让vundle管理插件版本,必须
   Plugin 'VundleVim/Vundle.vim'

   " 以下范例用来支持不同格式的插件安装.
   " 请将安装插件的命令放在vundle#begin和vundle#end之间.
   " Github上的插件
   " 格式为 Plugin '用户名/插件仓库名'
   "
   
Plugin 'scrooloose/nerdtree'
"Plugin 'Lokaltog/vim-powerline'
  Plugin 'Yggdroot/indentLine' 
"Plugin 'Valloric/YouCompleteMe'   
Plugin 'itchyny/lightline.vim'
  Plugin 'maralla/completor.vim'
Plugin 'vim-scripts/indentpython.vim' 
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
  
  
  
  "
  
 "python配置
  

"C,C++,java,python 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        "exec "!time python2.7 %"
        exec "!time python3.6 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc


"括号p补全
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i





"nerdtree
""开关NERDTree的快捷键
map <F2> :NERDTreeToggle<CR>

""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=2
""打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree
"
"
"

" let g:lightline = {
"     \ 'colorscheme': 'powerline',
"    \ 'active': {
"     \   'left': [ [ 'mode', 'paste' ],
"     \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'helloworld' ] ],
"     \   'right': [ [ 'lineinfo' ],
"     \              [ 'percent' ],
"      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
"     \ },
"     \ 'component': {
"     \   'helloworld': 'Hello, lly!'
"     \ },
"     \ 'component_function': {
"     \   'gitbranch': 'fugitive#head'
"     \ },
"     \ }

