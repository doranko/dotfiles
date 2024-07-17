if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"ファイルタイプ関連を無効化
filetype off
filetype plugin indent off

"文字コードを UTF-8 に設定
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis

"ビープ音消去
set belloff=all

"改行コード設定
set fileformats=unix,dos

"### 表示設定 ###
set number              "行番号を表示
set cursorline          "現在の行を強調表示
set title               "編集中のファイル名を表示
set ambiwidth=double    "全角文字の幅を 2 に固定
set showmatch           "括弧入力時の対応する括弧を表示
set matchtime=2         "対応する括弧の表示時間
colorscheme ron         "カラースキーマの設定
syntax on               "コードの色分け
set expandtab           "tab で空白文字を挿入
set tabstop=4           "インデントの幅を設定
set shiftwidth=4        "オートインデントの幅
set smartindent         "オートインデント
set nrformats-=octal    "0で始まる数値を8進数として扱わないようにする
set list                "Tab と 改行文字 を可視化
set listchars=tab:^\    "Tab を可視化するときに '^ ' として表示
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=#5f5f5f
set tw=0                "自動改行 off
set showbreak=-         "折り返し部分の初めに '-' を挿入する
set pumheight=10        "'c-p' で表示される補完メニューの高さ
set scrolloff=3         "カーソル行の上下に指定した行数を確保して表示
set foldcolumn=1        "折り畳み場所の表示領域をウィンドウ左に確保

set splitbelow "新しいウィンドウを開く際、下に開く

"### HTML のインデント設定 ###
let g:html_indent_script1="inc" "<script> の最初の行を自動インデント
let g:html_indent_style1="inc"  "<style> の最初の行を自動インデント

"### ステータスラインの設定 ###
set laststatus=2                       "ステータスラインを常に表示
set statusline=%F                      "ファイル名表示
set statusline+=%m                     "変更チェック表示
set statusline+=%r                     "読み込み専用なら [RO] と表示
set statusline+=%h                     "ヘルプページなら [HELP] と表示
set statusline+=%w                     "プレピューウィンドウなら [Prevew] と表示
set statusline+=%=                     "以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}] "encoding を表示
set wildmenu                           "コマンドラインモード時に Tab で補完候補をステータスラインに表示

"### 操作設定 ###
set clipboard=unnamed,autoselect "ヤンク & ペーストにクリップボードを利用

"### 検索設定 ###
set hlsearch   "検索でマッチした部分をハイライト
set ignorecase "大文字/小文字の区別無く検索
set smartcase  "検索文字列に大文字が含まれている場合は区別して検索
set nowrapscan "検索時に最後まで行ったら最初に戻らないようにする
set incsearch  "インクリメンタル検索を有効にする

"### diff 設定 ###
set diffopt=vertical

"### バックアップ設定 ###
set nobackup  "バックアップ出力無効
set noundofile "undoファイル出力無効

"### viminfo ファイル設定 ###
set viminfo+=n$HOME/.vim/.viminfo

"### テンプレート挿入設定 ###
augroup insertTemplate
    autocmd!
    autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
    autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
    autocmd BufNewFile *.cpp 0r $HOME/.vim/template/c++.txt
    autocmd BufNewFile *.java 0r $HOME/.vim/template/java.txt
    autocmd BufNewFile *.stan 0r $HOME/.vim/template/stan.txt
    autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt
augroup END

"### dein.vim
"プラグインが実際にインストールされるディレクトリ
"シンボリックリンクが噛むとエラーとなるため、リンクをかまさずに直接参照
let s:dein_dir = expand('~/dotfiles/.vim/dein')
"dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
"設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    "プライグインリストを収めた TOML ファイル
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    "TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    "設定終了
    call dein#end()
    call dein#save_state()
endif
"未インストールのものをインストール
if dein#check_install()
    call dein#install()
endif
"TOML ファイルから削除されているプラグインを削除
call map(dein#check_clean(), "delete(v:val, 'rf')")
call dein#recache_runtimepath()

"### キーマッピング
"<F4> を押すたびに行番号の絶対表示と相対表示を切り替え
nnoremap <F4> :<C-u>setlocal relativenumber!<CR> 
"ハイライト削除
nnoremap <F3> :noh<CR>

"ファイルタイプ関連を有効化
filetype plugin indent on

augroup foldOpen
    autocmd!
    autocmd BufNewFile,BufRead * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
augroup END
