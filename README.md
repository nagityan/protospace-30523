# README


## usersテーブル
|  Column  |  type  |  Options|
| ---- | ---- | ---- |
|  name  |  string  | null: false|
|  email  |  string  | null: false|
|  password  |  string  | null: false|
|  profile  |  text  | null: false|
|  occupation  |  text  | null: false|
|  position  |  text  | null: false|

### Association
- has_many :comments
- has_many :prototypes


## commentsテーブル
|  Column  |  type  |  Options|
| ---- | ---- | ---- |
|  text  |  string  | null: false|
|  user_id  |  reference  | null: false,foreign_key: true|
|  prototype_id  |  reference  | null: false,foreign_key: true|

### Association
- belongs :user
- belongs :prototype


## prototypesテーブル
|  Column  |  type  |  Options|
| ---- | ---- | ---- |
|  title  |  string  | null: false|
|  catch_copy  |  text  | null: false|
|  concept  |  text  | null: false|
|  user_id  |  reference  | null: false,foreign_key: true|


### Association
- belongs :user
- has_many :comments