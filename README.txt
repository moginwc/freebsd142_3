# FreeBSD 14.2 の設定ファイル

FreeBSD 14.2 インストール&設定メモ 2025-10-08 第10版 に対応
https://moginwc.sakura.ne.jp/FreeBSD142InstallGuide3.pdf

インストールをお急ぎの方は、下記を実行してください。

ステップ１．FreeBSD 14.2 インストール&設定メモ 2025-10-08 第10版 の
　　　　　　33〜82ページ（sudoを設定するまで）を実行する。
ステップ２．# pkg install -y git を実行する。
ステップ３，# exit でログアウトする。
ステップ４．pcuser でログインする。
ステップ５．% git clone https://github.com/moginwc/freebsd142_3 を実行する。
ステップ６．% cd freebsd142_3
ステップ７．% tcsh -x ./install.tcsh
　　　　　　(sudoのパスワード入力、および最後にファイル共有smbのパスワード入力があります)
ステップ８．% sudo shutdown -r now
ステップ９．154ページ以降を参照。

--------

Wineのインストールをお急ぎの方は、引き続き下記を実行してください。

ステップ１．pcuser でログインする。（以下、ウインドウ環境下での操作を前提とします）
ステップ２．% cd freebsd142_3
ステップ３．% tcsh -x ./install_wine.tcsh
　　　　　　（秀丸エディタ、WinMerge、Binary Editor BZもインストールされます。
　　　　　　　途中、何かフォルダーのようなものが表示されますが、閉じてください）
ステップ４．いったんログアウトし、再度ログインする

[EOF]
