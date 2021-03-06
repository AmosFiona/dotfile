" ============================================================================================
" === neovim -base 配置
" ============================================================================================
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3' "for :checkhealth error no pynvim modules, running python3 -m pip -install pynvim

set nocompatible
let mapleader = "\<space>"
inoremap jk <Esc>

syntax on
set number							"设定行号
set relativenumber

set mouse=							"close cursor
set listchars=tab:\|\ ,trail:▫		"setting space display as ▫

set tabstop=2						"设置tab制表符4
set shiftwidth=2    				"设定制表符宽,while autoindent

set ignorecase						"搜索忽略大小写"
set smartcase						"智能搜索"
set scrolloff=5						"顶部底部预留5行"
set encoding=utf-8
set cursorline						"设置高亮行
hi Cursorline cterm=NONE ctermbg=241 ctermfg=NONE guibg=NONE guifg=NONE
set autoindent
set ruler

set wildmenu
set showcmd




set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2313,cp936
set termencoding=utf-8
set encoding=utf-8
let &termencoding=&encoding

" 打开文件时光标返回上次离开的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 自动移除末尾空白
autocmd BufWritePre * :%s/\s\+$//e


" ============================================================================================
" === neovim -CompilerFuncions 配置
" ============================================================================================

" @ make			mk
" @ make clean		mc
" @ make running	mr
noremap mk :call CompileCmd()<CR>
noremap mc :call CompileCleanCmd()<CR>
noremap mr :call CompileRunCmd()<CR>

function! CompileCmd()
	"保存文件
	execute "w"
	"c 语言构建命令
	if &filetype == 'c'
		execute 'make'
	"cpp 构建命令
	elseif &filetype == 'cpp'
		execute 'make'
	"makefile 执行 make 命令
	elseif &filetype == 'make'
		execute 'make'
	elseif &filetype == 'tex'
		execute 'VimtexStop'
		execute 'VimtexCompile'
	elseif &filetype == 'java'
		execute "!time javac %"
	endif
endfunction

" 清理脚本
function!  CompileCleanCmd()
	execute 'w'
	if &filetype == 'c'
		execute "make clean"
	elseif &filetype == 'cpp'
		execute "make clean"
	elseif &filetype == 'make'
		execute 'make clean'
	elseif &filetype == 'tex'
		execute 'VimtexClean'
	endif
endfunction

" 执行脚本
function! CompileRunCmd()
	execute "w"
	" 运行 c 的可执行文件
	if &filetype == 'c'
		execute "make run"
	" 运行 cpp 的可执行文件
	elseif &filetype == 'cpp'
		execute "make run"
	" Python 运行命令
	elseif &filetype == 'python'
		execute "!time python %"
	" shell脚本 运行命令
	elseif &filetype == 'sh'
		execute "!time sh %"
	elseif &filetype == 'markdown'
		exec "MarkdownPreviewToggle"
	elseif &filetype == 'make'
		execute 'make run'
	elseif &filetype == 'tex'
		execute 'VimtexView'
	elseif &filetype == 'lua'
		execute "!time lua %"
	endif
endfunction


"Running code by Gcc
noremap <LEADER>r :call CompileRunGcc()<CR>


func! CompileRunGcc()
	"save current file(s)
	execute "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc -ansi -Wall % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" 打开nvim时自动重新激活配置
autocmd VimEnter * source $MYVIMRC

" 退出文件后，依然保存修改记录
" silent !mkdir -p $HOME/.config/nvimdata/tmp/backup
" silent !mkdir -p $HOME/.config/nvimdata/tmp/undo
" set backupdir=$HOME/.config/nvimdata/tmp/backup,.
" set directory=$HOME/.config/nvimdata/tmp/backup,.
" if has('persistent_undo')
" 	set undofile
" 		set undodir=$HOME/.config/nvimdata/tmp/undo,.
" 		endif
"
" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

