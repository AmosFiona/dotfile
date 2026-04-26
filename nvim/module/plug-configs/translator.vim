"vim-translator

" 目标语言 中文zh
let g:translator_target_lang = 'zh'
" 源语言自动识别
let g:translator_source_lang = 'auto'

let g:translator_default_engines = ['bing','youdao','haici']
" popup/float/preview
let g:translator_window_type = 'popup'

let g:translator_window_max_width = 0.6
let g:translator_window_max_height = 0.6

"let g:translator_proxy_url = 'socks5://127.0.0.1:1080'

" normal mode
" <Leader> tt  translator
" <Leader> tw  translator to a window
" <Leader> tr  translator and replace
" visual mode
" <Leader> tt  translator selected
" Command mode
" :Translate [text]
" :TranslateW  window for translator
" :TranslateR  replace source text
" :TranslateX  translate pastepage
nmap <silent>tt <plug>Translate
vmap <silent>tt <Plug>Translate
nmap <silent>tw <Plug>TranslateW
vmap <silent>tw >Plug>TranslateW
