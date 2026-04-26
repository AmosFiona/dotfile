filetype plugin indent on
syntax enable
"rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
			\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
			\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
			\   'operators': '_,_',
			\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\   'separately': {
			\       '*': {},
			\       'tex': {
			\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\       },
			\       'lisp': {
			\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick','darkorchid3'],
			\       },
			\       'vim': {
			\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\       },
			\       'html': {
			\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\       },
			\       'css': 0,
			\   }
			\ }
hi RainbowDelimiterRed ctermfg=1 guifg=#e06c75
hi RainbowDelimiterYellow ctermfg=3 guifg=#d19a66
hi RainbowDelimiterBlue ctermfg=4 guifg=#61afef
hi RainbowDelimiterGreen ctermfg=2 guifg=#98c379
hi RainbowDelimiterPurple ctermfg=5 guifg=#c678dd

" vim-peekaboo 预览配置
let g:peekaboo#auto = 0
let g:peekaboo#enable_bracket = 1
let g:peekaboo#enable_quote = 1 " enable '' \"" ``
"let g:peekaboo#delay = 120

nmap ,p <Plug>(peekaboo-open)
xmap ,p <Plug>(peekaboo-open)

" vim-surround users
" 添加 ys
" ysiw"  单词加双引号
" ysiw'  单词加单引号
" ysiw(  单词加小括号
" yss{   整行包裹{	}
" ysa]   选中区域加中括号
"
" 删除 ds
" ds(    删除一层()
" ds[    删除一层[]
" ds'    删除单引号
" ds"    删除双引号
"
" 替换 cs
" cs"' " -> '
" cs({ ( -> {
" cs)} ) -> }
"
" 可视模式
" 选中文字，按
" S" S' S( S[  快速包裹
