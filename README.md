## データベース設計
## usersテーブル
|Column         |Type  |Options                  |
|---------------|------|-------------------------|
|nickname       |string|null: false, unique: true|
|email          |string|null: false, unique: true|
|password       |string|null: false              |
### Association
- has_one    :user_data
- has_many   :diary
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
### Association
- has_many :diarys, through: :diary_foods
## diarysテーブル
|Column            |Type   |Options                      |
|------------------|-------|-----------------------------|
|registration_date |date   |null: false                  |
|meal_id           |integer|null: false, foreign_key:true|
|user_id           |integer|null: false, foreign_key:true|
### Association
- belongs_to :user
- has_many   :foods, through: :diary_foods
## diary_foodsテーブル
|Column  |Type   |Options                       |
|--------|-------|------------------------------|
|diary_id|integer|null: false, foreign_key: true|
|food_id |integer|null: false, foreign_key: true|
### Association
- belongs_to :diary
- belongs_to :food
