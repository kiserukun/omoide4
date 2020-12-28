# アプリケーション名:momentary memories
# アプリケーション概要:共有したいメンバーを決めて写真投稿、チャット投稿ができます。画像を複数枚投稿できます。
# URL	デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
# テスト用アカウント:email/22@222  Pass/11111q
# 利用方法:新規登録画面で新規ユーザーを作成します。チャット画面の左上の「ルーム作成」をクリックします。「タイトル」を決め「チャットメンバー」を選択、「Create Room」をクリックします。サイドバーに先ほど作成したタイトルがあるので、そこをクリックします。
#         右下の投稿ボタンをクリックします。「思い出」にコメントが書けます。「画像」に写真を貼れます。その後、「送信」ボタンをクリックします。ルームを削除したい場合右上の「削除」を押します。左上の自分の名前をクリックすると名前とメールアドレスを編集できます。
#        「ログアウト」で退出、「チャットページに戻る」でチャット画面に戻ります。
# 目指した課題解決:思い出の写真を２人で共有したい人のためアプリです。カップルで旅行した写真のアルバム。夫婦だけの子供の成長記録アルバム。二人だけの秘密のアルバムなど思い出を二人だけで完結したいと思っている人のためのアプリです。
# 洗い出した要件:ユーザー管理機能、ルーム作成機能、写真付きメッセージ投稿機能
# 実装した機能について：ユーザーはログイン、ログアウトができます。ユーザー情報を編集することができます。ルームタイトルを付けれます。メンバーを選択できます。ルーム作成、削除できます。チャット、写真を投稿することができます。
# 実装予定の機能:メンバーの数を6人まで増やすことができるようにしたいです。写真の詳細ページから編集と削除、写真の拡大機能をつけたいと思っています。
# データベース設計:ER.dioに記載しています。
# ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。



# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user