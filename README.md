# FitMan
<img width="815" alt="スクリーンショット 2020-07-06 10 01 57 1" src="https://user-images.githubusercontent.com/60637518/86546418-cc6a1200-bf6f-11ea-8d40-c8c8d513db32.png">

## 概要
肉体改造したい方へ、増量でも減量でも力になれるアプリ。 目標体重と達成までの期間から1日の目標摂取カロリーを素早く算出してくれます。 フード登録機能で1日のカロリー管理が簡単且つ正確に把握することができます。
## 制作背景
トレーニング仲間から、既存のアプリで毎日カロリー計算をしているが、食べ物を1つ追加・削除するたびに更新が入り、都度時間がかかるので改良したアプリが欲しいという提案を受けたので制作しました。
## App URL
https://www.fitman-app.xyz/<br>
誰でも登録なしでログインできます。

## Demo
- **1日の摂取カロリー計算**<br>
食べたものを登録することでその日の摂取カロリーが簡単に把握できます。
<img width="629" alt="スクリーンショット 2020-07-06 10 54 28" src="https://user-images.githubusercontent.com/60637518/86548616-093a0700-bf78-11ea-8cb6-ab2cf28419c6.png">
<img width="629" alt="スクリーンショット 2020-07-06 10 49 36" src="https://user-images.githubusercontent.com/60637518/86548286-cdeb0880-bf76-11ea-923c-81b13df1d61d.png">

- **消費カロリー計算**<br>
個人の1日の消費カロリーを計算します。
<img width="561" alt="スクリーンショット 2020-07-06 11 14 16" src="https://user-images.githubusercontent.com/60637518/86549201-eb6da180-bf79-11ea-8e19-b999a7d0a263.png">

- **目標摂取カロリー計算**<br>
「消費カロリー、目標体重、期間」を踏まえ、1日の目標摂取カロリーを計算します。
<img width="562" alt="スクリーンショット 2020-07-06 11 20 20" src="https://user-images.githubusercontent.com/60637518/86549482-b746b080-bf7a-11ea-9f68-109d61fa8f8f.png">

- **その日の摂取カロリーをcsvファイルで出力**<br>
スプレッドシート等で使用可能で、ユーザーがデータを自由に使用できます。
<img width="567" alt="スクリーンショット 2020-07-06 11 28 24" src="https://user-images.githubusercontent.com/60637518/86550444-55d41100-bf7d-11ea-96dd-5b3e070543d8.png">
<img width="379" alt="スクリーンショット 2020-07-06 11 41 37" src="https://user-images.githubusercontent.com/60637518/86550609-d1ce5900-bf7d-11ea-8b2f-b41619322a6a.png">

- **レスポンシブデザイン**<br>
携帯等でも使用できるようにレスポンシブ対応もしております。
<img width="318" alt="スクリーンショット 2020-07-06 11 50 50" src="https://user-images.githubusercontent.com/60637518/86551143-3c33c900-bf7f-11ea-827d-7292d46d4869.png">

## 開発環境
- 言語 ： Ruby, javascript(jQuery)
- フレームワーク ： Ruby on Rails
- ミドルウェア ： MySQL / Nginx
- インフラ : AWS / EC2 / S3 / Route53 / RDS
- ソース管理 ： Git
<p align="center">
<img src="https://user-images.githubusercontent.com/61145524/79036157-71d74900-7c00-11ea-87b3-1647d11584c6.jpeg" width="170px"><img src="https://user-images.githubusercontent.com/61145524/79036184-b7941180-7c00-11ea-8d0b-b607d112ee36.png" width="130px"><img src="https://user-images.githubusercontent.com/61145524/79036135-1d33ce00-7c00-11ea-8598-1b8f402c0f7f.png" width="140px">&emsp;<img src="https://user-images.githubusercontent.com/61145524/84590684-a9b67300-ae73-11ea-93a3-287da9cd9800.png" width="140px">
</p>
<p align="center">
<img src="https://user-images.githubusercontent.com/61145524/79036217-25403d80-7c01-11ea-830c-1a652dde6fe3.png" width="130px"><img src="https://user-images.githubusercontent.com/61145524/79036400-db585700-7c02-11ea-945a-fb3b6d576c76.png" width="110px"><img src="https://user-images.githubusercontent.com/61145524/79036422-fcb94300-7c02-11ea-89c5-ecaf7c0c1a9b.jpg" width="150px">
<img src="https://user-images.githubusercontent.com/61145524/84590644-56dcbb80-ae73-11ea-8830-87e0b761b469.png" width="65px">
</p>








## データベース設計
## usersテーブル
|Column         |Type  |Options                  |
|---------------|------|-------------------------|
|nickname       |string|null: false, unique: true|
|email          |string|null: false, unique: true|
|password       |string|null: false              |
### Association
- has_one    :user_data

## user_dataテーブル
|Column         |Type      |Options                            |
|---------------|----------|-----------------------------------|
|gender         |integer   |null: false                        |
|birthday       |date      |null: false                        |
|weight         |decimal   |null: false, precision: 4, scale: 1|
|life_index_id  |integer   |null: false, foreign_key:true      |
|burn_calorie   |integer   |null: false                        |
|goal_weight    |decimal   |null: false, precision: 4, scale: 1|
|goal_period    |integer   |null: false                        |
|intake_calorie |string    |null: false                        |
|user_id        |references|null: false, foreign_key:true      |
### Association
- belongs_to :user, dependent: :destroy

## foodsテーブル
|Column         |Type   |Options                  |
|---------------|-------|-------------------------|
|name           |text   | |
|calorie        |integer| |
|carbo          |integer| |
|fat            |integer| |
|protein        |integer| |
|quantity       |text   | |
