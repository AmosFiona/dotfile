# dotfile

    $sudo pacman -S neofetch feh alsa-utils python python-pip picom ranger ueberzug highlight w3m python-pdftotext ffmpegthumbnailer zathura xdotool zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps alacritty nodejs yarn npm
    $yay -S texlive-full clangd
    $yay global add neovim
    $python3 -m pip install pynvim

需要提前安装好字体后，使用该目录下的配置还需要安装如下软件/工具：

查看系统信息：neofetch

图片查看器-背景更换：feh

声卡调整控制器：alsa-utils

输入法：fcitx5-im fcitx5=chinese-addons fcitx5-pinyin-zhwiki fcitx5-pinyin-moegirl

    $nvim /etc/X11/xinit/xinitrc
    export INPUT_METHOD=fcitx5
    export GTK_IM_MODULE=fcitx5
    export QT_IM_MODULE=fcitx5
    export XMODIFIERS=\@im=fcitx5
    export SDL_IM_MODULE=fcitx

python3 环境：python python-pip

    cocvim环境工具：python3 -m pip install pynvim

xorg 渲染器半透明效果：picom

    #新建透明规则，强制半透明
    opacity-rule = [
    	"95:class_g = 'google-chrome-stable'",
    	"85:class_g = 'Chromium'",
    	"90:class_g = 'st-256color'"
    ];


    #窗口透明度调整，如终端
    inactive-opacity = 0.75;
    #渲染半透明效果，alacritty终端半透明效果调整
    frame-opacity = 0.9;



<<<<<<< HEAD
python-pip
pip install pynvim --upgrade
=======

    wintypes:
    {
      tooltip = { fade = true; shadow = true; opacity = 0.85; focus = true; full-shadow = false; };
      dock = { shadow = false; }
      dnd = { shadow = false; }
      popup_menu = { opacity = 0.9; } %调整顶层弹窗的透明度，如输入法
      dropdown_menu = { opacity = 0.8; }
    };

终端文件管理器：ranger

ranger 预览需要的工具：

    ueberzug

    highlight

    w3m

    python-pdftotext

    ffmpegthumbnailer

终端下的 git 管理：lazygit

tex 编译 PDF 预览器：zathura 需要同时安装的工具

    xdotool

    zathura-cb

    zathura-djvu

    zathura-pdf-mupdf

    zathura-ps

终端：alacritty

Coc 自动补全依赖：nodejs yarn npm

yay -S texlive-full clangd

    texlive 更新： tlmgr update --all

finally running in terminal:
yarn global add neovim
>>>>>>> 5a0024f (nvim for tex)
