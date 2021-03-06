---
title: "iEdit tools"
date: 2019-07-31T21:44:04+09:00
description: "Tools for iEdit"
images: ["/images/iedit/iedit_icon.png"]
draft: false
---

## iEdit 用シェイプファイル(アルバトロスさん作)

アルバトロスさんが[ホームページ](http://www2u.biglobe.ne.jp/~albatros/index.htm)で [iEdit を紹介](http://www2u.biglobe.ne.jp/~albatros/iEdit.htm)してくださっています(感謝)。紹介ページで、iEdit用のメタファイル(ies形式)を公開されています。フローチャート用とUML用があります。使いやすいので私も利用させていただいてます。このメタファイルですが、ノードを拡大しても、線の太さが変わりません。Excelのシェイプなどからメタファイルを登録すると拡大すると線の幅も変わってしまうのですが、アルバトロスさんのメタファイルは違う作り方のようです。

アルバトロスさんの許諾を得て、同シェイプファイルを、iEdit の配布用バイナリーに同梱させていただいてます。

{{< figure src="/images/iedit/iEditS2.png" >}}

## iEdit XML用スタイルシート(貝塚さん作)
貝塚さんが開発された、iEditのXMLデータ用のスタイルシート(XSL)です。階層構造を反映したXMLファイルのスタイル付けをおこないます。リンクのFrom Toもちゃんと反映されていて素敵です(Internet Explorerではうまく表示されますが、Firefoxだと表示されませんでした)。iEditバージョン1.40でXML出力時のスタイルシートの指定とノードのレベル値の出力を可能とし、貝塚さんのXSLに対応しました。

- [サンプル iEdit ファイル](sample.ied)
- [生成されたスタイル付き XML](sample.xml)
- [スタイルシート XSL](iedit.xsl)
- [背景用画像](iEditBlue.gif)

## WZ2RTF(蒼月さん作)
蒼月さんが開発された、WZ階層付テキストから章立て付RTFファイルを生成するツールです。iEditのエクスポート機能で出力されるtxt形式のファイルから章立てのRTFを作ってくれます。

iEditには章立てでアウトラインを出力する機能がありませんので、それを補完するツールとしても使えると思います。今後機能を充実する予定だそうです。

動作には.NET Frameworkのインストールが必要です。

このツールはiEdit専用ツールではなく、WZ階層付テキストの出力ができるソフトならなんでもOKな汎用ツールなのですが、ここに紹介させていただきます。

[蒼月さんのサイト](http://www.sougetu.net/)から[ダウンロード](http://www.sougetu.net/program/wz2rtf%e3%80%80iedit%E3%81%AE%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E5%87%BA%E5%8A%9B%E3%83%87%E3%83%BC%E3%82%BF%E3%82%92rtf%E3%81%AB%E5%A4%89%E6%8F%9B)してください