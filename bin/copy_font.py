import fontforge
import psMat
import tempfile
import os

# フォント読み込み
original = fontforge.open("/home/pcuser/.fonts/my932gothic.ttf")   # コピー先
source = fontforge.open("/usr/local/share/fonts/ume/ume-tgo4.ttf") # コピー元

# コピーしたい文字コード
unicodes = [0x005C, 0x005F]  # バックスラッシュ, アンダーバー

# コピー先のEM
upm = original.em

for code in unicodes:
    if code in source:
        src_glyph = source[code]
        # コピー先にグリフがなければ作成
        if code not in original:
            original.createChar(code)
        dst_glyph = original[code]

        # 元のグリフをクリア
        dst_glyph.clear()

        # 一時SVGにアウトラインを書き出してからインポート
        tmp_svg = tempfile.NamedTemporaryFile(delete=False, suffix=".svg")
        tmp_svg.close()
        src_glyph.export(tmp_svg.name)
        dst_glyph.importOutlines(tmp_svg.name)
        os.unlink(tmp_svg.name)  # 後片付け

        # EMに合わせてスケーリング
        scale = upm / source.em

        # 等幅なので幅をコピー先に合わせる（半角スペース幅）
        dst_glyph.width = original[0x0020].width
    else:
        print(f"U+{code:04X} はコピー元フォントに存在しません")

# 保存
original.generate("modified.ttf")
original.close()
source.close()

