"### 表示設定 ###
set showtabline=2 "タブバーを常に表示
set cursorline    "現在の行を強調表示
colorscheme ron

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
