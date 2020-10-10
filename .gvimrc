"### 表示設定 ###
set showtabline=2 "タブバーを常に表示
set cursorline    "現在の行を強調表示
colorscheme ron

"文字サイズ指定
set guifont=MS_Gothic:h13
set guifont=MS_Gothic:h13

"GUI パーツの非表示化
if has('gui')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
endif
