if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ============================================================================================
" === Install Plugins with Vim-Plug
" ============================================================================================
call plug#begin('~/.config/nvim/plugged')
"如果要某个插件只对某种文件生效:在plug后面加上'vim-plug',{'for':['文件格式','vim-plug']}

" theme
Plug 'theniceboy/nvim-deus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'	"图标

Plug 'xiyaowong/nvim-transparent'	"透背景明插件

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" neovim浮动窗口打开ranger
Plug 'kevinhwang91/rnvimr'

" rainbow.vim 彩虹括号
Plug 'luochen1990/rainbow'

" 代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " 代码片段示例库

" 位置标记
Plug 'chentau/marks.nvim'

" 函数列表
Plug 'liuchengxu/vista.vim'

" Markdown https://zhuanlan.zhihu.com/p/84773275
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "sudo pacman -S nodejs yarn
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'ferrine/md-img-paste.vim' " <leader-p>
Plug 'dkarter/bullets.vim'


" 补括号
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'

"COC.nvim
Plug 'neoclide/coc.nvim',{'branch':'release'}

" vimtex or :CocInstall coc-vimtex for Latex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
"Plug 'wjakob/wjakob.vim' "已经复制tex.vim

call plug#end()




"==================== Start of Plugin Settings =====================
source $HOME/.config/nvim/module/plug-configs/fzf.vim
source $HOME/.config/nvim/module/plug-configs/rnvimr.vim
source $HOME/.config/nvim/module/plug-configs/rainbow.vim
source $HOME/.config/nvim/module/plug-configs/git.vim
source $HOME/.config/nvim/module/plug-configs/marking.vim
source $HOME/.config/nvim/module/plug-configs/coc-extensions.vim


"Plug 'wincent/terminus'
"Plug 'mg979/vim-xtabline'
" Undotree.vim
"Plug 'mbbill/undotree'

" TODO待办事项
"Plug 'nvim-lua/plenary.nvim'
"Plug 'folke/todo-comments.nvim'

" 突出显示当前光标对象（所有）
"Plug 'RRethy/vim-illuminate'
"Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }


" far 查找与替换
"Plug 'brooth/far.vim'

"Plug 'kevinhwang91/nvim-hlslens'


" 默认面板
"Plug 'glepnir/dashboard-nvim'

" 快速注释
"Plug 'preservim/nerdcommenter'

" 对齐
"Plug 'godlygeek/tabular'    "tabu

" 递进式补选中代码块
"Plug 'gcmt/wildfire.vim'

" 移动光标选中文本
"Plug 'matze/vim-move'

" 输入化自动切换
"Plug 'lilydjwg/fcitx.vim', { 'branch': 'fcitx4' }

" 对光标内容添加包裹
"Plug 'tpope/vim-surround' " 光标选中后，按 S+<需要包裹的符号>

" 显示对齐线，优化语法隐藏，如json
"Plug 'Yggdroot/indentLine'

" 多光标
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" 侧边栏上向您显示寄存器的内容
" Plug 'junegunn/vim-peekaboo'

"Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite

" 翻译插件
" Plug 'voldikss/vim-translator'

" 光标快速移动
"Plug 'easymotion/vim-easymotion'

" 日历
"Plug 'itchyny/calendar.vim'

"Plug 'folke/which-key.nvim'

"Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'romgrk/nvim-treesitter-context'
"Plug 'folke/trouble.nvim'

"Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
"Plug 'luukvbaal/stabilize.nvim'
