# horizon
横線難読化シェル芸コマンド horizon

# 何これ?

入力された文字列を、横線文字列に置換するコマンドです。置換された横線文字列を元に戻すこともできます。

# インストール例

```
$ sudo cp horizon /usr/local/bin/
```

# 実行例

```
$ horizon --help
usage: horizon [-d] [string ...]

$ horizon
test
⁃̄᠊⼀⁃-━=
うんこ
ꣻꣻ̄̄ꣻꣻ̲ ꣻꣻ̄ ­₋==
💩
－̱ￚᐨ╶ᅳ━=

$ horizon テスト
ꣻꣻ̄͟ꣻꣻ̲﹘ꣻꣻ̠͟­₋==

$ horizon テスト | xxd
00000000: eaa3 bbea a3bb cd9f cc84 eaa3 bbea a3bb  ................
00000010: ccb2 efb9 98ea a3bb eaa3 bbcd 9fcc a0c2  ................
00000020: ade2 828b 3d3d 0a                        ....==.

$ horizon 1234567890
̶ ̠⼀͞¯᠆㆒͞⼀₋﹘̶-━=

$ horizon -d ̶ ̠⼀͞¯᠆㆒͞⼀₋﹘̶-━=
1234567890

$ horizon テスト | horizon -d
テスト

$ horizon ⚠️💩 | horizon -d
⚠️💩
```

# 制限事項

* デコード時に、コピーペーストした文字列が文字化けして正常に動作しない環境があります。
  コピーペーストでは正常に動作しない場合は、パイプやファイルを経由してデコードしてください。
* テストが十分ではありません。各自の責任の下で実行してください。

# 参考資料

* －(横線)難読化シェル芸LT資料  
  https://speakerdeck.com/msr_i386/horizon
* Glyph Wiki  
  https://glyphwiki.org/
