#!/bin/tcsh

# DOSBox-XとLHAのインストール
sudo pkg install -y dosbox-x lha

# DOSBox-X用ディレクトリの作成
mkdir ~/dos
mkdir ~/dos/util
mkdir ~/dos/ols

# LHAのダウンロードと展開
fetch https://ftp.vector.co.jp/00/24/521/lha255.exe
lha xw=${home}/dos/util lha255.exe
mv lha255.exe ${home}/dos/ols

# FILMTN(DOS/V版)のダウンロードと展開
fetch https://ftp.vector.co.jp/01/03/557/fmv245.lzh
lha xw=${home}/dos/util fmv245.lzh
mv fmv245.lzh ${home}/dos/ols

# LHMTN(DOS/V版)のダウンロードと展開
fetch https://ftp.vector.co.jp/01/03/557/lmv213.lzh
lha xw=${home}/dos/util lmv213.lzh
mv lmv213.lzh ${home}/dos/ols

exit
