---
title: "3D Plot"
date: 2019-07-31T09:36:04+09:00
description: "Simple plotter by OpenGL"
draft: false
---

## 概要
OpenGL を利用したシンプルなプロッターです。グラフの回転、ズームイン・アウト、データのスケール調整、系列毎に色分け表示といった機能があります。アニメーション機能もあります。

## 動作環境
Windows XP以降で動作します。Visual C++ 2005 でビルドしています。

## 使用方法
3dplot.exe を起動します。ファイルメニューの「開く」を使ってデータファイルを指定するか、直接ドラッグ・ドロップもできます。マウスドラッグにあわせてデータを回転させることができます。F5でズームイン、F6でズームアウトです。

データファイルは、タブまたはスペースで区切られたテキスト形式です。

```
/  コメント行
#コメント行

0246 3013 0000
0196 2963 0001
0022 2632 0004
:  データ区切り文字（色分け表示の境目）
0008 2549 0005
0000 2370 0006
```

{{< figure src="/images/software/angle1.jpg" >}}

{{< figure src="/images/software/angle2.jpg" >}}

{{< figure src="/images/software/fog.jpg" >}}

フォグ効果を使えば、データの遠近関係がわかりやすくなります。

## ThinkPadの加速度センサーによる操作
ThinkPad のハードディスク保護のための加速度センサーから PC の傾きを検出し、座標系を回転させることができます。(X40 でしか動作確認していません。)

{{< youtube -GxdDLJKh9w >}}

<br>

<iframe class="hatenablogcard" style="width:100%;height:155px;max-width:600px;" title="kondoumh/3dplot" src="https://hatenablog-parts.com/embed?url=https://github.com/kondoumh/3dplot" width="300" height="150" frameborder="0" scrolling="no"></iframe>