#!/bin/tcsh

# 初期設定
set fn="my932gothic"

# IPAゴシックフォントから、フォントを抜き出す
python3.11 create_font.py

# フォントファイルを編集するため、.ttfファイルをテキストファイルに変換する
ttx -o ${fn}.ttx ${fn}.ttf

# 等幅フォントまわりの設定を行う

  # 秀丸エディタは下記設定で、固定幅フォントと認識される(設定がないとプロポーショナルと認識される)
  sed -i '' -e 's/<bProportion value=".*"\/>/<bProportion value="9"\/>/' ${fn}.ttx

  # Binary Editor BZは下記設定で、①フォント一覧に表示される、②フォント幅異常を防げる
  sed -i '' -e 's/<ulCodePageRange1 value=".*"\/>/<ulCodePageRange1 value="00000000 00000010 00000000 00000001"\/>/' ${fn}.ttx
  sed -i '' -e 's/<xAvgCharWidth value=".*"\/>/<xAvgCharWidth value="1024"\/>/' ${fn}.ttx

# テキストファイルをフォントファイル.ttfに変換する
ttx -o ${fn}.ttf ${fn}.ttx

# フォントファイルをフォントディレクトリにコピーし、システムで使えるようにする
mkdir -p ~/.fonts
cp ${fn}.ttf ~/.fonts
fc-cache -f
fc-list | grep My932Gothic
