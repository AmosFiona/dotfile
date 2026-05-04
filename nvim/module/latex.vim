" Latex 快捷键
" For Studies/Guwen... Select -> spaceXX to surround by env.
xnoremap <leader>eq c\begin{env}<CR><C-r>"<CR>\end{env}<CR>


"for Learning English
xnoremap <leader>ar c\begin{articleNote}<CR><C-r>"<CR>\end{articleNote}<CR>
xnoremap <leader>ph c\phonetic{<C-r>"}{/
xnoremap <leader>tr c\translate{<C-r>"}

" for mybook.cls
xnoremap <leader>na c\name{<C-r>"}


"lervag/vimtex
filetype plugin indent on
syntax enable

let g:tex_flavor = 'latex' " Force to readFileType for latex syntax

let g:vimtex_syntax ={
  \ 'enabled' : 1,
  \ 'conceal' : 1,
  \ 'math' : 1,
  \ 'brace' : 1,
  \ 'cmd' : 1,
  \ 'comment' : 1,
  \}
set conceallevel=2
set concealcursor +=n
hi Conceal ctermfg=117 guifg=#82AAFF
"let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_zathura_options = '--synctex-editor-command :"nvim --servername VIMTEX --remote-send ''<C-\><C-N>:e %1<CR>:%2<CR>''"'
"改用okular
" 正向搜索配置 code -> pdf   nvim快捷键,<leader>lv （默认 \lv)
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" 反向搜索 pdf -> code  okular 里面 shift+左键 跳回对应的代码
" okular 开启synctex 正向反向搜索 需要开启
let g:vimtex_view_automatic = 1
" 编译后自动聚焦到okular 默认 开启
"let g:vimtex_view_okular_foreground = 1

" 基础编译器后端 latex
let g:vimtex_compiler_method = 'latexmk'

" 全局强制引擎：覆盖所有自动检测、ctex 强制、文件类型判断
let g:vimtex_compiler_latexmk_engines = {
	\	'_' : '-xelatex',
	\   'tex': '-xelatex',
	\   'latex': '-xelatex',
	\   'plaintex':'-xelatex',
	\}
let g:vimtex_engine_auto_detect = 0
let g:vimtex_compiler_autofallback = 0
"这里是设置latexmk工具的可选参数
" -8bit  转换TAB在重编码16位时候代码中显示成^^I的问题
let g:vimtex_compiler_latexmk = {
  \ 'engine' : 'xelatex',
  \ 'aux_dir' : './build',
  \ 'out_dir' : './pdf',
  \ 'callback' : 1,
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'hooks' : [],
  \ 'options' : [
  \   '-pdf',
  \   '-xelatex',
  \   '-verbose',
  \   '-file-line-error',
  \   '-shell-escape',
  \   '-8bit',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
 \}

" open nvim remote sever auto-listen, no --listen
let g:vimtex_compiler_progname = 'nvim'
let g:vimtex_view_okular_nvim_server = '/tmp/nvim-sync.pipe'

let g:vimtex_auto_compile = 1

"2-不管正确还是错误都弹出quickfix 1-错误时弹quick,0-错误正确都不弹
let g:vimtex_quickfix_mode = 2
"编译过程中忽略警告信息
"let g:vimtex_quickfix_open_on_warning=0

"F5 编译文档 打开刷新 zathura
"autocmd	FileType tex nnoremap <buffer> <F5> :execute '!xelatex -shell-escape -8bit -synctex=1 % && zathura %:r.pdf &'<CR><CR>
autocmd	FileType tex nnoremap <buffer> <F5> :execute '!xelatex -shell-escape -8bit -synctex=1 % && okular %:r.pdf &'<CR><CR>
"F6 清理 .aux .log .out .synctex.gz等中间文件 zathura
autocmd	FileType tex nnoremap <buffer> <F6> :!latexmk -c %<C>

" 正向搜索nvim-> Zathura Alt+Enter  打开文档命令需要带附加服务器：nvim --server LA_TEX *.tex
"autocmd	FileType tex nnoremap <buffer> <A-Enter> :call system('zathura --synctex-forward=' . line('.') . ':1:' . expand('%:p') . ' ' . expand('%:p:r') . '.pdf 2>/dev/null &')<CR>

"亮珊瑚红色 For Package 包文件名
hi clear texFilesArg
hi texFilesArg ctermfg=210 guifg=#ff7f7f gui=bold
" 亮薄荷色 For cls Filename 类文件名
hi clear texFileArg
hi texFileArg ctermfg=114 guifg=#87ffaf gui=bold

"亮黄色 For  \begin{...}  \end{...} yellow  ctermfg= only terminal(No GUI), guifg = nvim-gui and terminal with full colors
hi clear texCmdEnv
hi texCmdEnv ctermfg=11 guifg=#f1fa8c gui=bold
"黄绿色 For  各种环境名 document thm ...
hi clear texEnvArgName
hi texEnvArgName ctermfg=148 guifg=#afd787 gui=italic
"橙黄色
hi clear texCmd
hi texCmd ctermfg=215 guifg=#ffaf5f gui=bold
" 海绿色 For NewCMD
hi clear texCmdNewcmd
hi texCmdNewcmd ctermfg=43 guifg=#22aa88 gui=bold
"松石蓝
hi clear texComment
hi texComment ctermfg=73 guifg=#5fafaf gui=italic

"橙红色 For  {  }
hi clear texDelim
hi texDelim ctermfg=208 guifg=#ff5f00
"青绿色 For math ()  []{  }
hi clear texMathDelim
hi texMathDelim ctermfg=25 guifg=#2666b3
"绿色 For \# \& \_ \%
hi clear texSpecialChar
hi texSpecialChar ctermfg=2 guifg=#50fa7b gui=italic
"砖黄色 For 多行公式 equation gather gather*
hi clear texMathEnvArgName
hi texMathEnvArgName ctermfg=11 guifg=#ffb89c
hi clear texMathZoneTI " For math 紫红色 $$...$$行内公式数学字体
hi texMathZoneTI ctermfg=13 guifg=#ed46f1 gui=bold
hi clear texMathZoneLD " For math 砖黄色 独立环境\[ ... \]下的数学字体
hi texMathZoneLD ctermfg=13 guifg=#ddaa22 gui=bold
