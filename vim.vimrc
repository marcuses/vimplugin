" (单"表示注释)
"


"默认显示行号
set nu

"打开语法高亮
syntax on

"Tab大小
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==============================Bundle vim插件管理插件===========================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"括号匹配插件
Plugin 'Raimondi/delimitMate'

"自动补全插件
Plugin 'Valloric/YouCompleteMe'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe配置
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/config/.ycm_extra_conf.py'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=========================编译，运行，调试相关================================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
     exec "w"
     if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
     elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
     elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
     elseif &filetype == 'sh'
          :!./%
     elseif &filetype == 'py'
        exec "!python %"
        exec "!python %<"
     endif
endfunc

map <F9> :call Rungdb()<CR>
func! Rungdb()
   exec "w"
   if &filetype == 'c'
     exec "!g++ % -g -o %<"
   exec "!gdb ./%<"
elseif &filetype == 'cpp'
   exec "!g++ % -g -o %<"
   exec "!gdb ./%<"
endfunc

