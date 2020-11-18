# 前提

Vim 8.1 ～ がインストール済み

# 導入 (Windows)

1. `cd %HOMEPATH%`
2. `git clone https://github.com/doranko/dotfiles.git`
3. run_mklink を実行 (mklink.bat を管理者権限で実行)

# 導入 (Mac)

1. `cd ~`
2. `git clone https://github.com/doranko/dotfiles.git`
3. `cd dotfiles/`
4. `sh dotfilesLink.sh`

# 初回起動時

プラグインがインストールされます。

Windows の場合はまずコマンドプロンプトが表示され、Vim から 1 度目のポップアップが表示されます。

その後、しばらくして 2 度目のポップアップが表示されたらインストール終了です。

# 注意点

プラグインのインストール場所は `~/dotfiles/.vim/dein` となっています。

別の場所にインストールしたい場合は .vimrc の該当箇所を適宜書き換えてください。
