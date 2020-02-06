## 1.OutPutBlogの概要
- コメント、いいね機能、画像投稿ができるブログアプリです。
- URL http://3.115.40.134
- for viewingよりご覧いただけますが、全機能を使うためにはログインが必要です。  
  機能を確認したい場合は、お手数ですが下記のアカウントでログインをお願いいたします。  
  TEST用アカウント  
  Email: ironman@gmail.com  
  Password: 111111  

## 2.制作背景
- ブログはCRUDの基本を学べるアプリだと思います。  
  まだ、基礎的なことも理解できていなかったので基礎固めとしてブログを作ることにしました。  
  作成しているうちにこれがあったらいいなと思う機能をつけていきカスタムしていくことで勉強していくことができました。
  ブログを制作すること自体が学習のアウトプットになり、また、技術的なことも書いて行けたらと思い制作しました。

## 3.アプリケーション機能一覧
- 記事投稿,編集,削除
- 画像の投稿
- ユーザー登録、編集(アカウント名、Emailアドレス、アイコン画像、パスワード)
- ユーザー別投稿一覧ページ
- 記事に対してのコメント機能(ajax使用)
- いいね機能(ajax使用)
- ページネーション
- basic認証

## 4.使用技術一覧
- OutPutBlog index画面及び使用技術一覧
<img width="1440" alt="スクリーンショット 2020-02-05 16 03 12" src="https://user-images.githubusercontent.com/57931839/73818622-1324d600-4831-11ea-9dcb-4130e5f12372.png">

- デプロイ方法  
  capistranoを使用した自動デプロイ  
  画像保存先S3

## 5.苦労した点
- コメントの非同期通信実装の際に、空文字でも送信できてしまっていて  
  どのようにしたらそれを防げるのかがわからなかった。  
  必死に調べていきreturn false;を使用すればよいとわかり実装できた。  

- awsデプロイ時にどこかで間違えデプロイできなくなってしまった。  
  今までできていたのにできなくなり色々試したができず。  
  知識も全然ないので対応が取れず、一から作り直したほうが早いと思い再作成しデプロイさせた。  

## 6.今後実装していきたい機能
- コメントを現在非同期で動かしていますが、チャットみたいにしたら面白いかなと思っています。
- タグ付け
- 画像の投稿枚数のアップ

## 7.DB設計
- ER図
![ERD](https://user-images.githubusercontent.com/57931839/73133491-a9f0d600-406c-11ea-9d7f-a2d93de3fbaa.jpeg)

## usersテーブル
|Column|Type|options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|string||

### Associatioin
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|options|
|------|----|-------|
|title|string|null: false|
|content|string|null :false|
|user_id|integre|null :false|
|image|string||
|likes_count|integer||

###  Associatioin
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy

## commentsテーブル
|Column|Type|options|
|------|----|-------|
|user_id|integer||
|post_id|integer||
|text|text|null: false|

###  Associatioin
- belongs_to :user
- belongs_to :post

## lilesテーブル
|Column|Type|options|
|------|----|-------|
|user|references|foreign_key: true|
|post|references|foreign_key: true|

###  Associatioin
- belongs_to :user
- belongs_to :post, counter_cache: :likes_count