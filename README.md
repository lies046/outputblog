# README
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