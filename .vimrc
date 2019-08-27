iabbrev @@ wang2011yiwei@sina.com
iabbrev ccopy Copyright 2019 Ev,all rights reserved.
let mapleader=','
nnoremap <leader>" ve<ESC>i"<ESC>hbi"<ESC>lel
nnoremap <leader>w <c-w>w
function! CommitCode(char)
	exec "normal! ^"
	let l:line = getline(".")
	let l:col = col(".")
	if a:char == '//'
		if l:line[l:col-1] == l:line[l:col] && l:line[l:col] == '/'
			exec "normal! xx"
		else
			exec "normal! i//"
		endif
	else
		if l:line[l:col-1] == a:char
			exec "normal! x"
		else
			exec "normal! i".a:char
		endif
	endif
endf
nnoremap <leader>c <ESC>:call CommitCode("//")<CR>
autocmd FileType javascript,c,c++ nnoremap <leader>c <ESC>:call CommitCode("//") <CR>
autocmd FileType python,sh,cmake nnoremap <leader>c <ESC>:call CommitCode("#") <CR>
autocmd FileType vim nnoremap <leader>c <ESC>:call CommitCode('"') <CR>
""colorscheme torte
""colorscheme murphy
"colorscheme deset1 
colorscheme desert 
""colorscheme elflord
"colorscheme ron
""colorscheme morning
""colorscheme slate
""colorscheme pablo
""colorscheme default
""colorscheme shine

"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set go=             " 不要图形按钮  
"color asmanian2     " 设置背景主题  
"set guifont=Courier_New:h10:cANSI   " 设置字体  
"syntax on           " 语法高亮  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
"set background=dark "背景使用黑色 
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 设置配色方案
"colorscheme murphy
"字体 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
	
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: Ev") 
		call append(line(".")+2, "\# mail: wang2011yiwei@sina.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	elseif &filetype == 'python'
		call setline(1,"# -*- coding:UTF-8 -*-") 
		call append(line("."), "\#########################################################################") 
		call append(line(".")+1, "\# File Name: ".expand("%")) 
		call append(line(".")+2, "\# Author: Ev") 
		call append(line(".")+3, "\# mail: wang2011yiwei@sina.com") 
		call append(line(".")+4, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+5, "\#########################################################################") 
		call append(line(".")+6, "\#!/usr/bin/python") 
		call append(line(".")+7, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: Ev") 
		call append(line(".")+2, "	> Mail: wang2011yiwei@sina.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
	endif

	let text_file_type = expand("%:e")
	if text_file_type == 'h'
		call append(line(".")+5, "#ifndef __".toupper(expand("%:r"))."_".toupper(expand("%:e")."__"))
		call append(line(".")+6, "#define __".toupper(expand("%:r"))."_".toupper(expand("%:e")."__"))
		call append(line(".")+7, "") 
		call append(line(".")+8, "//--------------------------- Define -----------------------------------//") 
		call append(line(".")+9, "") 
		call append(line(".")+10, "//------------------------ Include Files -------------------------------//") 
		call append(line(".")+11, "") 
		call append(line(".")+12, "//-------------------------- Typedef -----------------------------------//") 
		call append(line(".")+13, "") 
		call append(line(".")+14, "//-------------------------- Extern ------------------------------------//") 
		call append(line(".")+15, "") 
		call append(line(".")+16, "#endif	//__".toupper(expand("%:r"))."_".toupper(expand("%:e")."__"))
	elseif text_file_type == 'hpp'
		call append(line(".")+5, "#ifndef __".toupper(expand("%:r"))."_".toupper(expand("%:e")."__"))
		call append(line(".")+6, "#define __".toupper(expand("%:r"))."_".toupper(expand("%:e")."__"))
		call append(line(".")+7, "") 
		call append(line(".")+8, "//--------------------------- Define -----------------------------------//") 
		call append(line(".")+9, "") 
		call append(line(".")+10, "//------------------------ Include Files -------------------------------//") 
		call append(line(".")+11, "") 
		call append(line(".")+12, "//-------------------------- Typedef -----------------------------------//") 
		call append(line(".")+13, "") 
		call append(line(".")+14, "//-------------------------- Extern ------------------------------------//") 
		call append(line(".")+15, "") 
		call append(line(".")+16, "#endif	//__".toupper(expand("%:r"))."_".toupper(expand("%:e")."__"))
	elseif text_file_type == 'c' 
		call append(line(".")+5, "") 
		call append(line(".")+6, "//------------------------ Include Files -------------------------------//") 
		call append(line(".")+7, "") 
		call append(line(".")+8, "//--------------------------- Veriable ---------------------------------//") 
		call append(line(".")+9, "") 
		call append(line(".")+10, "//--------------------- Function Prototype -----------------------------//") 
		call append(line(".")+11, "") 
		call append(line(".")+12, "//------------------------- Function -----------------------------------//") 
		call append(line(".")+13, "") 
	elseif text_file_type == 'cpp' 
		call append(line(".")+5, "") 
		call append(line(".")+6, "//------------------------ Include Files -------------------------------//") 
		call append(line(".")+7, "") 
		call append(line(".")+8, "//--------------------------- Veriable ---------------------------------//") 
		call append(line(".")+9, "") 
		call append(line(".")+10, "//--------------------- Function Prototype -----------------------------//") 
		call append(line(".")+11, "") 
		call append(line(".")+12, "//------------------------- Function -----------------------------------//") 
		call append(line(".")+13, "") 
	elseif text_file_type == 'cu' 
		call append(line(".")+5, "") 
		call append(line(".")+6, "//------------------------ Include Files -------------------------------//") 
		call append(line(".")+7, "") 
		call append(line(".")+8, "//--------------------------- Veriable ---------------------------------//") 
		call append(line(".")+9, "") 
		call append(line(".")+10, "//--------------------- Function Prototype -----------------------------//") 
		call append(line(".")+11, "") 
		call append(line(".")+12, "//------------------------- Function -----------------------------------//") 
		call append(line(".")+13, "") 
	
	endif
""	if &filetype == 'c'
""		call append(line(".")+6, "#include<stdio.h>")
""		call append(line(".")+7, "")
""	endif
""	if &filetype == 'cpp'
""	"	call append(line(".")+6, "#include<iostream>")
""	"	call append(line(".")+7, "using namespace std;")
""		if expand("%:e") == 'h'
""			call append(line(".")+6,"varablekkjlj");
""		endif
""		call append(line(".")+7, "")
""	endif
""	"	if &filetype == 'java'
""	"		call append(line(".")+6,"public class ".expand("%"))
""	"		call append(line(".")+7,"")
""	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 
autocmd BufNewFile *.cpp,*.hpp,*.[ch],*.sh,*.java,*.cu,*.py exec ":call SetTitle()" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""nnoremap <leader>w :w!<cr>
""nnoremap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
"map <C-A> ggVGY
"map! <C-A> <Esc>ggVGY
"map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vnoremap <C-c> "+y
nnoremap <C-p> "+p
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
noremap <M-F2> :tabnew<CR>  
"列出当前目录文件  
noremap <F3> :tabnew .<CR>  
"打开树状文件目录  
noremap <C-F3> \be  
"C，C++ 按F5编译运行
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	let myFile=expand("%")
	let myExe=expand("%<")
	let myFileType=expand("%:e")
	if bufloaded(".result")
		:wincmd w
		:silent %d
	else
		:new .result
		:silent %d
		:wincmd J
	endif
	if myFileType == 'c'
		"echo "r !gcc ".myFile." -o ".myExe." && ./".myExe
		silent exec "r !g++ ".myFile." -o ".myExe." && ./".myExe
	elseif myFileType == 'cpp'
		silent exec "r !g++ ".myFile." -o ".myExe."&& ./".myExe
	elseif myFileType == 'java' 
		silent exec "r !javac ".myFile." -o ".myExe."&& ./".myExe
	elseif myFileType == 'sh'
		silent exec "r ./".myFile
	elseif myFileType == 'py'
		silent exec "r !python ./".myFile
	endif
	:w
	:wincmd w
endfunc
"C,C++的调试
noremap <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
""autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed
"从不备份  
set nobackup
"make 运行
"":set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap {<cr>  {<CR>}<ESC>O
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " <c-r>=QuoteDelim('"')<CR>
:inoremap ' <c-r>=QuoteDelim("'")<CR>
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
function! QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col -2] == "\\"
		return a:char
	elseif line[col -1] == a:char
		return "\<Right>"
	else
		return a:char.a:char."\<Esc>i"
	endif
endf

function! RemovePairs()
	let l:line = getline(".")
	let l:previous_char = l:line[col(".") - 1]
	let l:current_char = l:line[col(".")]
	if index(["'",'"',"(","[","{"],l:previous_char) != -1
		if index(["'",'"',"(","[","{"],l:previous_char) == index(["'",'"',")","]","}"],l:current_char)
			""echo l:previous_char." same ".l:current_char
			exec "normal! xx"
			return
		endif
	endif
	""echo l:previous_char." signal ".l:current_char

	if len(getline(".")) == col(".")
		exec "normal! xa"
	else
		exec "normal! xh"
	endif
endf
inoremap <BS> <ESC>:call RemovePairs() <CR>a

filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NERDtee设定
""let NERDChristmasTree=1
""let NERDTreeAutoCenter=1
""let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
""let NERDTreeMouseMode=2
""let NERDTreeShowBookmarks=1
""let NERDTreeShowFiles=1
""let NERDTreeShowHidden=1
""let NERDTreeShowLineNumbers=1
""let NERDTreeWinPos='left'
""let NERDTreeWinSize=31
""nnoremap f :NERDTreeToggle
""map <F7> :NERDTree<CR>  

""au FileType c,cpp setlocal comments-=:// comments+=f://
