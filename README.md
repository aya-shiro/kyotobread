# Kyoto Bread

## サイト概要:京都府内のパンを検索・閲覧・投稿できるサイト
### サイトテーマ:
京都パン×レビュー

### テーマを選んだ理由
京都のベーカリーショップでのパンとの出会いを共有・記録するサイトを作りたいと考えたため。
個人店や昔ながらの店舗も多いので、京都での新しい楽しみ方のひとつとして、京都で過ごした思い出をパンとともに持ち帰ってもらいたいという思いで選びました。

### ターゲットユーザ
パン好きの人はもちろん、京都や京都近隣に住む人・旅行や遊びで来た人等々どなたでもご利用いただけます。

### 主な利用シーン
京都に遊びに来た時、京都府内のパン屋に行く前や行った後

## 設計書
- ER図:  https://drive.google.com/file/d/1Xy1AH1J3M1RMIduBtNXyn3KJFpx8c5rJ/view?usp=share_link
- テーブル定義書:　https://docs.google.com/spreadsheets/d/1tYZ9WfvFt7-AV8eH4l1Fc1phKBqG2fr_vvqEIAe4oO4/edit?usp=sharing

## 開発環境
- OS：Linux(Amazon Linux2)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- FontAwesome(ver.5.15.4):  https://fontawesome.com/
- pixabay:  https://pixabay.com/ja/

## インストール
- $ rails db:migrate
- $ rails db:seed
- $ bundle install