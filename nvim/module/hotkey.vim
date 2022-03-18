" ============================================================================================
" === neovim -shortcut 配置
" ============================================================================================
map S :w<CR>
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
