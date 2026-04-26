syntax enable
set termguicolors


" markdown 快捷键
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> <silent> ,, <++>
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,r <Esc>/<++><CR>N:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/<++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,u <u></u> <++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ]
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,k [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

 autocmd Filetype markdown inoremap <buffer> \1 <space><++> <bar><Esc>0jA ---- <bar><Esc>0jA <++> <bar><Esc>0jA <++> <bar>
" 切换标题
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>m1 <Esc>:s/^#*\s//<CR>0i#<Space><Esc>:noh<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>m2 <Esc>:s/^#*\s//<CR>0i##<Space><Esc>:noh<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>m3 <Esc>:s/^#*\s//<CR>0i###<Space><Esc>:noh<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>m4 <Esc>:s/^#*\s//<CR>0i####<Space><Esc>:noh<CR>

autocmd Filetype markdown nnoremap <buffer> <silent> <leader>mf <Esc>/<++><CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>mi :nohlsearch<CR>d4li
" 插入当前时间
autocmd Filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" vim-table-mode
let g:table_mode_motion_up_map = '<c-k>'
let g:table_mode_motion_down_map = '<c-j>'
let g:table_mode_motion_left_map = '<c-h>'
let g:table_mode_motion_right_map = '<c-l>'

" md-img-paste
let file_name = expand('%:t:r')
let g:mdip_imgdir = "media/".file_name
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

" markdown-preview
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'chromium'
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''


" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']


" vim-table-mode
nnoremap <leader>tm :TableModeToggle<CR>

" vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_level=6
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
" noremap mt :Toc<CR>:vert res 40<CR>
"
"===============nvim-treesitter================
lua << EOF
require'nvim-treesitter.config'.setup ({
	-- 自动安装缺失的语法解析器，.config 文件需要找一下是不是这个名字，不然会报错lua加载vim treesitter错误。
	auto_install =true,
	-- 启用的语法解析器（按需添加，比如 python、lua、c、cpp、javascript 等）
	ensure_installed = {
		'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline', --基礎必備
		'c', 'cpp', 'python', 'javascript', 'typescript', --常用編程語言
		'json','bash', 'html', 'css', 'latex'	-- 按需增减
		},
		sync_install = false, --異步安裝取消，提升速度
	highlight ={
	  enable = true,
	  disable = {'latex','tex'},
		-- 禁用大型文件的高亮（提升性能）
	  disable = function(lang, buf)
			local max_filesize = 300 * 1024 -- 300 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		-- 使用 treesitter 高亮而非 vim 内置高亮
    additional_vim_regex_highlighting = false,
	},
	-- 启用代码折叠（需配合 set foldmethod=expr）
  fold = {
    enable = true,
		fold_method = 'expr',
    foldexpr = 'nvim_treesitter#foldexpr()',
  },
	-- 启用增量选择（按 v 扩展选择，V 收缩）
  incremental_selection = {
    enable = true,keymaps = {
      init_selection = '<CR>',    -- 初始化选择
      node_incremental = '<CR>',  -- 扩展选择
      node_decremental = '<BS>',  -- 收缩选择
      scope_incremental = '<TAB>',-- 扩展到作用域
    },
  },
	-- 启用文本对象选择（比如 vi huakuohao 选中花括号内内容）
  textobjects = {
    enable = true,
    select = {
      enable = true,-- 文本对象映射（按需调整）
      keymaps = {
        ['af'] = '@function.outer',  -- 选中整个函数
        ['if'] = '@function.inner',  -- 选中函数内部
        ['ac'] = '@class.outer',     -- 选中整个类
        ['ic'] = '@class.inner',     -- 选中类内部
        ['aa'] = '@parameter.outer', -- 选中整个参数
        ['ia'] = '@parameter.inner', -- 选中参数内部
        ['al'] = '@loop.outer',      -- 选中整个循环
        ['il'] = '@loop.inner',      -- 选中循环内部
        ['ab'] = '@block.outer',      -- 选中整個代碼塊
        ['ib'] = '@block.inner',      -- 选中代碼塊内部
      },
		},
	},
  --跳轉功能(跳轉到函數/類的上一個/下一個實例)
	move = {
		enable = true,
		set_jumps = true, --記錄跳轉位置(可通過<C-o>返回)
		goto_next_start = {
        [']m'] = '@function.outer',      -- 选中整个循环
        [']]'] = '@class.outer',      -- 选中循环内部
			},
		goto_next_start = {
        ['[m'] = '@function.outer',      -- 选中整个循环
        ['[['] = '@class.outer',      -- 选中循环内部
			},
	},

	-- 启用语法注释（配合 comment.nvim 更佳）
  context_commentstring = {
    enable = true,
		enable_autocmd = false,
		},
})
-- 3. 全局设置（配合 treesitter 折叠）
vim.opt.foldmethod = 'expr'  --使用表達式摺疊
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99  -- 默认不折叠所有内容 避免打開文件全摺疊
vim.opt.foldenable = true
EOF


"----------headlines.nvim 配置 ---
lua << EOF
-- 延迟加载 headlines.nvim，仅在打开 Markdown 文件时初始化
vim.api.nvim_create_autocmd("FileType", {
	  pattern = "markdown",
		callback = function()
		require("headlines").setup({
			markdown = {
				headline_highlights = {
					"Headline1", "Headline2", "Headline3",
					"Headline4", "Headline5", "Headline6",
				},
				codeblock_highlight = "CodeBlock",
				dash_highlight = "Dash",
				quote_highlight = "Quote",
			  headline_styles= {
					"█","▄","▀","▌","▐","▏"
					},
				},
			})
--自定义高亮（仅在Markdown缓冲区生效）
vim.api.nvim_set_hl(0,"Headline1",{ fg = "#FF6B6B",bold =true })
vim.api.nvim_set_hl(0,"Headline2",{ fg = "#4ECDC4",bold =true })
vim.api.nvim_set_hl(0,"CodeBlock",{ bg = "#2A2A2A" })
vim.api.nvim_set_hl(0,"Quote",{ fg = "#95E6CB",italic =true })
end,
})
EOF





nnoremap <F12> :MarkdownPreviewToggle<CR>
nnoremap <leader>toc :Toc<CR>
nnoremap <leader>cb i```<CR><CR>```<ESC>kA
