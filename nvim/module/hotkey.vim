" ============================================================================================
" === neovim -shortcut 配置
" ============================================================================================
map W :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>


" ============================================================================================
" === coc.nvim -shortcut 配置
" ============================================================================================

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" 设置刷新时间
set updatetime=100


" Don't pass messages to |ins-completion-menu|.
" 补全时候短命令显示
set shortmess+=c


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" 设置TAB键用来自动补全，注意应用':verbose imap <tab>'
" 来确保tab键没有作为其他用处的快捷键
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" <CR>键确认选择的补全选项
" Ctrl + g 撤销当前的撤销
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" 使用 `[g]` 和`]g`诊断行跳转
" 使用`:CocDiagnostics` 获取位置列表中当前缓冲区的所有诊断信息
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
" 代码跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-x> to 触发提示
inoremap <silent><expr> <c-x> coc#refresh()

" Use K to show documentation in preview window.
" 使用K在预览窗口显示文档。
nnoremap <silent> <LEADER>m :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 使用 K 在预览窗口显示文档.
" nnoremap <silent> K :call ShowDocumentation()<CR>
"
" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction
" ————————————————
" 版权声明：本文为CSDN博主「以方画圆」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
" 原文链接：https://blog.csdn.net/qq_37813963/article/details/126366356



" Formatting selected code.
" 格式化选中的代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" " 将 codeAction 应用到指定区域.
" 示例: `<leader>aap` 指定的是当前窗口
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" 重映射按键 应用codeAction 到当前缓冲区.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
"  在当前行上运行“代码镜头”操作
nmap <leader>cl  <Plug>(coc-codelens-action)

" coc-snippets
let g:snips_author = 'Amos-CXW-Fiona'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" Highlight the symbol and its references when holding the cursor.
" 按住光标时高亮显示符号及其引用.
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd Filetype markdown nnoremap <buffer> <silent> <leader>ms :CocCommand markmap.watch<CR>

" 符号重命名.
nmap <leader>rn <Plug>(coc-rename)

" 添加 (Neo)Vim的原生状态栏行的支持.
" 注意: 详见 `:h coc-status` 来设置结合了外部插件的自定义状态栏: lightline.vim, vim-airline.
"set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{coc#status()}%{get(b:,'coc_current_function','')}

" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>tw <Plug>(coc-translator-p)
vmap <Leader>tw <Plug>(coc-translator-pv)
" replace
nmap <Leader>tr <Plug>(coc-translator-r)
nmap <Leader>tr <Plug>(coc-translator-rv)


xnoremap <leader>w c\begin{env}<CR><C-r>"<CR>\end{env}<CR>
