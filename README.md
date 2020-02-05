# README

## 1.OutPutBlogの概要
- コメント、いいね機能、画像投稿ができるブログアプリです。
- URL http://3.115.40.134
- for viewingよりご覧いただけますが、全機能を使うためにはログインが必要です。  
  機能を確認したい場合は下記のアカウントでログインをお願いいたします。  
  TEST用アカウント  
  Email: ironman@gmail.com  
  Password: 111111  

## 2.アプリケーション機能一覧
- index
<img width="1440" alt="スクリーンショット 2020-02-05 14 44 54" src="https://user-images.githubusercontent.com/57931839/73814372-326a3600-4826-11ea-821d-a3ffa56300f8.png">

- 記事投稿,編集,削除
- ユーザー登録、編集(アカウント名、Emailアドレス、アイコン画像、パスワード)
- 記事に対してのコメント機能(ajax使用)
- いいね機能(ajax使用)
- ページネーション

## 3.使用している技術一覧
- 上記一覧です。

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