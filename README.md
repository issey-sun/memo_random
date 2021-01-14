# README
## users テーブル
  Association
  has_many :memos
  has_many :comments
  has_many :active_notifications, foreign_key:"visitor_id", class_name: "Notification", dependent: :destroy
  has_many :passive_notifications, foreign_key:"visited_id", class_name: "Notification", dependent: :destroy

| Column              | Type  | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| encrypted_password | string | null: false |

## memos テーブル
  Association
  belongs_to :user
  has_many :comments
  has_many :notifications, dependent: :destroy

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| title      | text       | null: false       |
| introduce  | text       |                   |
| image      |            |                   |
| day        | date       | foreign_key: true |
| user       | references | foreign_key: true |

## comments テーブル
  Association
  belongs_to :user
  belongs_to :memo
  has_many :notifications, dependent: :destroy

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | foreign_key: true |
| memo      | references | foreign_key: true |

## Notificationsテーブル
  Association
  belongs_to :visitor, class_name: "User", optional: true
  belongs_to :visited, class_name: "User", optional: true
  belongs_to :memo, optional: true
  belongs_to :comment, optional: true

| Column     | Type       | Options                                        |
| ---------- | ---------- | ---------------------------------------------- |
| visitor    | references | foreign_key: { to_table: :users }, null: false |
| visited    | references | foreign_key: { to_table: :users }, null: false |
| memo       | references | foreign_key: true                              |
| comment    | references | foreign_key: true                              |
| action     | string     | null: false                                    |
| checked    | checked    | null: false, default: false                    |
