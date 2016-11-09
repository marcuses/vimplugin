" (单"表示注释)
"
"display tabs and trailing spaces

"store lots of :cmdline history
set history=1000

"默认显示行号
set nu

"打开语法高亮
if has("syntax")
	syntax on
endif

"高亮显示搜索到的文本
set hlsearch
"逐字符高亮
set incsearch

"设置查找
"搜索模式忽略大小写
set ignorecase
"如果搜索模式包含大小写则不适用ignorecase
set smartcase

"设置缩进
set tabstop=4
set sts=4
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4
" Set tab and space visible
set list
set listchars=tab:>-,trail:-

"自动保存
set autowrite

"开启折叠，并设置空格来开关折叠
set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
"set foldclose=all
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=============================主题风格配色======================================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"颜色配置
"https://github.com/tomasr/molokai
"https://github.com/altercation/vim-colors-solarized
colorscheme molokai   "(选择颜色主题为 molokai , 就是 ~/.vim/colors/molokai.vim文件)
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256 "(设置终端支持的颜色是256颜色，这句特别重要，谨记)
"syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
"syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
"hi cFunction ctermfg=118

"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"

"set background=dark
"set t_Co=256
"colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""" End """""""""""""""""""""""""""""""""""""""""""""""


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

"文件浏览插件
Plugin 'scrooloose/nerdtree'

"语法高亮插件
Plugin 'vim-syntastic/syntastic'

"主题配色
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=========================自动补全提示的插件相关配置==========================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe配置
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/config/.ycm_extra_conf.py'

"""""""""""""""""""""""""""""""""""""""""" End """""""""""""""""""""""""""""""""""""""""""""""

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
"""""""""""""""""""""""""""""""""""""""""" End """""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=========================NERD Tree 相关配置==================================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
"Then reload vim, run :helptags ~/.vim/bundle/nerdtree/doc/, and check out :help NERD_tree.txt.
"http://www.jianshu.com/p/eXMxGx
"进入vim时默认打开NERDTree
"autocmd vimenter * NERDTree
"NERDTree显示和隐藏快捷键
map <F2> :NERDTreeToggle<CR>
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"""""""""""""""""""""""""""""""""""NERD Tree End""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=========================  syntastic 语法高亮配置============================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""""""""""""""""""""""""""""""""""""""""" End """""""""""""""""""""""""""""""""""""""""""""""
