"=============Ultisnips核心配置================
"啟用
let g:UltiSnipsEnable = 1

"關聯 vim-snippets目錄
let g:UltiSnipsSnippetDirectories = [ '~/.config/nvim/Fio-Ultisnips/' ]

"快捷鍵映射
"解決TAB/回車無相應
"1 展開/選擇下一個片段佔位符 TAB
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"2 選擇上一個片段佔位符 shift + tab
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"3 回車確認選擇並展開(關鍵：覆蓋默認回車行為)
inoremap <silent> <cr> <cmd>call UltiSnips#ExpandSnippet()<cr><cr>
"容錯 若回車仍無效，添加 備選映射
inoremap <silent> <cr> <C-r>=UltiSnips#ExpandSnippet()<cr><cr>

"自動加載當前文件類型片段
let g:UltiSnipsAutoLoadSnippets = 1
let g:UltiSnipsEditSplit = 'vertical'

"为冲突插件添加例外
let g:AutoPairsMapCR = 0
"inoremap <cr> <esc>call AutoPairsReturn()<cr>
autocmd FileType * if &ft != 'Ultisnips' | let b:AutoPairsMapCR = 1 | endif
