" ============================================================================================
" === neovim -base 配置
" ============================================================================================
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'


let mapleader = "\<space>"
syntax on
set number							"设定行号
set relativenumber

set tabstop=4						"设置制表符4
set shiftwidth=4    				"设定tab的宽

set ignorecase						"搜索忽略大小写"
set smartcase						"智能搜索"
set scrolloff=5						"顶部底部预留5行"
set encoding=utf-8
set cursorline						"设置高亮行
hi Cursorline cterm=NONE ctermbg=241 ctermfg=NONE guibg=NONE guifg=NONE
set autoindent
set ruler


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2313,cp936
set termencoding=utf-8
set encoding=utf-8
let &termencoding=&encoding

" 打开文件时光标返回上次离开的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 自动移除末尾空白
autocmd BufWritePre * :%s/\s\+$//e


noremap <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
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
