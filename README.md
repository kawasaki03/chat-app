# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| culumn   | Type   | Options     | 
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :room_users
- has_many :rooms, through :room_users
- has_many :messages
 

## roomsテーブル

| culumn   | Type   | Options     | 
| -------- | ------ | ----------- |
| name     | string | null: false |

### Association
- has_many :room_users
- has_many :users,through :room_users
- has_many :messages


## room_users テーブル

| culumn   | Type   | Options                        | 
| -------- | ------ | ------------------------------ |
| user     | string | null: false, foreign_key: true |
| room     | string | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

## messageテーブル

| culumn   | Type       | Options                             | 
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
- belongs_to room
- belongs_to user

