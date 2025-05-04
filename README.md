## users テーブル
| Column                | Type   | Options     |
| --------------------- |------- | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| birthday              | date   | null: false |

### Association
- has_many :items
- has_many :comments.through:items
- has_many :orders



## items テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| image      | string     | null: false                    |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| tax        | boolean    | null: false                    |
| price      | integer    | null: false                    |
| genre      | integer    | null: false                    |
| quality    | integer    | null: false                    |
| payment    | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| days       | integer    | null: false                    |

### Association
- belongs_to :user
- has_many :comments
- has_one :order



## comments テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item



## orders テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- had_one :address



## addressテーブル
| Column        | Type      | Options                        |
| ------------- | --------- | -------------------------------|
| postal _code  | string    | null: false                    |
| prefecture    | integer   | null: false                    |
| city          | string    | null: false                    |
| house_number  | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| order         | reference | null: false, foreign_key: true |

### Association

- belongs_to :order