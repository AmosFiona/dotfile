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

Plug 'xiyaowong/nvim-transparent'	"透背景明插件

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" neovim浮动窗口打开ranger
Plug 'kevinhwang91/rnvimr'


" 代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " 代码片段示例库

" 位置标记
"Plug 'chentau/marks.nvim'  作者已更名仓库
Plug 'chentoast/marks.nvim'

" 函数列表
Plug 'liuchengxu/vista.vim'

" Markdown https://zhuanlan.zhihu.com/p/84773275
Plug 'godlygeek/tabular'
" For 語法支持
Plug 'preservim/vim-markdown', { 'for' : ['md'] }
" For preview on time
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install'  } "sudo pacman -S nodejs yarn  或者如下
Plug 'iamcco/markdown-preview.nvim',{ 'do':{ -> mkdp#util#install() }, 'for': ['markdown','vim-plug'] }
" 增強表格
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" 語法高亮增強
Plug 'nvim-treesitter/nvim-treesitter',{ 'do':':TSUpdate'}
" Markdown 視覺美化（標題，引用，代碼塊樣式）
Plug 'lukas-reineke/headlines.nvim' " <leader-p>
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
Plug 'lervag/vimtex', { 'for' : ['tex', 'cls', 'sty'] }
Plug 'KeitaNakamura/tex-conceal.vim' " For Markdown

Plug 'ryanoasis/vim-devicons'	"图标
" 翻译插件
Plug 'voldikss/vim-translator'


" 对光标内容添加包裹 无需配置 安装好后直接用
Plug 'tpope/vim-surround' " 光标选中后，按 g S+<需要包裹的符号>

" 彩虹括号
Plug 'luochen1990/rainbow'

" 侧边栏上向您显示寄存器的内容 \" or \@ start in normal  and <CTRL-R> in insert
Plug 'junegunn/vim-peekaboo'


call plug#end()


"==================== Start of Plugin Settings =====================
source $HOME/.config/nvim/module/plug-configs/fzf.vim
source $HOME/.config/nvim/module/plug-configs/rnvimr.vim
source $HOME/.config/nvim/module/plug-configs/rainbow.vim
source $HOME/.config/nvim/module/plug-configs/git.vim
source $HOME/.config/nvim/module/plug-configs/marking.vim
source $HOME/.config/nvim/module/plug-configs/coc-extensions.vim
source $HOME/.config/nvim/module/plug-configs/translator.vim


