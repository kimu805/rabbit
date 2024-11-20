# アプリケーション名
rabbit(ラビット)  
http://57.182.107.234/

# アカウント
## Basic認証
・Basic認証ID： admin  
・Basic認証Password： 2222  
## テストアカウント
・名前： rabbit  
・メールアドレス： rabbit@rabbit.com  
・パスワード： 111111  

# 概要
習慣SNSアプリ  
・友人をフォローして、習慣定着のモチベーションアップ。  
・尊敬するあの人をフォローして、自分の人生に良い変化を。  

# 機能一覧
## ユーザー管理機能（devise）
・新規登録  
・編集  
・ログイン  
・ログアウト  
・フォロー  
## タグ管理機能
・一覧  
・詳細  
・作成  
・検索（ransack）  
## プロジェクト管理機能
・一覧（タグ詳細にて）  
・作成  
・編集  
・削除  
・詳細  
・検索（ransack）  
・いいね  
・閲覧回数  
・コメント
## 習慣管理機能
・一覧（プロジェクト詳細にて）  
・作成  
・編集  
・削除  
・詳細  
## 習慣実行状況管理機能
・一覧（プロジェクト詳細にて）  
・編集（true or false）  
・日付検索  
・達成率計算  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/16a6090537ed0ea95a43bfb71588f7dd.png)](https://gyazo.com/16a6090537ed0ea95a43bfb71588f7dd)

# 使用技術  
・フロントエンド  
HTML  
CSS  
JavaScript  

・バックエンド  
ruby 3.2.0  
Ruby on Rails 7.0.0  

・テスト  
RSpec  

・インフラ  
AWS EC2, S3  

・テキストエディタ  
VSCode  

・その他  
バージョン管理：Git,GitHub  
タスク管理：Notion

# 背景
## アプリ名の由来
rabbit（うさぎ）とhabit（習慣）をかけている。  

「急がば回れ」  
人生を変えるのは一時の出来事ではなく、習慣である。  
急ぎたいなら、毎日のコツコツとした習慣によって駆け抜けようという意味を込めた。  
## アプリ作成の背景
僕は毎月2冊程ビジネス書を読み、他人の考えや習慣を取り入れている。  
そんな習慣に興味のある僕は他人の良い習慣を参考にしたいと思っている。  
これは僕だけじゃないのではと思い、開発に着手した。

# 工夫したポイント
## パンくずリストを使用するため設計を階層化。
ユーザーが直感的にどこを参照しているのかを分かりやすくするため。
## 1か所に情報を集約。
プロジェクトの詳細画面に、プロジェクトの概要や習慣の内容、実行状況等  
参照したい情報を1つのページにまとめることで、ユーザー体験の向上を図った。
## 達成率をプロジェクト全体と個々の習慣別に管理。
どの習慣が定着していないか等が一目で分かりやすくなっている。